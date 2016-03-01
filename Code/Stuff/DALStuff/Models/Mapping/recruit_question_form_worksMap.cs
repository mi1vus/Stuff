using System.Data.Entity.ModelConfiguration;

namespace DALStuff.Models.Mapping
{
    public class recruit_question_form_worksMap : EntityTypeConfiguration<recruit_question_form_works>
    {
        public recruit_question_form_worksMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.address)
                .HasMaxLength(500);

            this.Property(t => t.phone)
                .HasMaxLength(50);

            this.Property(t => t.organization_name)
                .HasMaxLength(500);

            this.Property(t => t.business_type)
                .HasMaxLength(150);

            this.Property(t => t.position)
                .HasMaxLength(150);

            this.Property(t => t.subordinates)
                .HasMaxLength(4000);

            this.Property(t => t.search_cause)
                .HasMaxLength(500);

            // Table & Column Mappings
            this.ToTable("recruit_question_form_works");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.id_question_form).HasColumnName("id_question_form");
            this.Property(t => t.dattim1).HasColumnName("dattim1");
            this.Property(t => t.date_start).HasColumnName("date_start");
            this.Property(t => t.date_end).HasColumnName("date_end");
            this.Property(t => t.address).HasColumnName("address");
            this.Property(t => t.phone).HasColumnName("phone");
            this.Property(t => t.organization_name).HasColumnName("organization_name");
            this.Property(t => t.business_type).HasColumnName("business_type");
            this.Property(t => t.position).HasColumnName("position");
            this.Property(t => t.salary).HasColumnName("salary");
            this.Property(t => t.subordinates).HasColumnName("subordinates");
            this.Property(t => t.duties).HasColumnName("duties");
            this.Property(t => t.achivements).HasColumnName("achivements");
            this.Property(t => t.search_cause).HasColumnName("search_cause");
        }
    }
}