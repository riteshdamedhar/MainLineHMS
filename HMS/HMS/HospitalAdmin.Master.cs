using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityLayer;

namespace HMS
{
    public partial class HospitalAdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserObject"] != null)
            {
                UserLogin user = (UserLogin)Session["UserObject"];
                if (user.TypeOfUser == UserType.HospitalAdmin)
                {
                    lblUsername.Text = user.FullName;
                }
                else
                {
                    Session.Clear();
                    Session.Abandon();
                    Session.RemoveAll();
                    Response.Redirect("~/Login.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {

            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("~/Login.aspx");
        }

        protected void Timer_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();

        }
    }
}