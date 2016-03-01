using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DbContextStuffAutoGenerated.Models.Mapping
{
    public class vendor_state_picturesMap : EntityTypeConfiguration<vendor_state_pictures>
    {
        public vendor_state_picturesMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.file_data)
                .IsRequired();

            this.Property(t => t.file_name)
                .IsRequired()
                .HasMaxLength(500);

            // Table & Column Mappings
            this.ToTable("vendor_state_pictures");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.id_vendor_state).HasColumnName("id_vendor_state");
            this.Property(t => t.file_data).HasColumnName("file_data");
            this.Property(t => t.enabled).HasColumnName("enabled");
            this.Property(t => t.file_fuid).HasColumnName("file_fuid");
            this.Property(t => t.file_name).HasColumnName("file_name");
        }
    }
}