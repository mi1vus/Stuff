using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using DAL.Entities.Models;

namespace DAL.Entities.Mapping
{
    public class DocumentMap : EntityTypeConfiguration<Document>
    {
        public DocumentMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.Id)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Name)
                .IsRequired()
                .HasMaxLength(200);

            // Table & Column Mappings
            this.ToTable("Documents");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Name).HasColumnName("Name");
            this.Property(t => t.LinkToDoc).HasColumnName("LinkToDoc");
            this.Property(t => t.LinkToDocId).HasColumnName("LinkToDocId");
            this.Property(t => t.TypeId).HasColumnName("TypeId");
            this.Property(t => t.ExecutionId).HasColumnName("ExecutionId");
            this.Property(t => t.Enabled).HasColumnName("Enabled");

            // Relationships
            this.HasOptional(t => t.WfwDocumentExecution)
                .WithMany(t => t.Documents)
                .HasForeignKey(d => d.ExecutionId);
            this.HasRequired(t => t.DocumentType)
                .WithMany(t => t.Documents)
                .HasForeignKey(d => d.TypeId);

        }
    }
}