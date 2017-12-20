using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnogin_Click(object sender, EventArgs e)
        {
            if(ddlUserType.SelectedValue=="Doctor")
            {
                Response.Redirect("~/Doctor/DoctorHome.aspx");
            }
            else if(ddlUserType.SelectedValue=="Reception")
            {
                Response.Redirect("~/Reception/ReceptionHome.aspx");
            }
        }
    }
}