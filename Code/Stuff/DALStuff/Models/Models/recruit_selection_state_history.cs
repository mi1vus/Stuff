namespace DALStuff.Models
{
    public partial class recruit_selection_state_history
    {
        public int id { get; set; }
        public int id_selection { get; set; }
        public System.DateTime dattim1 { get; set; }
        public string creator_sid { get; set; }
        public int id_state { get; set; }
        public string descr { get; set; }
    }
}