using EntityLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
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
            string str = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            con = new SqlConnection(str);
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
        protected int ExecuteNonQueryUsingSP(string spName, List<SqlParameter> param)
        {
            int result = 0;
            OpenConnection();
            cmd = new SqlCommand();
            cmd.CommandText = spName;
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter p in param)
            {
                cmd.Parameters.Add(p);
            }
            cmd.Connection = con;
            result = cmd.ExecuteNonQuery();
            CloseConnection();
            return result;
        }
        protected DbOutput ExecuteNonQueryUsingSPOut(string spName, List<SqlParameter> param)
        {
            DbOutput result = new DbOutput();
            OpenConnection();
            cmd = new SqlCommand();
            cmd.CommandText = spName;
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter p in param)
            {
                cmd.Parameters.Add(p);
            }
            SqlParameter oParam = new SqlParameter();
            oParam.ParameterName = "@OutPutKey";
            oParam.Direction = ParameterDirection.Output;
            oParam.DbType = DbType.Int32;
            cmd.Parameters.Add(oParam);

            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            CloseConnection();
            result.DbVal = Convert.ToInt32(oParam.Value);
            return result;
        }
        protected DataSet GetDataTablefromDBwithSP(string spName, List<SqlParameter> param)
        {
            int result = 0;
            OpenConnection();
            cmd = new SqlCommand();
            cmd.CommandText = spName;
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter p in param)
            {
                cmd.Parameters.Add(p);
            }
            cmd.Connection = con;
            adaptor = new SqlDataAdapter(cmd);
            ds = new DataSet();
            adaptor.Fill(ds);
            CloseConnection();
            return ds;
        }
        protected int ExecuteNonQueryUsingQuery(string query, List<SqlParameter> param)
        {
            int result = 0;
            OpenConnection();
            cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.CommandType = CommandType.Text;
            foreach (SqlParameter p in param)
            {
                cmd.Parameters.Add(p);
            }
            cmd.Connection = con;
            result = cmd.ExecuteNonQuery();
            CloseConnection();
            return result;
        }
        protected DataSet GetDataSetFromDBWithSP(string spName, List<SqlParameter> param)
        {
            int result = 0;
            OpenConnection();
            cmd = new SqlCommand();
            cmd.CommandText = spName;
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter p in param)
            {
                cmd.Parameters.Add(p);
            }
            cmd.Connection = con;
            adaptor = new SqlDataAdapter(cmd);
            ds = new DataSet();
            adaptor.Fill(ds);
            CloseConnection();
            return ds;
        }
        protected DataSet GetDataSetFromDBWithQuery(string query, List<SqlParameter> param)
        {
            int result = 0;
            OpenConnection();
            cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.CommandType = CommandType.Text;
            foreach (SqlParameter p in param)
            {
                cmd.Parameters.Add(p);
            }
            cmd.Connection = con;
            adaptor = new SqlDataAdapter(cmd);
            ds = new DataSet();
            adaptor.Fill(ds);
            CloseConnection();
            return ds;
        }
        protected DataTable FillDataTablefromQuery(string query)
        {
            OpenConnection();
            dt = new DataTable();
            adaptor = new SqlDataAdapter(query, con);
            adaptor.Fill(dt);
            CloseConnection();
            return dt;
        }
        public DateTime? ConvertDBDatetime(object obj)
        {

            if (obj != DBNull.Value)
            {
                return Convert.ToDateTime(obj);
            }
            else
                return null;
        }

    }
}


