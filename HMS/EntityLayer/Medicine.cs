using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntityLayer
{
    [Serializable]
    public class Medicine
    {
        public int PK_Medicineid { get; set; }
        public string MedicineName { get; set; }
        public string MedicineCategory { get; set; }
        public string Remark { get; set; }
        public int FK_HospitalId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public int IsActive { get; set; }
    }
}

