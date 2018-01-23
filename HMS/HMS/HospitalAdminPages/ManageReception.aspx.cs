using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using EntityLayer;
using BusinessLayer;

namespace HMS.HospitalAdmin
{
    public partial class ManageReception : System.Web.UI.Page
    {

        public object DataTable { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            {
                FillGridView();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            ReceptionDetail Rec = new ReceptionDetail();
            Rec.FullName = txtFullName.Text;
            Rec.DOB = txtDOB.Text;
            Rec.Age = Convert.ToInt32(txtAGE.Text);
            Rec.Gender = rbtGender.SelectedValue;
            Rec.Address = txtAddress.Text;
            Rec.MobileNumber = txtMobileNumber.Text;
            Rec.Email = txtEmail.Text;
            Rec.IsActive = 1;
            Rec.CreatedBY = "Samyu";
            Rec.ModifiedBy = "System";
            Rec.FK_HospitalId = Convert.ToInt32(Session["HospitalId"]);

            if (hdnOperationType.Value == "Update")
            {
                Rec.PK_Reception = Convert.ToInt32(hdnIDPK.Value);                
            }
            ReceptionBAO BAO = new ReceptionBAO();
            BAO.SaveReception(Rec);

            lblMessage.Text = "Save Successfully";
            ClearForm();

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
            txtAddress.Text = string.Empty;
        }
        public void FillGridView()
        {
            ReceptionBAO BAO = new ReceptionBAO();
            grdGridView.DataSource = BAO.GetReceptionDetails();
            grdGridView.DataBind();
        }
        public void btnAdd_Click(Object sender, EventArgs e)
        {
            pnlAddForm.Visible = true;
            pnlGrid.Visible = false;
            hdnOperationType.Value = "Insert";
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
                int Id = Convert.ToInt32(e.CommandArgument);
                hdnIDPK.Value = Id.ToString();
                ReceptionBAO BAO = new ReceptionBAO();
                ReceptionDetail obj = BAO.GetReceptionDetailsById(Id);
                if (obj!=null)
                {
                    txtFullName.Text = obj.FullName;
                    txtMobileNumber.Text = obj.MobileNumber;
                    txtEmail.Text = obj.Email;
                }
                pnlAddForm.Visible = true;
                pnlGrid.Visible = false;
            }
            if (e.CommandName == "DeleteData")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ReceptionBAO BAO = new ReceptionBAO();
                BAO.DeleteReception(id);
                FillGridView();
            }
        }
    }

}