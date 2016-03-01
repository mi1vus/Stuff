using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DALStuff.Models.Mapping
{
    public class employee_importMap : EntityTypeConfiguration<employee_import>
    {
        public employee_importMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.full_name_rod)
                .HasMaxLength(150);

            this.Property(t => t.full_name_dat)
                .HasMaxLength(150);

            // Table & Column Mappings
            this.ToTable("employee_import");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.full_name_rod).HasColumnName("full_name_rod");
            this.Property(t => t.full_name_dat).HasColumnName("full_name_dat");
        }
    }
}