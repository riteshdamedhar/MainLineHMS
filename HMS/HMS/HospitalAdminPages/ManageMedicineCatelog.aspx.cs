using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using EntityLayer;
using BusinessLayer;

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
            Medicine m = new Medicine();
            m.FK_HospitalId = Convert.ToInt32(Session["HospitalId"]);
            m.MedicineName = txtMedicineName.Text;
            m.MedicineCategory = txtMedicineCategory.Text;
            m.Remark = txtRemark.Text;
            m.IsActive = 1;
            m.CreatedBy = "Samyu";
            m.ModifiedBy = "Samyu";
            if (hdnOperationType.Value == "Update")
            {
                m.PK_Medicineid = Convert.ToInt32(hdnIdPK.Value);
            }
            MedicineBAO bao = new MedicineBAO();
            bao.SaveMedicine(m);

            lblMessage.Text = "SAVED SUCCESSFULLY";
            ClearForm();

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
            MedicineBAO BAO = new MedicineBAO();
            int id = Convert.ToInt32(Session["HospitalId"]);
            grdGridView.DataSource = BAO.GetMedicineDetails(id);
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
                MedicineBAO BAO = new MedicineBAO();
                int id = Convert.ToInt32(Session["HospitalId"]);
                Medicine obj = BAO.GetMedicineDetailsById(pkid, id);
                if (obj != null)
                {
                    txtMedicineName.Text = obj.MedicineName;
                    txtMedicineCategory.Text = obj.MedicineCategory;
                    txtRemark.Text = obj.Remark;
                }
                pnlAddForm.Visible = true;
                pnlGrid.Visible = false;
            }
            if (e.CommandName == "DeleteField")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                MedicineBAO BAO = new MedicineBAO();

                BAO.DeleteMedicine(id);

                FillGridView();
            }
        }
    }
}