using System;
using System.Collections.Generic;

namespace DbContextStuffAutoGenerated.Models
{
    public partial class request
    {
        public int id { get; set; }
        public Nullable<int> id_position { get; set; }
        public Nullable<int> id_reason { get; set; }
        public string aim { get; set; }
        public string sid_manager { get; set; }
        public string sid_teacher { get; set; }
        public Nullable<int> id_department { get; set; }
        public Nullable<bool> is_subordinates { get; set; }
        public string subordinates { get; set; }
        public string functions { get; set; }
        public string interactions { get; set; }
        public Nullable<bool> is_instructions { get; set; }
        public string success_rates { get; set; }
        public string plan_to_test { get; set; }
        public string plan_after_test { get; set; }
        public string work_place { get; set; }
        public string work_mode { get; set; }
        public string holiday { get; set; }
        public string hospital { get; set; }
        public string business_trip { get; set; }
        public string overtime_work { get; set; }
        public string compensations { get; set; }
        public Nullable<int> probation { get; set; }
        public string salary_to_test { get; set; }
        public string salary_after_test { get; set; }
        public string bonuses { get; set; }
        public Nullable<bool> sex { get; set; }
        public Nullable<int> age_from { get; set; }
        public Nullable<int> age_to { get; set; }
        public string education { get; set; }
        public string last_work { get; set; }
        public string requirements { get; set; }
        public string knowledge { get; set; }
        public string suggestions { get; set; }
        public string workplace { get; set; }
        public Nullable<bool> is_furniture { get; set; }
        public string furniture { get; set; }
        public Nullable<bool> is_pc { get; set; }
        public Nullable<bool> is_telephone { get; set; }
        public Nullable<bool> is_ethalon { get; set; }
        public Nullable<System.DateTime> appearance { get; set; }
        public Nullable<System.DateTime> create_datetime { get; set; }
        public Nullable<System.DateTime> last_change_datetime { get; set; }
        public string sid_contact_person { get; set; }
        public string sid_responsible_person { get; set; }
        public int id_status { get; set; }
        public bool HaveCoordination { get; set; }
        public bool CoordinationStoped { get; set; }
        public bool Enabled { get; set; }
        public virtual department department { get; set; }
        public virtual employee employee { get; set; }
        public virtual employee employee1 { get; set; }
        public virtual employee employee2 { get; set; }
        public virtual employee employee3 { get; set; }
        public virtual position position { get; set; }
        public virtual request_reasons request_reasons { get; set; }
        public virtual request_statuses request_statuses { get; set; }
    }
}
