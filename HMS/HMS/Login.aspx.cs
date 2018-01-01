using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityLayer;
using BusinessLayer;

namespace HMS
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnogin_Click(object sender, EventArgs e)
        {
            if (ddlUserType.SelectedValue == "Doctor")
            {
                Response.Redirect("~/Doctor/DoctorHome.aspx");
            }
            else if (ddlUserType.SelectedValue == "Reception")
            {

                //txtUserName.Text
                //txtPassword.Text
                ReceptionBAO obj = new ReceptionBAO();
                ReceptionDetail reception = obj.GetReceptionByEmail(txtUserName.Text);
                if(reception !=null)
                {
                    if(reception.Password==txtPassword.Text)
                    {
                        UserLogin user = new UserLogin();
                        user.UserName = reception.Email;
                        user.FullName = reception.FullName;
                        user.Id = reception.PK_Reception;
                        user.Password = reception.Password;
                        user.TypeOfUser = UserType.ReceptionUser;
                        Session["UserObject"] = user;
                        Session["UserName"] = user.UserName;
                        Response.Redirect("~/Reception/ReceptionHome.aspx");
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Invalid User name password')", true);
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('Invalid User name password')", true);
                }
                

            }
        }
    }
}