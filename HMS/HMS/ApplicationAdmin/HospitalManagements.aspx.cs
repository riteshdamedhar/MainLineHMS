using EntityLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BusinessLayer;

namespace HMS.ApplicationAdmin
{
    public partial class HospitalManagements : System.Web.UI.Page
    {

        public object Datatable { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            HospitalDetail h = new HospitalDetail();
            h.HospitalName = txtHospitalName.Text;
            h.HospitalAddress = txtAddress.Text;
            h.HospitalAdminName = txtHospitalAdminName.Text;
            h.HospitalContact = txtHospitalContact.Text;
            h.IsActive = 1;
            h.AdminContact = txtAdminContact.Text;
            h.AdminEmail = txtAdminEmail.Text;
            h.CreatedBy = "Ritesh";
            h.ModifiedBy = "Ritesh";
            if (hdnOperation.Value == "Update")
            {
                h.PK_HospitalId = Convert.ToInt32(hdnId.Value);
            }
            ApplicationAdminBAO bao = new ApplicationAdminBAO();
            bao.SaveHospital(h);

            lblMessage.Text = "Saved Successfully";
            ClearForm();
            FillGridView();

            pnlAddForm.Visible = true;
            pnlGrid.Visible = false;

        }
        public void ClearForm()
        {
            txtHospitalName.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtHospitalAdminName.Text = string.Empty;
            txtHospitalContact.Text = string.Empty;
            txtAdminEmail.Text = string.Empty;
            txtAdminContact.Text = string.Empty;
        }
        public void FillGridView()
        {
            ApplicationAdminBAO BAO = new ApplicationAdminBAO();
            grdGridView.DataSource = BAO.GetHospitalDetails();
            grdGridView.DataBind();
        }
        public void btnAdd_Click(object sender, EventArgs e)
        {
            pnlAddForm.Visible = true;
            pnlGrid.Visible = false;
            hdnOperation.Value = "Insert";
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
                hdnOperation.Value = "Update";
                int Id = Convert.ToInt32(e.CommandArgument);
                hdnId.Value = Id.ToString();
                ApplicationAdminBAO BAO = new ApplicationAdminBAO();
                DataTable dt = BAO.GetHospitalDetailsById(Id);
                if (dt.Rows.Count > 0)
                {
                    txtHospitalName.Text = dt.Rows[0]["HospitalName"].ToString();
                    txtAddress.Text = dt.Rows[0]["HospitalAddress"].ToString();
                    txtHospitalAdminName.Text = dt.Rows[0]["HospitalAdminName"].ToString();
                    txtHospitalContact.Text = dt.Rows[0]["HospitalContact"].ToString();
                    txtAdminContact.Text = dt.Rows[0]["AdminContact"].ToString();
                    txtAdminEmail.Text = dt.Rows[0]["AdminEmail"].ToString();

                }
                pnlAddForm.Visible = true;
                pnlGrid.Visible = false;
            }
            if (e.CommandName == "DeleteData")
            {
                int Id = Convert.ToInt32(e.CommandArgument);
                ApplicationAdminBAO bao = new ApplicationAdminBAO();

                bao.DeleteHospital(Id);

                FillGridView();
            }

        }
    }
}