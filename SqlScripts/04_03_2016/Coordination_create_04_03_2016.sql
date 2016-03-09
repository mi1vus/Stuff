/*
Deployment script for DatabaseCoordination

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/
/*GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;

GO
*/
/*
DECLARE Coordination varchar(30) = 'Coordination';
DECLARE [Stuff] varchar(30) = 'test';
*/
GO
USE [master];

GO

IF (DB_ID(N'Coordination') IS NOT NULL) 
BEGIN
    ALTER DATABASE Coordination
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Coordination;
END
GO

PRINT N'Creating Coordination...'

GO
DECLARE @sql NVARCHAR(MAX);
SET @sql = 'CREATE DATABASE Coordination';
EXEC sp_executesql @sql;
GO

/*
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'Coordination')
    BEGIN
        ALTER DATABASE Coordination
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE Coordination
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'Coordination')
    BEGIN
        ALTER DATABASE Coordination
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'Coordination')
    BEGIN
        ALTER DATABASE Coordination
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'Coordination')
    BEGIN
        ALTER DATABASE Coordination
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'Coordination')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE Coordination
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'Coordination')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE Coordination
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE Coordination
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'Coordination')
    BEGIN
        ALTER DATABASE Coordination
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END

*/

/*
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
GO
BEGIN TRANSACTION
GO
*/
USE Coordination;


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[Documents]...';


