using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using EntityLayer;
using BusinessLayer;

namespace HMS.HospitalAdmin
{
    public partial class ManageDoctors : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            {
                FillGridView();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DoctorDetail Doctor = new DoctorDetail();
            Doctor.DoctorName = txtDoctorName.Text;
            Doctor.DoctorAddress = txtDoctorAddress.Text;
            Doctor.ContactNumber = txtContactnumber.Text;
            Doctor.Email = txtEmail.Text;
            Doctor.Education = txtEducation.Text;
            Doctor.Specialization = txtSpecialization.Text;
            Doctor.Experience = txtExperience.Text;
            Doctor.IsActive = 1;
            Doctor.JoiningDate = txtJoiningDate.Text;
            Doctor.LeavingDate = txtLeavingDate.Text;
            Doctor.Password = txtPassword.Text;
            Doctor.CreatedBy = "Vasanthi";
            Doctor.ModifiedBy = "System";

            if (hdnOperationType.Value == "Update")
            {
                Doctor.PK_Doctor = Convert.ToInt32(hdnIDPK.Value);
            }

            DoctorBAO BAO = new DoctorBAO();
            BAO.SaveDoctorDetail(Doctor);


            lblMessage.Text = "Save Successfully";
            ClearForm();

            FillGridView();

            pnlGrid.Visible = true;
            pnlAddForm.Visible = false;
        }


        public void ClearForm()
        {
            txtDoctorName.Text = string.Empty;
            txtDoctorAddress.Text = string.Empty;
            txtContactnumber.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtEducation.Text = string.Empty;
            txtSpecialization.Text = string.Empty;
            txtExperience.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtJoiningDate.Text = string.Empty;
            txtLeavingDate.Text = string.Empty;
        }
        public void FillGridView()
        {
            DoctorBAO h = new DoctorBAO();
            grdGridView.DataSource = h.GetDoctorDetails();
            grdGridView.DataBind();
        }

        public void btnAdd_Click(Object sender, EventArgs e)
        {
            pnlAddForm.Visible = true;
            pnlGrid.Visible = false;
            ClearForm();
            hdnOperationType.Value = "Insert";
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
                DoctorBAO BAO = new DoctorBAO();
                DoctorDetail obj = BAO.GetDoctorDetailsById(Id);
                if (obj != null)
                {
                    txtDoctorName.Text = obj.DoctorName;
                    txtContactnumber.Text = obj.ContactNumber;
                    txtDoctorAddress.Text = obj.DoctorAddress;
                    txtJoiningDate.Text = obj.JoiningDate;
                    txtLeavingDate.Text = obj.LeavingDate;
                    txtEducation.Text = obj.Education;
                    txtPassword.Text = obj.Password;
                    txtEmail.Text = obj.Email;
                    txtSpecialization.Text = obj.Specialization;
                    txtExperience.Text = obj.Experience;
                }
                pnlAddForm.Visible = true;
                pnlGrid.Visible = false;
            }
            if (e.CommandName == "DeleteData")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                DoctorBAO BAO = new DoctorBAO();
                BAO.DeleteDoctorDetail(id);
                FillGridView();
            }
        }

    }
}