using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS.Doctor
{
    public partial class OPDPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }
        public void FillGridView()
        {
            PatientBAO obj = new PatientBAO();
            grdOPDList.DataSource = obj.GetOPDPatientList();
            grdOPDList.DataBind();
        }

        protected void grdOPDList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddPresc")
            {
                Response.Redirect("~/Doctor/AddPrescription.aspx?Id=" + e.CommandArgument);
            }
        }
    }
}