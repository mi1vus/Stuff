using System;

namespace DALStuff.Models
{
    public partial class recruit_selections_view
    {
        public int id { get; set; }
        public int id_candidate { get; set; }
        public int id_vacancy { get; set; }
        public System.DateTime dattim1 { get; set; }
        public System.DateTime dattim2 { get; set; }
        public bool enabled { get; set; }
        public string creator_sid { get; set; }
        public string deleter_sid { get; set; }
        public Nullable<int> id_state { get; set; }
        public Nullable<System.DateTime> state_change_date { get; set; }
        public string state_changer_sid { get; set; }
        public string state_descr { get; set; }
        public Nullable<int> id_came_type { get; set; }
        public string candidate_display_name { get; set; }
        public Nullable<System.DateTime> candidate_birth_date { get; set; }
        public string candidate_phone { get; set; }
        public string candidate_email { get; set; }
        public bool candidate_male { get; set; }
        public string state_name { get; set; }
        public string state_changer_name { get; set; }
        public Nullable<int> next_state_id { get; set; }
        public string next_state_name { get; set; }
        public bool show_next_state_btn { get; set; }
        public bool state_is_active { get; set; }
        public string next_state_btn_name { get; set; }
        public bool state_is_accept { get; set; }
        public string candidate_surname { get; set; }
        public string candidate_name { get; set; }
        public string candidate_patronymic { get; set; }
        public string vacancy_position_name { get; set; }
        public string vacancy_department_name { get; set; }
        public Nullable<int> vacancy_candidate_total_count { get; set; }
        public Nullable<int> vacancy_candidate_cancel_count { get; set; }
        public string vacancy_personal_manager_name { get; set; }
        public System.DateTime vacancy_date_create { get; set; }
        public string vacancy_state_name { get; set; }
        public Nullable<System.DateTime> vacancy_state_change_date { get; set; }
        public string vacancy_state_changer_name { get; set; }
        public string vacancy_cause_name { get; set; }
        public string vacancy_creator_name { get; set; }
        public string candidate_came_type_name { get; set; }
        public string came_type_name { get; set; }
        public Nullable<int> vacancy_id_city { get; set; }
        public int state_order_num { get; set; }
        public bool state_is_cancel { get; set; }
        public string vacancy_author_sid { get; set; }
    }
}