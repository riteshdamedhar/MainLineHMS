using DataAccessLayer;
using EntityLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace BusinessLayer
{
    public class MedicineBAO : DataAccessLayer.DataAccessLogic
    {
        public void SaveMedicine(Medicine obj)
        {
            string query = "usp_SaveMedicineDetails";
            List<SqlParameter> Parameters = new List<SqlParameter>();
            SqlParameter PKMedicine = new SqlParameter("@PKMedicine", obj.PK_Medicineid);
            SqlParameter Name = new SqlParameter("@MedicineName", obj.MedicineName);
            SqlParameter Category = new SqlParameter("@MedicineCategory", obj.MedicineCategory);
            SqlParameter Remark = new SqlParameter("@Remark", obj.Remark);
            SqlParameter FKHosp = new SqlParameter("@FKMedicine", obj.FK_HospitalId);
            SqlParameter Crea = new SqlParameter("@CreatedBy", obj.CreatedBy);
            SqlParameter Modi = new SqlParameter("@ModifiedBy", obj.ModifiedBy);
            SqlParameter IsAct = new SqlParameter("@IsActive", obj.IsActive);

            Parameters.Add(PKMedicine);
            Parameters.Add(Name);
            Parameters.Add(Category);
            Parameters.Add(Remark);
            Parameters.Add(FKHosp);
            Parameters.Add(Crea);
            Parameters.Add(Modi);
            Parameters.Add(IsAct);
            int result = ExecuteNonQueryUsingSP(query, Parameters);
        }
        public List<Medicine> GetMedicineDetails(int id)
        {
            DataTable dt;
            List<Medicine> medicinedList = new List<Medicine>();
            List<SqlParameter> Parameters = new List<SqlParameter>();
            SqlParameter hId = new SqlParameter("@HospitalId", id);
            Parameters.Add(hId);
            DataSet ds = GetDataSetFromDBWithSP("usp_GetMedicineDetails", Parameters);
            dt = ds.Tables[0];
            foreach (DataRow r in dt.Rows)
            {
                Medicine obj = MedicineDTO(r);
                medicinedList.Add(obj);
            }
            return medicinedList;
        }
        public Medicine GetMedicineDetailsById(int id,int hId)
        {
            DataTable dt;
            List<Medicine> medicneList = new List<Medicine>();
            List<SqlParameter> Parameters = new List<SqlParameter>();
            SqlParameter key = new SqlParameter("@pkId", id);
            SqlParameter HospitalId = new SqlParameter("@HospitalId", hId);
            Parameters.Add(HospitalId);
            Parameters.Add(key);
            DataSet ds = GetDataSetFromDBWithSP("usp_GetMedicineDetails", Parameters);
            dt = ds.Tables[0];
            foreach (DataRow r in dt.Rows)
            {
                Medicine obj = MedicineDTO(r);
                medicneList.Add(obj);
            }
            return medicneList.Count > 0 ? medicneList[0] : null;
        }
        public Medicine MedicineDTO(DataRow row)
        {
            Medicine m = new Medicine();
            m.MedicineName = row["MedicineName"].ToString();
            m.MedicineCategory = row["MedicineCategory"].ToString();
            m.Remark = row["Remark"].ToString();
            m.PK_Medicineid = Convert.ToInt32(row["PK_Medicineid"].ToString());
            m.FK_HospitalId = Convert.ToInt32(row["PK_Medicineid"].ToString());
            m.IsActive = Convert.ToInt32(row["PK_Medicineid"].ToString());
            return m;
        }
        public int DeleteMedicine(int id)
        {
            string query = "Delete from tblMedicine where Pk_Medicineid =@PKId";
            List<SqlParameter> p = new List<SqlParameter>();
            SqlParameter p1 = new SqlParameter("@PKId", id);
            p.Add(p1);
            int result = ExecuteNonQueryUsingQuery(query, p);
            return result;
        }

    }

}
