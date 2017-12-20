<%@ Page Title="" Language="C#" MasterPageFile="~/HospitalAdmin.Master" AutoEventWireup="true" CodeBehind="ManageMedicineCatelog.aspx.cs" Inherits="HMS.HospitalAdmin.ManageMedicineCatelog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlAddForm" runat="server" GroupingText="Add item" Visible="false" >

        <table>
            <tr>
                <td>Medicine Name
                </td>
                <td>
                    <asp:TextBox ID="txtMedicineName" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Medicine Category
                </td>
                <td>
                    <asp:TextBox ID="txtMedicineCategory" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Remark
                </td>
                <td>
                    <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>
                    <br />
                    <asp:Label ID="lblMessage" runat="server" Text="Saved Successfully"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlGrid" runat="server" GroupingText="List of Items">
        <asp:Button ID="btnAdd" runat="server" Text="Add New Entry" Onclick="btnAdd_Click"/><br />
        <asp:GridView ID="grdGridView" runat="server" AutoGenerateColumns="False" DataKeyNames=" PK_Medicineid" OnRowCommand="grdGridView_RowCommand">

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
