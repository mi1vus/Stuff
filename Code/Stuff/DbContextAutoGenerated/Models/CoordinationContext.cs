using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using DbContextAutoGenerated.Models.Mapping;

namespace DbContextAutoGenerated.Models
{
    public partial class CoordinationContext : DbContext
    {
        static CoordinationContext()
        {
            Database.SetInitializer<CoordinationContext>(null);
        }

        public CoordinationContext()
            : base("Name=CoordinationContext")
        {
        }

        public DbSet<Document> Documents { get; set; }
        public DbSet<DocumentType> DocumentTypes { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<WfwDocumentExecution> WfwDocumentExecutions { get; set; }
        public DbSet<WfwDocumentWorkScheme> WfwDocumentWorkSchemes { get; set; }
        public DbSet<WfwEventsResult> WfwEventsResults { get; set; }
        public DbSet<WfwExecutionEvent> WfwExecutionEvents { get; set; }
        public DbSet<WfwScheme> WfwSchemes { get; set; }
        public DbSet<WfwSchemeStage> WfwSchemeStages { get; set; }
        public DbSet<EmployeeAlternate> EmployeeAlternates { get; set; }
        public DbSet<EmployeeRole> EmployeeRoles { get; set; }
        public DbSet<Employee> Employees { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new DocumentMap());
            modelBuilder.Configurations.Add(new DocumentTypeMap());
            modelBuilder.Configurations.Add(new sysdiagramMap());
            modelBuilder.Configurations.Add(new WfwDocumentExecutionMap());
            modelBuilder.Configurations.Add(new WfwDocumentWorkSchemeMap());
            modelBuilder.Configurations.Add(new WfwEventsResultMap());
            modelBuilder.Configurations.Add(new WfwExecutionEventMap());
            modelBuilder.Configurations.Add(new WfwSchemeMap());
            modelBuilder.Configurations.Add(new WfwSchemeStageMap());
            modelBuilder.Configurations.Add(new EmployeeAlternateMap());
            modelBuilder.Configurations.Add(new EmployeeRoleMap());
            modelBuilder.Configurations.Add(new EmployeeMap());
        }
    }
}
