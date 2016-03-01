using System.Data.Entity.ModelConfiguration;

namespace DALStuff.Models.Mapping
{
    public class wd_holidaysMap : EntityTypeConfiguration<wd_holidays>
    {
        public wd_holidaysMap()
        {
            // Primary Key
            this.HasKey(t => t.date);

            // Properties
            // Table & Column Mappings
            this.ToTable("wd_holidays");
            this.Property(t => t.date).HasColumnName("date");
        }
    }
}