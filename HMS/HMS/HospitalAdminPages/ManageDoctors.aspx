<%@ Page Title="" Language="C#" MasterPageFile="~/HospitalAdmin.Master" AutoEventWireup="true" CodeBehind="ManageDoctors.aspx.cs" Inherits="HMS.HospitalAdmin.ManageDoctors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlAddList" runat="server" GroupingText="Add Item">
    <table>
     <tr>
         <td>
             DoctorName
         </td>
         <td>
             <asp:TextBox ID="txtDoctorName" runat="server" CssClass="form-control"></asp:TextBox>                         
         </td>
     </tr>
     <tr>
          <td>
              DoctorAddress
          </td>
         <td>
             <asp:TextBox ID="txtDoctorAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
         </td>
     </tr>
     <tr>
          <td>
              ContactNumber
          </td>
         <td>
             <asp:TextBox ID="txtContactnumber" runat="server" CssClass="form-control"></asp:TextBox>
         </td>
     </tr>
     <tr>
           <td>
               Email
           </td>
           <td>
               <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
           </td>
     </tr>
     <tr>
           <td>
               Education
           </td>
           <td>
               <asp:TextBox ID="txtEducation" runat="server" CssClass="form-control"></asp:TextBox>
           </td>  
     </tr> 
      <tr>
            <td>
                Specialization
            </td>
            <td>
                <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
      </tr>  
      <tr>
             <td>
                 Experience
             </td>
             <td>
                 <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control"></asp:TextBox>
             </td>
      </tr>
      <tr>
              <td>
                  JoiningDate
              </td>
              <td>
                  <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="form-control"></asp:TextBox>
              </td>
      </tr>
      <tr>
              <td>
                  LeavingDate
              </td>
              <td>
                  <asp:TextBox ID="txtLeavingDate" runat="server" CssClass="form-control"></asp:TextBox>
              </td>
      </tr>
      <tr>
          <td>
          <asp:Button ID="btnSave" runat="server" Text="SAVE" OnClick="btnSave_Click"/>
          <asp:Button ID="btnCancel" runat="server" Text="CANCEL" />
          <br />
              <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
          </td>
      </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="pnlGrid" runat="server" GroupingText="Add list of items">
      <asp:GridView ID="grdGridview" runat="server"></asp:GridView>
    </asp:Panel>
</asp:Content>
