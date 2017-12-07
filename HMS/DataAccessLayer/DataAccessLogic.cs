using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DataAccessLayer
{
    public class DataAccessLogic
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adaptor;
        DataTable dt;
        DataSet ds;

        protected SqlConnection OpenConnection()
        {

            con = new SqlConnection(@"Data Source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True");
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            return con;
        }
        protected void CloseConnection()
        {
            if (con != null)
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

        }
        protected int ExecuteStoredProcedure(string spName,List<SqlParameter> param)
        {
            int result = 0;
            OpenConnection();
            cmd = new SqlCommand();
            cmd.CommandText = spName;
            cmd.CommandType = CommandType.StoredProcedure;
            foreach(SqlParameter p in param)
            {
                cmd.Parameters.Add(p);
            }
            cmd.Connection = con;
            result = cmd.ExecuteNonQuery();
            CloseConnection();
            return result;
        }
    }
}
