﻿using System;
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

    }
}
