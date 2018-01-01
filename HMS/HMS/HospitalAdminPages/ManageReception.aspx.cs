using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HMS.HospitalAdmin
{
    public partial class ManageReception : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGridView();

                pnlGrid.Visible = true;
                pnlAddForm.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (hdnOperationType.Value == "Insert")
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data Source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True";

                con.Open();

                string query = "Insert into tblReception(FullName,Age,Gender,Address,MobileNumber,Email) Values('" + txtFullName.Text + "','" + txtAGE.Text + "','" + rbtGender.SelectedValue + "','" + txtAddress.Text + "','" + txtMobileNumber.Text + "','" + txtEmail.Text + "')";
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = query;
                int Result = cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Save Successfully";
                ClearForm();
            }
            if (hdnOperationType.Value == "Update")
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data Source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True";

                con.Open();

                string query = "update tblReception set FullName='" + txtFullName.Text + "',age='" + txtAGE.Text + "',Gender='" + rbtGender.SelectedValue + "',Address='" + txtAddress.Text + "',MobileNumber='" + txtMobileNumber.Text + "',Email='" + txtEmail.Text + "' where PK_Reception=" + hdnIDPK.Value;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = query;
                int Result = cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Save Successfully";
                ClearForm();
            }

            FillGridView();

            pnlGrid.Visible = true;
            pnlAddForm.Visible = false;
        }


        public void ClearForm()
        {
            txtFullName.Text = string.Empty;
            txtAGE.Text = string.Empty;
            txtMobileNumber.Text = string.Empty;
            txtEmail.Text = string.Empty;
        }
        public void FillGridView()
        {
            SqlConnection con = new SqlConnection(@"Data Source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True");
            string query = "select * from tblReception";
            SqlDataAdapter adapter = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            grdGridView.DataSource = dt;
            grdGridView.DataBind();

        }

        public void btnAdd_Click(Object sender, EventArgs e)
        {
            pnlAddForm.Visible = true;
            pnlGrid.Visible = false;
            ClearForm();
        }

        public void btnCancel_Click(object sender, EventArgs e)
        {
            pnlAddForm.Visible = false;
            pnlGrid.Visible = true;
            ClearForm();
        }

        protected void grdGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditData")
            {
                hdnOperationType.Value = "Update";
                int PKid = Convert.ToInt32(e.CommandArgument);
                hdnIDPK.Value = PKid.ToString();
                SqlConnection con = new SqlConnection(@"Data Source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True");
                string query = "select * from tblReception where PK_Reception=" + PKid;
                SqlDataAdapter adapter = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    txtFullName.Text = dt.Rows[0]["FullName"].ToString();
                    txtMobileNumber.Text = dt.Rows[0]["MobileNumber"].ToString();
                    txtEmail.Text = dt.Rows[0]["Email"].ToString();
                }
                pnlAddForm.Visible = true;
                pnlGrid.Visible = false;
            }
            if (e.CommandName == "DeleteData")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data Source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True";

                con.Open();

                string query = "Delete from tblReception where PK_Reception=" + id;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = query;

                int Result = cmd.ExecuteNonQuery();

                con.Close();
                FillGridView();
            }
        }
    }

}