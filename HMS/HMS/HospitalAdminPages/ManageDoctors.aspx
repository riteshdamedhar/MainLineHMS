<%@ Page Title="" Language="C#" MasterPageFile="~/HospitalAdmin.Master" AutoEventWireup="true" CodeBehind="ManageDoctors.aspx.cs" Inherits="HMS.HospitalAdmin.ManageDoctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlAddForm" runat="server" GroupingText="Add item " Visible="false">
        <table class="table" style="width:70%;margin:auto;">
            <tr>
                <td>DoctorName
                </td>
                <td>
                    <asp:TextBox ID="txtDoctorName" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>DoctorAddress
                </td>
                <td>
                    <asp:TextBox ID="txtDoctorAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>ContactNumber
                </td>
                <td>
                    <asp:TextBox ID="txtContactnumber" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Email
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Education
                </td>
                <td>
                    <asp:TextBox ID="txtEducation" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Specialization
                </td>
                <td>
                    <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Experience
                </td>
                <td>
                    <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>JoiningDate
                </td>
                <td>
                    <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>LeavingDate
                </td>
                <td>
                    <asp:TextBox ID="txtLeavingDate" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="SAVE" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="CANCEL" OnClick="btnCancel_Click" />
                    <br />
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlGrid" runat="server" GroupingText="List of Items">
        <asp:Button ID="btnAdd" runat="server" Text="Add New Entry" OnClick="btnAdd_Click" /><br />
        <asp:GridView ID="grdGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="PK_Doctor" OnRowCommand="grdGridView_RowCommand">

            <Columns>
                <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" />
                <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" />
                <asp:BoundField DataField="Email" HeaderText="Email Address" />
                <asp:BoundField DataField="Specialization" HeaderText="Specialization" />
                <asp:BoundField DataField="Experience" HeaderText="Experience" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("PK_Doctor") %>' CommandName="EditData">Edit</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("PK_Doctor") %>' CommandName="DeleteData">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:HiddenField ID="hdnOperationType" runat="server" />
    <asp:HiddenField ID="hdnIDPK" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {

            $("[id$=txtJoiningDate]").datepicker({
                showOn: 'button',
                changeYear: true,
                changeMonth: true,
                buttonImageOnly: true,
                buttonImage: '../Images/Calender.png',
                maxDate: new Date(),
                altFormat: "dd-mm-yy",
                dateFormat: 'dd-mm-yy'               
            });
            $("[id$=txtLeavingDate]").datepicker({
               showOn: 'button',
                changeYear: true,
                changeMonth: true,
               buttonImageOnly: true,
               buttonImage: '../Images/Calender.png',
                maxDate: new Date(),
                altFormat: "dd-mm-yy",
                dateFormat: 'dd-mm-yy'
            });
            
        });
    </script>
</asp:Content>
