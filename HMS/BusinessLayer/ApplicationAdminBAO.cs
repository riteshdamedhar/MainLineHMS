﻿using EntityLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace BusinessLayer
{
    public class ApplicationAdminBAO : DataAccessLayer.DataAccessLogic
    {
        public int SaveHospital(HospitalDetail p)
        {

            string query = "usp_SaveHospitalDetails";
            List<SqlParameter> parameters = new List<SqlParameter>();
            SqlParameter PkId = new SqlParameter("@PkId", p.PK_HospitalId);
            SqlParameter name = new SqlParameter("@Hospital", p.HospitalName);
            SqlParameter add = new SqlParameter("@HospitalAddress", p.HospitalAddress);
            SqlParameter admin = new SqlParameter("@HospitalAdminName", p.HospitalAdminName);
            SqlParameter cont = new SqlParameter("@HospitalContact", p.HospitalContact);
            SqlParameter email = new SqlParameter("@AdminEmail", p.AdminEmail);
            SqlParameter admincon = new SqlParameter("@AdminContact", p.AdminContact);
            SqlParameter crea = new SqlParameter("@CreatedBy", p.CreatedBy);
            SqlParameter mod = new SqlParameter("@ModifiedBy", p.ModifiedBy);
            SqlParameter isact = new SqlParameter("@IsActive", p.IsActive);

            parameters.Add(PkId);
            parameters.Add(name);
            parameters.Add(add);
            parameters.Add(admin);
            parameters.Add(admincon);
            parameters.Add(cont);
            parameters.Add(email);
            parameters.Add(crea);
            parameters.Add(mod);
            parameters.Add(isact);
            int result = ExecuteNonQueryUsingSP(query, parameters);
            return result;

        }
        public DataTable GetHospitalDetails()
        {
            DataTable dt;
            List<SqlParameter> parameters = new List<SqlParameter>();
            DataSet ds = GetDataSetFromDBWithSP("usp_GetHospitalDetails", parameters);
            dt = ds.Tables[0];
            return dt;
        }
        public DataTable GetHospitalDetailsById(int id)
        {
            DataTable dt;
            List<SqlParameter> parameters = new List<SqlParameter>();
            SqlParameter key = new SqlParameter("@PkId", id);
            parameters.Add(key);
            DataSet ds = GetDataSetFromDBWithSP("usp_GetHospitalDetails", parameters);
            dt = ds.Tables[0];
            return dt;
        }
        public int DeleteHospital(int id)
        {
            string query = "delete from tblHostitalDetails where PK_HospitalId=@PkId";

            List<SqlParameter> p = new List<SqlParameter>();
            SqlParameter p1 = new SqlParameter("@PkId", id);
            p.Add(p1);
            int result = ExecuteNonQueryUsingQuery(query, p);
            return result;
        }
    }
}
