using System;

namespace DALStuff.Models
{
    public partial class statement_printed
    {
        public int id { get; set; }
        public int id_statement_type { get; set; }
        public string employee_sid { get; set; }
        public Nullable<System.DateTime> date_begin { get; set; }
        public Nullable<System.DateTime> date_end { get; set; }
        public Nullable<int> duration_hours { get; set; }
        public Nullable<int> duration_days { get; set; }
        public string cause { get; set; }
        public Nullable<int> id_department { get; set; }
        public Nullable<int> id_organization { get; set; }
        public bool enabled { get; set; }
        public System.DateTime dattim1 { get; set; }
        public System.DateTime dattim2 { get; set; }
        public string creator_sid { get; set; }
        public string deleter_sid { get; set; }
        public bool confirmed { get; set; }
        public Nullable<System.DateTime> date_confirm { get; set; }
        public string confirmator_sid { get; set; }
    }
}