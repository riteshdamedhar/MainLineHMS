<%@ Page Title="" Language="C#" MasterPageFile="~/ApplicationAdminMaster.Master" AutoEventWireup="true" CodeBehind="HospitalManagements.aspx.cs" Inherits="HMS.ApplicationAdmin.HospitalManagements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <asp:Panel ID = "pnlAddForm" runat="server" GroupingText="Add item" Visible="false">
  
    <table>
        <tr>
            <td>
                Hospital Name
            </td>
            <td>
                <asp:TextBox ID="txtHospitalName" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Address
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Hospital Admin Name
            </td>
            <td>
                <asp:TextBox ID="txtHospitalAdminName" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Hospital Contact
            </td>
            <td>
                <asp:TextBox ID="txtHospitalContact" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Admin Email
            </td>
            <td>
                <asp:TextBox ID="txtAdminEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Admin Contact
            </td>
            <td>
                <asp:TextBox ID="txtAdminContact" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
       <tr>
           <td>
               <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
               <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click"/>
               <asp:Button ID="btnCancel" runat="server" Text="Close" />
           </td>
       </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="pnlGrid" runat="server" GroupingText="List of items">
        <asp:Button ID="btnAdd" runat="server" Text="Add new Record" OnClick="btnAdd_Click"/><br />
        <asp:GridView ID="grdGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="PK_HospitalId" OnRowCommand="grdGridView_RowCommand">
            <Columns>
                <asp:BoundField DataField="HospitalName" HeaderText="Hospital Name" />
                <asp:BoundField DataField="HospitalAddress" HeaderText="Hospital Address" />
                <asp:BoundField DataField="HospitalAdminName" HeaderText="Hospital Admin Name" />
                <asp:BoundField DataField="HospitalContact" HeaderText="Hospital Contact" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>                   
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%#Eval("PK_HospitalId")  %>' CommandName="EditData">Edit</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%#Eval("PK_HospitalId")  %>' CommandName="DeleteData">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:HiddenField ID="hdnOperation" runat="server" />
    <asp:HiddenField ID="hdnId" runat="server" />
</asp:Content>
