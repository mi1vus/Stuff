using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DbContextAutoGenerated.Models.Mapping
{
    public class WfwDocumentWorkStageMap : EntityTypeConfiguration<WfwDocumentWorkStage>
    {
        public WfwDocumentWorkStageMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.CoordinatorSid)
                .HasMaxLength(46);

            // Table & Column Mappings
            this.ToTable("WfwDocumentWorkStages");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.ExecutionId).HasColumnName("ExecutionId");
            this.Property(t => t.Level).HasColumnName("Level");
            this.Property(t => t.RoleId).HasColumnName("RoleId");
            this.Property(t => t.CoordinatorSid).HasColumnName("CoordinatorSid");
            this.Property(t => t.Date).HasColumnName("Date");
            this.Property(t => t.ResultId).HasColumnName("ResultId");
            this.Property(t => t.Comment).HasColumnName("Comment");
            this.Property(t => t.Enabled).HasColumnName("Enabled");

            // Relationships
            this.HasRequired(t => t.WfwDocumentExecution)
                .WithMany(t => t.WfwDocumentWorkStages)
                .HasForeignKey(d => d.ExecutionId);
            this.HasOptional(t => t.WfwEventsResult)
                .WithMany(t => t.WfwDocumentWorkStages)
                .HasForeignKey(d => d.ResultId);

        }
    }
}