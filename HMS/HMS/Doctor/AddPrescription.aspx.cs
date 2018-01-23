using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityLayer;
using System.ComponentModel;

namespace HMS.Doctor
{
    public partial class AddPrescription : System.Web.UI.Page
    {
        List<Medicine> selectedMedicineList = new List<Medicine>();
        MedicineBAO obj = new MedicineBAO();
        List<Medicine> selectedList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request.QueryString["Id"] != null)
                {
                    try
                    {
                        int pid = Convert.ToInt32(Request.QueryString["Id"]);
                        FillPatientDetails(pid);
                        FillMedicineList();
                    }
                    catch (Exception ex)
                    {
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Failuer", "alert('Invalid Operation')", true);
                        divBody.Visible = false;
                        return;
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Failuer", "alert('No patient Id Passed')", true);
                    divBody.Visible = false;
                    return;
                }

            }
        }
        public void FillMedicineList()
        {
            int id = Convert.ToInt32(Session["HospitalId"]);
            lstMedcines.DataSource = obj.GetMedicineDetails(id);
            lstMedcines.DataTextField = "MedicineName";
            lstMedcines.DataValueField = "PK_Medicineid";
            lstMedcines.DataBind();

        }

        public void FillPatientDetails(int patientID)
        {
            PatientBAO obj = new PatientBAO();
            PatientInfo p = obj.GetPatientById(patientID);

            if (p != null)
            {
                lblPatientName.Text = p.Name;
                lblGender.Text = p.Gender;
                lblAge.Text = p.Age.ToString();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Failuer", "alert('Patient Details Not Found')", true);
                divBody.Visible = false;
                return;
            }


        }

        protected void bntAdd_Click(object sender, EventArgs e)
        {
            string ids = string.Empty;
            if (lstMedcines.SelectedIndex != -1)
            {

                string alreadyExistList = string.Empty;
                List<Medicine> tempList = new List<Medicine>();

                if (ViewState["Selected"] != null)
                {
                    selectedMedicineList = (List<Medicine>)ViewState["Selected"];
                }
                if (ViewState["SelectedMedicine"] != null)
                {
                    selectedList = (List<Medicine>)ViewState["SelectedMedicine"];
                    tempList = (List<Medicine>)ViewState["SelectedMedicine"];
                }
                else
                    selectedList = new List<Medicine>();

                foreach (ListItem li in lstMedcines.Items)
                {
                    if (li.Selected == true)
                    {

                        int id = Convert.ToInt32(li.Value);
                        int count = 0;
                        if (selectedMedicineList.Count > 0)
                        {
                            foreach (Medicine ob in selectedMedicineList)
                            {
                                if (ob.PK_Medicineid == id)
                                {
                                    alreadyExistList = alreadyExistList + ";" + ob.MedicineName;
                                    break;
                                }
                                count++;
                            }
                            if (selectedMedicineList.Count == count)
                            {
                                int hid = Convert.ToInt32(Session["HospitalId"]);
                                Medicine m = obj.GetMedicineDetailsById(id, hid);
                                selectedList.Add(m);
                                ids = ids + "," + id.ToString();
                            }
                        }
                        else
                        {
                            int hid = Convert.ToInt32(Session["HospitalId"]);
                            Medicine m = obj.GetMedicineDetailsById(id, hid);
                            selectedList.Add(m);
                            ids = ids + "," + id.ToString();
                            // selectedMedicineList.Add(m);
                        }
                    }
                }
                grdSelectedMedicine.DataSource = selectedList;
                grdSelectedMedicine.DataBind();
                ViewState["SelectedMedicine"] = selectedList;
                if (!string.IsNullOrEmpty(ids))
                {
                    ids = ids.Substring(1, ids.Length - 1);
                    foreach (string i in ids.Split(','))
                    {
                        int hid = Convert.ToInt32(Session["HospitalId"]);
                        Medicine m = obj.GetMedicineDetailsById(Convert.ToInt32(i), hid);
                        selectedMedicineList.Add(m);
                    }
                    ViewState["Selected"] = selectedMedicineList;
                }
                if (!string.IsNullOrEmpty(alreadyExistList))
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Failuer", "alert('Already Exist items are skipped:" + alreadyExistList + "')", true);
                }
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (ViewState["Selected"] != null)
            {
                selectedMedicineList = (List<Medicine>)ViewState["Selected"];
            }
            if (ViewState["SelectedMedicine"] != null)
            {
                selectedList = (List<Medicine>)ViewState["SelectedMedicine"];

            }

            foreach (GridViewRow row in grdSelectedMedicine.Rows)
            {
                CheckBox chk = row.FindControl("chkSelect") as CheckBox;
                if (chk.Checked)
                {
                    int idtoDelete = Convert.ToInt32(grdSelectedMedicine.DataKeys[row.RowIndex]["PK_Medicineid"]);
                    Medicine m = selectedList.First(x => x.PK_Medicineid == idtoDelete);//obj.GetMedicineDetailsById(idtoDelete);
                    //selectedList.First(x => x.PK_Medicineid == idtoDelete);
                    selectedList.Remove(m);
                    Medicine m2 = selectedMedicineList.First(x => x.PK_Medicineid == idtoDelete);//obj.GetMedicineDetailsById(idtoDelete);
                    selectedMedicineList.Remove(m2);
                }
            }
            if (selectedMedicineList.Count > 0)
            {
                ViewState["Selected"] = selectedMedicineList;
            }
            else
            {
                ViewState["Selected"] = null;
            }
            if (selectedList.Count > 0)
            {
                ViewState["SelectedMedicine"] = selectedList;
            }
            else
            {
                ViewState["SelectedMedicine"] = null;
            }
            grdSelectedMedicine.DataSource = selectedList;
            grdSelectedMedicine.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Doctor/OPDPatient.aspx");
        }
    }
}