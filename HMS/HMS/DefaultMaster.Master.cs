using EntityLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS
{
    public partial class DefaultMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                UserLogin user = (UserLogin)Session["UserObject"];
                if (user.TypeOfUser == UserType.ReceptionUser)
                {
                    Response.Redirect("~/Reception/ReceptionHome.aspx");
                }
               else if(user.TypeOfUser==UserType.DoctorUser)
                {
                    Response.Redirect("~/Doctor/DoctorHome.aspx");
                }
                else if (user.TypeOfUser == UserType.HospitalAdmin)
                {
                    Response.Redirect("~/HospitalAdminPages/HospitalHome.aspx");
                }

            }
        }
    }
}