using System.Data.Entity.ModelConfiguration;

namespace DALStuff.Models.Mapping
{
    public class recruit_question_formsMap : EntityTypeConfiguration<recruit_question_forms>
    {
        public recruit_question_formsMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.link_sid)
                .IsRequired()
                .HasMaxLength(46);

            this.Property(t => t.surname)
                .HasMaxLength(50);

            this.Property(t => t.name)
                .HasMaxLength(50);

            this.Property(t => t.patronymic)
                .HasMaxLength(50);

            this.Property(t => t.display_name)
                .HasMaxLength(150);

            this.Property(t => t.phone)
                .HasMaxLength(50);

            this.Property(t => t.email)
                .HasMaxLength(150);

            this.Property(t => t.nationality)
                .HasMaxLength(150);

            this.Property(t => t.address)
                .HasMaxLength(250);

            this.Property(t => t.have_owned_organization)
                .HasMaxLength(500);

            this.Property(t => t.car_model)
                .HasMaxLength(150);

            this.Property(t => t.position_name)
                .HasMaxLength(250);

            this.Property(t => t.science_degree)
                .HasMaxLength(500);

            this.Property(t => t.free_time_rest)
                .HasMaxLength(4000);

            this.Property(t => t.life_attainment)
                .HasMaxLength(4000);

            this.Property(t => t.long_term_goal)
                .HasMaxLength(4000);

            this.Property(t => t.advantage)
                .HasMaxLength(4000);

            this.Property(t => t.client_ip)
                .HasMaxLength(50);

            this.Property(t => t.client_user_agent)
                .HasMaxLength(250);

            // Table & Column Mappings
            this.ToTable("recruit_question_forms");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.link_sid).HasColumnName("link_sid");
            this.Property(t => t.id_selection).HasColumnName("id_selection");
            this.Property(t => t.id_candidate).HasColumnName("id_candidate");
            this.Property(t => t.id_vacancy).HasColumnName("id_vacancy");
            this.Property(t => t.surname).HasColumnName("surname");
            this.Property(t => t.name).HasColumnName("name");
            this.Property(t => t.patronymic).HasColumnName("patronymic");
            this.Property(t => t.birth_date).HasColumnName("birth_date");
            this.Property(t => t.male).HasColumnName("male");
            this.Property(t => t.display_name).HasColumnName("display_name");
            this.Property(t => t.phone).HasColumnName("phone");
            this.Property(t => t.email).HasColumnName("email");
            this.Property(t => t.nationality).HasColumnName("nationality");
            this.Property(t => t.address).HasColumnName("address");
            this.Property(t => t.have_conviction).HasColumnName("have_conviction");
            this.Property(t => t.organization_owner).HasColumnName("organization_owner");
            this.Property(t => t.have_owned_organization).HasColumnName("have_owned_organization");
            this.Property(t => t.id_question_when_work).HasColumnName("id_question_when_work");
            this.Property(t => t.have_driver_license).HasColumnName("have_driver_license");
            this.Property(t => t.have_car).HasColumnName("have_car");
            this.Property(t => t.car_model).HasColumnName("car_model");
            this.Property(t => t.driver_expirence).HasColumnName("driver_expirence");
            this.Property(t => t.id_question_marital_status).HasColumnName("id_question_marital_status");
            this.Property(t => t.id_position).HasColumnName("id_position");
            this.Property(t => t.position_name).HasColumnName("position_name");
            this.Property(t => t.minimum_salaty).HasColumnName("minimum_salaty");
            this.Property(t => t.optimal_salary).HasColumnName("optimal_salary");
            this.Property(t => t.id_education).HasColumnName("id_education");
            this.Property(t => t.science_degree).HasColumnName("science_degree");
            this.Property(t => t.computer_skills).HasColumnName("computer_skills");
            this.Property(t => t.have_trip_limit).HasColumnName("have_trip_limit");
            this.Property(t => t.have_health_limit).HasColumnName("have_health_limit");
            this.Property(t => t.free_time_rest).HasColumnName("free_time_rest");
            this.Property(t => t.life_attainment).HasColumnName("life_attainment");
            this.Property(t => t.long_term_goal).HasColumnName("long_term_goal");
            this.Property(t => t.advantage).HasColumnName("advantage");
            this.Property(t => t.dattim1).HasColumnName("dattim1");
            this.Property(t => t.client_ip).HasColumnName("client_ip");
            this.Property(t => t.client_user_agent).HasColumnName("client_user_agent");
        }
    }
}