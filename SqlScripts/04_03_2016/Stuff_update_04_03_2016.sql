/*
Run this script on:

        UC-1573.Stuff    -  This database will be modified

to synchronize it with:

        UC-1573.Stuff

You are recommended to back up your database before running this script

Script created by SQL Compare version 10.3.8 from Red Gate Software Ltd at 04.03.2016 13:42:01

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
PRINT N'Write not "" ad_sid [dbo].[employees]'
GO
UPDATE [dbo].[employees] SET 
        [ad_sid] = NEWID() 
WHERE [ad_sid] = '' OR [ad_sid] IS NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[employees]'
GO
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [PK__tmp_ms_x__3213E83F797309D9]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[employees]'
GO
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [DF__employees__ad_si__03F0984C]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[employees]'
GO
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [DF__tmp_ms_xx__enabl__7C4F7684]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[employees]'
GO
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [DF__tmp_ms_xx__datti__7D439ABD]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[employees]'
GO
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [DF__tmp_ms_xx__datti__7E37BEF6]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[employees]'
GO
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [DF__tmp_ms_xx___male__7F2BE32F]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[employees]'
GO
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [DF__tmp_ms_xx__has_a__00200768]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping constraints from [dbo].[employees]'
GO
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [DF__employees__newvb__4A4E069C]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping index [IX_employee_ad_sid] from [dbo].[employees]'
GO
DROP INDEX [IX_employee_ad_sid] ON [dbo].[employees]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Dropping index [IX_employee_enabled] from [dbo].[employees]'
GO
DROP INDEX [IX_employee_enabled] ON [dbo].[employees]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[employeeAlternates]'
GO
CREATE TABLE [dbo].[employeeAlternates]
(
[Id] [int] NOT NULL IDENTITY(1000, 1),
[EmployeeSid] [varchar] (46) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AlternateEmployeeSid] [varchar] (46) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[Notify] [bit] NOT NULL CONSTRAINT [DK_EmployeeAlternates_Notify] DEFAULT ((1)),
[Unlimited] [bit] NULL,
[Enabled] [bit] NOT NULL CONSTRAINT [DK_EmployeeAlternates_Enabled] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_EmployeeAlternates] on [dbo].[employeeAlternates]'
GO
ALTER TABLE [dbo].[employeeAlternates] ADD CONSTRAINT [PK_EmployeeAlternates] PRIMARY KEY CLUSTERED  ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[employeeRoles]'
GO
CREATE TABLE [dbo].[employeeRoles]
(
[Id] [int] NOT NULL IDENTITY(1000, 1),
[Name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmployeeSid] [varchar] (46) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Enabled] [bit] NOT NULL CONSTRAINT [DK_EmployeeRoles_Enabled] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_EmployeeRoles] on [dbo].[employeeRoles]'
GO
ALTER TABLE [dbo].[employeeRoles] ADD CONSTRAINT [PK_EmployeeRoles] PRIMARY KEY CLUSTERED  ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[request_reasons]'
GO
CREATE TABLE [dbo].[request_reasons]
(
[Id] [int] NOT NULL IDENTITY(1000, 1),
[Name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Enabled] [bit] NOT NULL CONSTRAINT [DK_request_reasons_Enabled] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_request_reasons] on [dbo].[request_reasons]'
GO
ALTER TABLE [dbo].[request_reasons] ADD CONSTRAINT [PK_request_reasons] PRIMARY KEY CLUSTERED  ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[request_statuses]'
GO
CREATE TABLE [dbo].[request_statuses]
(
[Id] [int] NOT NULL IDENTITY(1000, 1),
[Name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Enabled] [bit] NOT NULL CONSTRAINT [DK_request_statuses_Enabled] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_request_statuses] on [dbo].[request_statuses]'
GO
ALTER TABLE [dbo].[request_statuses] ADD CONSTRAINT [PK_request_statuses] PRIMARY KEY CLUSTERED  ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[requests]'
GO
CREATE TABLE [dbo].[requests]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[id_position] [int] NULL,
[id_reason] [int] NULL,
[aim] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sid_manager] [varchar] (46) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sid_teacher] [varchar] (46) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id_department] [int] NULL,
[is_subordinates] [bit] NULL,
[subordinates] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[functions] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[interactions] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[is_instructions] [bit] NULL,
[success_rates] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_to_test] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_after_test] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[work_place] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[work_mode] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[holiday] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hospital] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[business_trip] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[overtime_work] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[compensations] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[probation] [int] NULL,
[salary_to_test] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[salary_after_test] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bonuses] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sex] [bit] NULL,
[age_from] [int] NULL,
[age_to] [int] NULL,
[education] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_work] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[requirements] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[knowledge] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[suggestions] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[workplace] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[is_furniture] [bit] NULL,
[furniture] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[is_pc] [bit] NULL,
[is_telephone] [bit] NULL,
[is_ethalon] [bit] NULL,
[appearance] [date] NULL,
[create_datetime] [datetime] NULL,
[last_change_datetime] [datetime] NULL,
[sid_contact_person] [varchar] (46) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sid_responsible_person] [varchar] (46) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id_status] [int] NOT NULL,
[HaveCoordination] [bit] NOT NULL CONSTRAINT [DK_requests_HaveCoordination] DEFAULT ((0)),
[CoordinationPaused] [bit] NOT NULL CONSTRAINT [DK_requests_CoordinationStoped] DEFAULT ((0)),
[Enabled] [bit] NOT NULL CONSTRAINT [DK_requests_Enabled] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_requests] on [dbo].[requests]'
GO
ALTER TABLE [dbo].[requests] ADD CONSTRAINT [PK_requests] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_employees] on [dbo].[employees]'
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED  ([ad_sid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [IX_employee_enabled] on [dbo].[employees]'
GO
CREATE NONCLUSTERED INDEX [IX_employee_enabled] ON [dbo].[employees] ([enabled] DESC)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [IX_employee_id] on [dbo].[employees]'
GO
CREATE NONCLUSTERED INDEX [IX_employee_id] ON [dbo].[employees] ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding constraints to [dbo].[employeeAlternates]'
GO
ALTER TABLE [dbo].[employeeAlternates] ADD CONSTRAINT [CK_EmployeeAlternates_Date_Unlimited] CHECK (([StartDate] IS NOT NULL AND [EndDate] IS NOT NULL AND ([Unlimited] IS NULL OR [Unlimited]=(0)) OR [StartDate] IS NULL AND [EndDate] IS NULL AND [Unlimited] IS NOT NULL AND [Unlimited]=(1)))
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding constraints to [dbo].[employeeRoles]'
GO
ALTER TABLE [dbo].[employeeRoles] ADD CONSTRAINT [AK_EmployeeRoles_Name] UNIQUE NONCLUSTERED  ([Name])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding constraints to [dbo].[employees]'
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [DF__tmp_ms_xx__ad_si__24134F1B] DEFAULT (newid()) FOR [ad_sid]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [DF__tmp_ms_xx__enabl__25077354] DEFAULT ((1)) FOR [enabled]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [DF__tmp_ms_xx__datti__25FB978D] DEFAULT (getdate()) FOR [dattim1]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [DF__tmp_ms_xx__datti__26EFBBC6] DEFAULT ('3.3.3333') FOR [dattim2]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [DF__tmp_ms_xx___male__27E3DFFF] DEFAULT ((1)) FOR [male]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [DF__tmp_ms_xx__has_a__28D80438] DEFAULT ((0)) FOR [has_ad_account]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
ALTER TABLE [dbo].[employees] ADD CONSTRAINT [DF__tmp_ms_xx__newvb__29CC2871] DEFAULT ((0)) FOR [newvbie_delivery]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[employeeAlternates]'
GO
ALTER TABLE [dbo].[employeeAlternates] ADD CONSTRAINT [FK_EmployeeAlternates_Employee_EmployeeId] FOREIGN KEY ([EmployeeSid]) REFERENCES [dbo].[employees] ([ad_sid])
ALTER TABLE [dbo].[employeeAlternates] ADD CONSTRAINT [FK_EmployeeAlternates_Employee_AlternateEmployeeId] FOREIGN KEY ([AlternateEmployeeSid]) REFERENCES [dbo].[employees] ([ad_sid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[employeeRoles]'
GO
ALTER TABLE [dbo].[employeeRoles] ADD CONSTRAINT [FK_EmployeeRoles_Employee_EmployeeId] FOREIGN KEY ([EmployeeSid]) REFERENCES [dbo].[employees] ([ad_sid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[requests]'
GO
ALTER TABLE [dbo].[requests] ADD CONSTRAINT [FK_requests_id_contact_person] FOREIGN KEY ([sid_contact_person]) REFERENCES [dbo].[employees] ([ad_sid])
ALTER TABLE [dbo].[requests] ADD CONSTRAINT [FK_requests_id_manager] FOREIGN KEY ([sid_manager]) REFERENCES [dbo].[employees] ([ad_sid])
ALTER TABLE [dbo].[requests] ADD CONSTRAINT [FK_requests_id_responsible_person] FOREIGN KEY ([sid_responsible_person]) REFERENCES [dbo].[employees] ([ad_sid])
ALTER TABLE [dbo].[requests] ADD CONSTRAINT [FK_requests_id_teacher] FOREIGN KEY ([sid_teacher]) REFERENCES [dbo].[employees] ([ad_sid])
ALTER TABLE [dbo].[requests] ADD CONSTRAINT [FK_requests_id_reason] FOREIGN KEY ([id_reason]) REFERENCES [dbo].[request_reasons] ([Id])
ALTER TABLE [dbo].[requests] ADD CONSTRAINT [FK_requests_id_status] FOREIGN KEY ([id_status]) REFERENCES [dbo].[request_statuses] ([Id])
ALTER TABLE [dbo].[requests] ADD CONSTRAINT [FK_requests_id_position] FOREIGN KEY ([id_position]) REFERENCES [dbo].[positions] ([id])
ALTER TABLE [dbo].[requests] ADD CONSTRAINT [FK_requests_id_department] FOREIGN KEY ([id_department]) REFERENCES [dbo].[departments] ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
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
SET IDENTITY_INSERT [dbo].[request_statuses] ON
GO

INSERT INTO [dbo].[request_statuses](Id, Name, Description) 
VALUES 
(1, N'Новая', N'Только созданная заявка')
,(2, N'Согласовано', N'Заявка удачно прошедшая этап согласования')
,(3, N'Отклонено', N'Заявка не удачно прошедшая этап согласования')
,(4, N'В работе', N'Заявка по которой начата работа')
,(5, N'Завершено', N'Заявка по которой завершена работа')
GO

SET IDENTITY_INSERT [dbo].[request_reasons] ON
GO

INSERT INTO [dbo].[request_reasons](Id, Name, Description) 
VALUES 
(1, N'Увольнение', N'')
,(2, N'Расширение', N'')
,(3, N'Открытие филиала', N'')
GO

SET IDENTITY_INSERT [dbo].[request_reasons] OFF
GO

SET IDENTITY_INSERT [dbo].[request_statuses] OFF
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO
