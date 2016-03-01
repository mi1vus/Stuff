using System;
using System.Collections.Generic;

namespace DbContextAutoGenerated.Models
{
    public partial class WfwSchemeStage
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Level { get; set; }
        public Nullable<int> RoleId { get; set; }
        public string CoordinatorSid { get; set; }
        public int SchemeId { get; set; }
        public bool Enabled { get; set; }
        public virtual WfwScheme WfwScheme { get; set; }
    }
}