GO
CREATE TABLE [dbo].[Documents] (
    [Id]          VARCHAR (50)  NOT NULL,
    [LinkToDoc]   VARCHAR (MAX) NULL,
    [LinkToDocId] INT           NOT NULL,
    [Name]        VARCHAR (200) NOT NULL,
    [TypeId]      INT           NOT NULL,
    [ExecutionId] INT           NULL,
    [Enabled]     BIT           NOT NULL,
    CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[DocumentTypes]...';


GO
CREATE TABLE [dbo].[DocumentTypes] (
    [Id]          INT           IDENTITY (1000, 1) NOT NULL,
    [SchemeId]    INT           NOT NULL,
    [Name]        VARCHAR (200) NOT NULL,
    [Description] VARCHAR (MAX) NULL,
    [Enabled]     BIT           NOT NULL,
    CONSTRAINT [PK_DocumentTupes] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [AK_DocumentTupes_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO
PRINT N'Creating [dbo].[WfwDocumentExecutions]...';


GO
CREATE TABLE [dbo].[WfwDocumentExecutions] (
    [Id]         INT                IDENTITY (1, 1) NOT NULL,
    [Level]      INT                NOT NULL,
    [StartDate]  DATETIMEOFFSET (4) NOT NULL,
    [CreaterSid] VARCHAR (46)       COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [EndDate]    DATETIMEOFFSET (4) NULL,
    [Enabled]    BIT                NOT NULL,
    CONSTRAINT [PK_Executions] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[WfwDocumentWorkStages]...';


GO
CREATE TABLE [dbo].[WfwDocumentWorkStages] (
    [Id]             INT                IDENTITY (1, 1) NOT NULL,
    [ExecutionId]    INT                NOT NULL,
    [Level]          INT                NOT NULL,
    [RoleId]         INT                NULL,
    [CoordinatorSid] VARCHAR (46)       COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [Date]           DATETIMEOFFSET (4) NULL,
    [ResultId]       INT                NULL,
    [Comment]        VARCHAR (MAX)      NULL,
    [Enabled]        BIT                NOT NULL,
    CONSTRAINT [PK_WfwDocumentWorkStages] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[WfwEventsResults]...';


GO
CREATE TABLE [dbo].[WfwEventsResults] (
    [Id]          INT           IDENTITY (1000, 1) NOT NULL,
    [Name]        VARCHAR (200) NOT NULL,
    [Description] VARCHAR (MAX) NULL,
    [Success]     BIT           NOT NULL,
    [Enabled]     BIT           NOT NULL,
    CONSTRAINT [PK_WfwEventsResults] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[WfwExecutionEvents]...';


GO
CREATE TABLE [dbo].[WfwExecutionEvents] (
    [Id]                       INT                IDENTITY (1, 1) NOT NULL,
    [WfwDocumentWorkStagesId] INT                NOT NULL,
    [Date]                     DATETIMEOFFSET (4) NOT NULL,
    [CreaterSid]               VARCHAR (46)       COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ResultId]                 INT                NOT NULL,
    [Comment]                  VARCHAR (MAX)      NULL,
    [Enabled]                  BIT                NOT NULL,
    CONSTRAINT [PK_WfwExecutionEvents] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[WfwScheme]...';


GO
CREATE TABLE [dbo].[WfwScheme] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [Name]              VARCHAR (200) NOT NULL,
    [Action]            INT           NOT NULL,
    [ContinueLastStage] BIT           NOT NULL,
    [Enabled]           BIT           NOT NULL,
    CONSTRAINT [PK_WfwScheme] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[WfwSchemeStage]...';


GO
CREATE TABLE [dbo].[WfwSchemeStage] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [Name]           VARCHAR (200) NOT NULL,
    [Level]          INT           NOT NULL,
    [RoleId]         INT           NULL,
    [CoordinatorSid] VARCHAR (46)  COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [SchemeId]       INT           NOT NULL,
    [Enabled]        BIT           NOT NULL,
    CONSTRAINT [PK_WfwSchemeStage] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[DK_Documents_Enabled]...';


GO
ALTER TABLE [dbo].[Documents]
    ADD CONSTRAINT [DK_Documents_Enabled] DEFAULT ((1)) FOR [Enabled];


GO
PRINT N'Creating [dbo].[DK_DocumentTupes_Enabled]...';


GO
ALTER TABLE [dbo].[DocumentTypes]
    ADD CONSTRAINT [DK_DocumentTupes_Enabled] DEFAULT ((1)) FOR [Enabled];


GO
PRINT N'Creating [dbo].[DK_Executions_CREATEDate]...';


GO
ALTER TABLE [dbo].[WfwDocumentExecutions]
    ADD CONSTRAINT [DK_Executions_CREATEDate] DEFAULT (getutcdate()) FOR [StartDate];


GO
PRINT N'Creating [dbo].[DK_Executions_Enabled]...';


GO
ALTER TABLE [dbo].[WfwDocumentExecutions]
    ADD CONSTRAINT [DK_Executions_Enabled] DEFAULT ((1)) FOR [Enabled];


GO
/*
PRINT N'Creating [dbo].[DK_WfwDocumentWorkStages_CREATEDate]...';


GO
ALTER TABLE [dbo].[WfwDocumentWorkStages]
    ADD CONSTRAINT [DK_WfwDocumentWorkStages_CREATEDate] DEFAULT (getutcdate()) FOR [Date];


GO*/
PRINT N'Creating [dbo].[DK_WfwDocumentWorkStages_Enabled]...';


GO
ALTER TABLE [dbo].[WfwDocumentWorkStages]
    ADD CONSTRAINT [DK_WfwDocumentWorkStages_Enabled] DEFAULT ((1)) FOR [Enabled];


GO
PRINT N'Creating [dbo].[DK_WfwEventsResults_Enabled]...';


GO
ALTER TABLE [dbo].[WfwEventsResults]
    ADD CONSTRAINT [DK_WfwEventsResults_Enabled] DEFAULT ((1)) FOR [Enabled];


GO
PRINT N'Creating [dbo].[DK_WfwExecutionEvents_CREATEDate]...';


GO
ALTER TABLE [dbo].[WfwExecutionEvents]
    ADD CONSTRAINT [DK_WfwExecutionEvents_CREATEDate] DEFAULT (getutcdate()) FOR [Date];


GO
PRINT N'Creating [dbo].[DK_WfwExecutionEvents_Enabled]...';


GO
ALTER TABLE [dbo].[WfwExecutionEvents]
    ADD CONSTRAINT [DK_WfwExecutionEvents_Enabled] DEFAULT ((1)) FOR [Enabled];


GO
PRINT N'Creating [dbo].[DK_WfwScheme_Enabled]...';


GO
ALTER TABLE [dbo].[WfwScheme]
    ADD CONSTRAINT [DK_WfwScheme_Enabled] DEFAULT ((1)) FOR [Enabled];


GO
PRINT N'Creating [dbo].[DK_WfwSchemeStage_Enabled]...';


GO
ALTER TABLE [dbo].[WfwSchemeStage]
    ADD CONSTRAINT [DK_WfwSchemeStage_Enabled] DEFAULT ((1)) FOR [Enabled];


GO
PRINT N'Creating [dbo].[FK_Documents_ExecutionId]...';


GO
ALTER TABLE [dbo].[Documents]
    ADD CONSTRAINT [FK_Documents_ExecutionId] FOREIGN KEY ([ExecutionId]) REFERENCES [dbo].[WfwDocumentExecutions] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Documents_TypeId]...';


GO
ALTER TABLE [dbo].[Documents]
    ADD CONSTRAINT [FK_Documents_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[DocumentTypes] ([Id]);


GO
PRINT N'Creating [dbo].[FK_DocumentTypes_ExecutionSchemeId]...';


GO
ALTER TABLE [dbo].[DocumentTypes]
    ADD CONSTRAINT [FK_DocumentTypes_ExecutionSchemeId] FOREIGN KEY ([SchemeId]) REFERENCES [dbo].[WfwScheme] ([Id]);


GO
PRINT N'Creating [dbo].[FK_WfwDocumentWorkStages_WfwDocumentExecutions]...';


GO
ALTER TABLE [dbo].[WfwDocumentWorkStages]
    ADD CONSTRAINT [FK_WfwDocumentWorkStages_WfwDocumentExecutions] FOREIGN KEY ([ExecutionId]) REFERENCES [dbo].[WfwDocumentExecutions] ([Id]);


GO
PRINT N'Creating [dbo].[FK_WfwDocumentWorkStages_ResultId]...';


GO
ALTER TABLE [dbo].[WfwDocumentWorkStages]
    ADD CONSTRAINT [FK_WfwDocumentWorkStages_ResultId] FOREIGN KEY ([ResultId]) REFERENCES [dbo].[WfwEventsResults] ([Id]);


GO
PRINT N'Creating [dbo].[FK_WfwExecutionEvents_WfwDocumentWorkStagesId]...';


GO
ALTER TABLE [dbo].[WfwExecutionEvents]
    ADD CONSTRAINT [FK_WfwExecutionEvents_WfwDocumentWorkStagesId] FOREIGN KEY ([WfwDocumentWorkStagesId]) REFERENCES [dbo].[WfwDocumentWorkStages] ([Id]);


GO
PRINT N'Creating [dbo].[FK_WfwExecutionEvents_WfwEventsResults]...';


GO
ALTER TABLE [dbo].[WfwExecutionEvents]
    ADD CONSTRAINT [FK_WfwExecutionEvents_WfwEventsResults] FOREIGN KEY ([ResultId]) REFERENCES [dbo].[WfwEventsResults] ([Id]);


GO
PRINT N'Creating [dbo].[FK_WfwSchemeStage_WfwScheme]...';


GO
ALTER TABLE [dbo].[WfwSchemeStage]
    ADD CONSTRAINT [FK_WfwSchemeStage_WfwScheme] FOREIGN KEY ([SchemeId]) REFERENCES [dbo].[WfwScheme] ([Id]);


GO
PRINT N'Creating [dbo].[CK_WfwDocumentWorkStages_RoleId_CoordinatorId]...';


GO
ALTER TABLE [dbo].[WfwDocumentWorkStages]
    ADD CONSTRAINT [CK_WfwDocumentWorkStages_RoleId_CoordinatorId] CHECK ([RoleId] IS NOT NULL AND [CoordinatorSid] IS NULL OR [RoleId] IS NULL AND [CoordinatorSid] IS NOT NULL);


GO
PRINT N'Creating [dbo].[CK_WfwSchemeStage_RoleId_CoordinatorId]...';


GO
ALTER TABLE [dbo].[WfwSchemeStage]
    ADD CONSTRAINT [CK_WfwSchemeStage_RoleId_CoordinatorId] CHECK ([RoleId] IS NOT NULL AND [CoordinatorSid] IS NULL OR [RoleId] IS NULL AND [CoordinatorSid] IS NOT NULL);


GO
/*
PRINT N'Creating [dbo].[WfwDocumentExecutionsCreaterIdTrigger]...';

GO
CREATE Trigger [dbo].[WfwDocumentExecutionsCreaterIdTrigger] ON [dbo].[WfwDocumentExecutions] After Insert, Update
AS
BEGIN
   If NOT Exists(SELECT ad_sid FROM [Stuff].[dbo].[employees] WHERE ad_sid in (SELECT CreaterSid FROM inserted)) BEGIN
      -- Handle the Referential Error Here
	  RAISERROR ('Cannot insert [WfwDocumentExecutions] - no [CreaterSid]',16,1)
   END
END*/
GO
PRINT N'Creating [dbo].[WfwDocumentWorkStagesEmployeeRolesTrigger]...';


GO
CREATE Trigger [dbo].[WfwDocumentWorkStagesEmployeeRolesTrigger] ON [dbo].[WfwDocumentWorkStages] After Insert, Update
AS
BEGIN
   If ( NOT EXISTS(SELECT [Id] FROM [Stuff].[dbo].[EmployeeRoles] WHERE [Id] in (SELECT [RoleId] FROM inserted WHERE [RoleId] is not NULL)) ) AND
	  ( NOT Exists(SELECT [ad_sid] FROM [Stuff].[dbo].[employees] WHERE [ad_sid] in (SELECT [CoordinatorSid] FROM inserted WHERE [CoordinatorSid] is not NULL)) ) BEGIN
      -- Handle the Referential Error Here
		RAISERROR ('Cannot insert [WfwDocumentWorkStages] - no [EmployeeRoles] or [CoordinatorSid] ',16,1)
   END
END
GO
/*PRINT N'Creating [dbo].[WfwExecutionEventsCreaterIdTrigger]...';


GO

CREATE Trigger [dbo].[WfwExecutionEventsCreaterIdTrigger] ON [dbo].[WfwExecutionEvents] After Insert, Update
AS
BEGIN
   If NOT Exists(SELECT ad_sid FROM [Stuff].[dbo].[employees] WHERE ad_sid in (SELECT CreaterSid FROM inserted)) BEGIN
      -- Handle the Referential Error Here
	  RAISERROR ('Cannot insert [WfwExecutionEvents] - no [CreaterSid]',16,1)
   END
END*/
GO
PRINT N'Creating [dbo].[WfwSchemeStageEmployeeRolesTrigger]...';


GO
CREATE Trigger [dbo].[WfwSchemeStageEmployeeRolesTrigger] ON [dbo].[WfwSchemeStage] After Insert, Update
AS
BEGIN
   If ( NOT EXISTS(SELECT [Id] FROM [Stuff].[dbo].[EmployeeRoles] WHERE [Id] in (SELECT [RoleId] FROM inserted WHERE [RoleId] is not NULL)) ) AND
	  ( NOT Exists(SELECT [ad_sid] FROM [Stuff].[dbo].[employees] WHERE [ad_sid] in (SELECT [CoordinatorSid] FROM inserted WHERE [CoordinatorSid] is not NULL)) ) BEGIN
      -- Handle the Referential Error Here
		RAISERROR ('Cannot insert [WfwSchemeStage] - no [EmployeeRoles] or [CoordinatorSid] ',16,1)
   END
END
GO
PRINT N'Creating [dbo].[EmployeeAlternates]...';


GO
CREATE VIEW [EmployeeAlternates]
AS
SELECT 
	[Id],
	[EmployeeSid],
	[AlternateEmployeeSid],
	[StartDate],
	[EndDate],
	[Notify],
	[Unlimited],
	[Enabled]
	FROM [Stuff].[dbo].[employeeAlternates]
GO
PRINT N'Creating [dbo].[EmployeeRoles]...';


GO
CREATE VIEW [EmployeeRoles]
AS
SELECT
	[Id],
	[Name],
	[EmployeeSid],
	[Enabled]
	FROM [Stuff].[dbo].[employeeRoles]
GO
PRINT N'Creating [dbo].[Employees]...';


GO

CREATE VIEW [dbo].[Employees] 
AS
SELECT 	
	[id],
	[ad_sid],
	[id_manager],
	[surname],
	[name],
	[patronymic],
	[full_name],
	[display_name],
	[id_position],
	[id_organization],
	[email],
	[work_num],
	[mobil_num],
	[id_emp_state],
	[id_department],
	[id_city],
	[enabled],
	[dattim1],
	[dattim2],
	[date_came],
	[birth_date],
	[male],
	[id_position_org],
	[hAS_ad_account],
	[creator_sid],
	[ad_login],
	[date_fired],
	[full_name_dat],
	[full_name_rod],
	[newvbie_delivery],
	[id_budget]
	FROM [Stuff].[dbo].[employees]
GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

SET IDENTITY_INSERT [dbo].[WfwEventsResults] ON
GO

INSERT INTO [dbo].[WfwEventsResults]([Id], [Name], [Description], [Success]) 
VALUES 
(1, N'��������', N'���� ���� ��������',1)
,(2, N'�� ���������', N'������� �������� �� ��������� ��� ���������',0)
,(3, N'������������� ���������', N'��������� ��� ������ � �� ���������� �� ��� ������',0)

GO

SET IDENTITY_INSERT [dbo].[WfwEventsResults] OFF
GO

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'Coordination', 'ON';
    END
GO

IF @@ERROR = 0 BEGIN
PRINT 'The database update succeeded'
--COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO

