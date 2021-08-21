using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityApp.ViewModels
{
    [MetadataType(typeof(UniversityMataData))]
    public partial class University
    {
    }
    public class UniversityMataData
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public Nullable<System.DateTime> Established { get; set; }
        [Required]
        public string Logo { get; set; }
    }
}