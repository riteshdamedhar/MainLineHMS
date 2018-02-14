using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS.Reception
{
    public partial class PrescriptionList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGrid();
        }
        public void FillGrid()
        {
            DoctorBAO b = new DoctorBAO();
            grdPatientList.DataSource = b.GetPrescriptionPatient();
            grdPatientList.DataBind();

        }

        protected void grdPatientList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "download")
            {
                string p = e.CommandArgument.ToString();
                Response.Redirect("~/Reports/ShowReport.aspx?pid=" + p);
            }
        }
    }
}