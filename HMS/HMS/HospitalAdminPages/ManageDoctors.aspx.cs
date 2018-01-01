using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace HMS.HospitalAdmin
{
    public partial class ManageDoctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True";

            con.Open();

            string query = "insert into tblDoctorDetails(DoctorName, DoctorAddress, ContactNumber, Email, Education, Specialization, Experience, JoiningDate, LeavingDate)values('" + txtDoctorName.Text + "', '" + txtDoctorAddress.Text + "', '" + txtContactnumber.Text + "', '" + txtEmail.Text + "', '" + txtEducation.Text + "', '" + txtSpecialization.Text + "', '" + txtExperience.Text + "', '" + txtJoiningDate.Text + "', '" + txtLeavingDate.Text + "')";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = query;

            cmd.ExecuteNonQuery();

            con.Close();

            lblMessage.Text = "saved Successfully";
            txtDoctorName.Text = string.Empty;
            txtDoctorAddress.Text = string.Empty;
            txtContactnumber.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtEducation.Text = string.Empty;
            txtSpecialization.Text = string.Empty;
            txtExperience.Text = string.Empty;
            txtJoiningDate.Text = string.Empty;
            txtLeavingDate.Text = string.Empty;
        }
    }
}