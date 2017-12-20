using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using EntityLayer;

namespace HMS.HospitalAdmin
{
    public partial class ManageMedicineCatelog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (hdnOperationType.Value == "Insert")
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True";

                con.Open();
                string query = "insert into tblMedicine(MedicineName,MedicineCategory,Remark) values('" + txtMedicineName.Text + "','" + txtMedicineCategory.Text + "','" + txtRemark.Text + "')";

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = query;

                int Result = cmd.ExecuteNonQuery();

                con.Close();

                lblMessage.Text = "SAVED SUCCESSFULLY";
                ClearForm();

            }
            if (hdnOperationType.Value == "Update")
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True";

                con.Open();

                string query = "update tblMedicine set MedicineName='" + txtMedicineName.Text + "',MedicineCategory='" + txtMedicineCategory.Text + "',Remark='" + txtRemark.Text + "' where Pk_Medicineid=" + hdnIdPK.Value;

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = query;

                int Result = cmd.ExecuteNonQuery();

                con.Close();

                lblMessage.Text = "SAVED SUCCESSFULLY";
                ClearForm();

            }
            FillGridView();

            pnlGrid.Visible = true;
            pnlAddForm.Visible = false;
        }

        public void ClearForm()
        {
            txtMedicineName.Text = string.Empty;
            txtMedicineCategory.Text = string.Empty;
            txtRemark.Text = string.Empty;
        }
        public void FillGridView()
        {
            SqlConnection con = new SqlConnection(@"Data source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True");
            string query = "select * from tblMedicine";
            SqlDataAdapter adapter = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            grdGridView.DataSource = dt;
            grdGridView.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            pnlAddForm.Visible = true;
            pnlGrid.Visible = false;
            hdnOperationType.Value = "Insert";
            ClearForm();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlAddForm.Visible = false;
            pnlGrid.Visible = true;
            ClearForm();
        }

        protected void grdGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditField")
            {
                hdnOperationType.Value = "Update";
                int pkid = Convert.ToInt32(e.CommandArgument);

                hdnIdPK.Value = pkid.ToString();

                SqlConnection con = new SqlConnection(@"Data source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True");
                string query = "select * from tblMedicine where Pk_Medicineid=" + pkid;
                SqlDataAdapter adapter = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    txtMedicineName.Text = dt.Rows[0]["MedicineName"].ToString();
                    txtMedicineCategory.Text = dt.Rows[0]["MedicineCategory"].ToString();
                    txtRemark.Text = dt.Rows[0]["Remark"].ToString();
                }
                pnlAddForm.Visible = true;
                pnlGrid.Visible = false;
            }
            if (e.CommandName == "DeleteField")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data source=PERSONAL;Initial Catalog=HMSdb;Integrated Security=True";

                con.Open();
                string query = "Delete from tblMedicine where Pk_Medicineid =" + id;

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