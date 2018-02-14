<%@ Page Title="" Language="C#" MasterPageFile="~/HospitalAdmin.Master" AutoEventWireup="true" CodeBehind="ManageMedicineCatelog.aspx.cs" Inherits="HMS.HospitalAdmin.ManageMedicineCatelog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div style="margin-top:10px">
    <asp:Label ID="lblMedCatlog" runat="server" Text="Medicine Catelog Page" CssClass="label label-info" Font-Size="20px"></asp:Label>
    </div> <br />
    <asp:Panel ID="pnlAddForm" runat="server" GroupingText="Add item" Visible="false" >

        <table class="table">
            <tr>
                <td>Medicine Name
                </td>
                <td>
                    <asp:TextBox ID="txtMedicineName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="M" ControlToValidate="txtMedicineName" runat="server" ErrorMessage="Medicine name is Required" Style="color: red; font-style: italic; font-size: 12px"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Medicine Category
                </td>
                <td>
                    <asp:TextBox ID="txtMedicineCategory" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="M" ControlToValidate="txtMedicineCategory" runat="server" ErrorMessage="Medicine Category is Required" Style="color: red; font-style: italic; font-size: 12px"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Remark
                </td>
                <td>
                    <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="M" ControlToValidate="txtRemark" runat="server" ErrorMessage="Remar is Required" Style="color: red; font-style: italic; font-size: 12px"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="M" OnClick="btnSave_Click"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary" OnClick="btnCancel_Click"/>
                    <br />
                    <asp:Label ID="lblMessage" runat="server" Text="Saved Successfully"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel><br />

    <asp:Panel ID="pnlGrid" runat="server" GroupingText="List of Items">
        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add New Entry" Onclick="btnAdd_Click"/><br />
        <asp:GridView ID="grdGridView" runat="server" AutoGenerateColumns="False" DataKeyNames=" PK_Medicineid" OnRowCommand="grdGridView_RowCommand" CssClass="table">

            <Columns>
                <asp:BoundField DataField="MedicineName" HeaderText="MedicineName" />
                <asp:BoundField DataField="MedicineCategory" HeaderText="MedicineCategory" />
                <asp:BoundField DataField="Remark" HeaderText="Remarks" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("PK_Medicineid")%>' CommandName="EditField">Edit</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%#Eval("PK_Medicineid")%>' CommandName="DeleteField">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
    </asp:Panel>
    <asp:HiddenField ID="hdnOperationType" runat="server" />
    <asp:HiddenField ID="hdnIdPK" runat="server" />
</asp:Content>
