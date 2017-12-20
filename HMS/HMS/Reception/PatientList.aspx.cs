using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS.Reception
{
    public partial class PatientList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }
        public void FillGridView()
        {
            PatientBAO obj = new PatientBAO();
            grdPatientList.DataSource = obj.GetListOfPatient();
            grdPatientList.DataBind();
        }
    }
}