using System;

namespace DALStuff.Models
{
    public partial class organization
    {
        public int id { get; set; }
        public string name { get; set; }
        public bool enabled { get; set; }
        public System.DateTime dattim1 { get; set; }
        public System.DateTime dattim2 { get; set; }
        public bool display_in_list { get; set; }
        public string full_name { get; set; }
        public int order_num { get; set; }
        public string creator_sid { get; set; }
        public string address_ur { get; set; }
        public string address_fact { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string inn { get; set; }
        public string kpp { get; set; }
        public string ogrn { get; set; }
        public string rs { get; set; }
        public string bank { get; set; }
        public string ks { get; set; }
        public string bik { get; set; }
        public string okpo { get; set; }
        public string okved { get; set; }
        public string manager_name { get; set; }
        public string manager_name_dat { get; set; }
        public string manager_position { get; set; }
        public string manager_position_dat { get; set; }
        public string site { get; set; }
        public string director_sid { get; set; }
        public string sys_name { get; set; }
        public Nullable<int> id_director { get; set; }
    }
}