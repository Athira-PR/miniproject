//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TSMS.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class TaskTable
    {
        public int TaskId { get; set; }
        public string TaskName { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public Nullable<decimal> EstimatedHours { get; set; }
        public Nullable<decimal> LoggedHours { get; set; }
        public Nullable<int> UserId { get; set; }
    
        public virtual LoginTable LoginTable { get; set; }
    }
}
