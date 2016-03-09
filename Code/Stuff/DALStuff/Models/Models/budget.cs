using System;

namespace DALStuff.Models
{
    public partial class budget
    {
        public int id { get; set; }
        public string name { get; set; }
        public System.DateTime dattim1 { get; set; }
        public System.DateTime dattim2 { get; set; }
        public bool enabled { get; set; }
        public string creator_sid { get; set; }
        public int order_num { get; set; }
        public string descr { get; set; }
        public string deleter_sid { get; set; }
        public Nullable<int> id_parent { get; set; }
    }
}