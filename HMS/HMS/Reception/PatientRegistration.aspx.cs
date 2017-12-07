using BusinessLayer;
using EntityLayer;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS.Reception
{
    public partial class PatientRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //txtP
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            PatientBAO obj = new PatientBAO();  // Business Layer class whihc will take care for operation

            PatientInfo pa = new PatientInfo(); // Entiry Supporting class to travl my form data

            //Daata Assignment for sendingit to save
            pa.Name = txtPatientName.Text;
            pa.Mobile = txtMobileNumber.Text;
            pa.pincode = Convert.ToInt32(txtPincode.Text);
            pa.Purposeofvisit = txtPurposeofVisit.Text;
            pa.Remark = txtRemark.Text;
            pa.State = ddlState.SelectedValue;
            pa.AddressLine1 = txtAddressLine1.Text;
            pa.AddressLine2 = txtAddressLine2.Text;
            pa.Age = Convert.ToInt32(txtAge.Text);
            pa.Country = ddlCountry.SelectedValue;
            pa.City = ddlCity.SelectedValue;
            pa.Email = txtEmail.Text;
            pa.Gender = rbtGender.SelectedValue;

            //Calling Business layer Method top save data of PatientInfo object
            obj.SavePatient(pa);

            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Success","alert('Saved Successfully')",true);
        }
    }
}