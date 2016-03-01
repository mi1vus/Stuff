using System.Data.Entity.ModelConfiguration;

namespace DALStuff.Models.Mapping
{
    public class document_meet_linksMap : EntityTypeConfiguration<document_meet_links>
    {
        public document_meet_linksMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.creator_sid)
                .IsRequired()
                .HasMaxLength(46);

            this.Property(t => t.deleter_sid)
                .HasMaxLength(46);

            // Table & Column Mappings
            this.ToTable("document_meet_links");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.id_document).HasColumnName("id_document");
            this.Property(t => t.id_department).HasColumnName("id_department");
            this.Property(t => t.id_position).HasColumnName("id_position");
            this.Property(t => t.id_employee).HasColumnName("id_employee");
            this.Property(t => t.dattim1).HasColumnName("dattim1");
            this.Property(t => t.creator_sid).HasColumnName("creator_sid");
            this.Property(t => t.enabled).HasColumnName("enabled");
            this.Property(t => t.dattim2).HasColumnName("dattim2");
            this.Property(t => t.deleter_sid).HasColumnName("deleter_sid");
        }
    }
}