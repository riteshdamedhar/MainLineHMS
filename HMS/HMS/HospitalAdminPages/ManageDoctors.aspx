<%@ Page Title="" Language="C#" MasterPageFile="~/HospitalAdmin.Master" AutoEventWireup="true" CodeBehind="ManageDoctors.aspx.cs" Inherits="HMS.HospitalAdmin.ManageDoctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin-top:10px;">
        <asp:Label ID="txtDocPage" runat="server" Text="Doctor Page" CssClass="label label-info" Font-Size="20px"></asp:Label>
    </div>
    <asp:Panel ID="pnlAddForm" runat="server" GroupingText="Add item " Visible="false">
        <table class="table" style="width: 70%; margin: auto;">
            <tr>
                <td>DoctorName <span style="color: red">*</span>
                </td>
                <td>
                    <asp:TextBox ID="txtDoctorName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="s" ControlToValidate="txtDoctorName" runat="server" ErrorMessage="First name is Required" Style="color: red" font-style="italic" Font-Size="Small"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    DoctorAddress
                </td>
                <td>
                    <asp:TextBox ID="txtDoctorAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="s" ControlToValidate="txtDoctorAddress" runat="server" ErrorMessage="Doctor Address is Required" Style="color: red" font-style="italic" Font-Size="Small"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    ContactNumber
                </td>
                <td>
                    <asp:TextBox ID="txtContactnumber" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Please enter correct contact number-10 Digit" ControlToValidate="txtContactNumber" ValidationGroup="s" MaximumValue="9999999999" MinimumValue="1000000000" Display="Dynamic"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtContactNumber" runat="server" ErrorMessage="Contact number is Required" ValidationGroup="s" Style="color: red; font-style: italic; font-size: 12px" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Email
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email is Required" Style="color: red" font-style="italic" Font-Size="Small" ValidationGroup="s"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtEmail" runat="server" ValidationGroup="s" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Style="color: red" font-style="italic" Font-Size="Small"></asp:RegularExpressionValidator>               
                </td>
            </tr>
            <tr>
                <td>
                    Password
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="s" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password is Required" Style="color: red" font-style="italic" Font-Size="Small"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Education
                </td>
                <td>
                    <asp:TextBox ID="txtEducation" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="s" ControlToValidate="txtEducation" runat="server" ErrorMessage="Education details is Required" Style="color: red" font-style="italic" Font-Size="Small"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>
                    Specialization
                </td>
                <td>
                    <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="s" ControlToValidate="txtSpecialization" runat="server" ErrorMessage="Specialization is Required" Style="color: red" font-style="italic" Font-Size="Small"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>
                    Experience
                </td>
                <td>
                    <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="s" ControlToValidate="txtExperience" runat="server" ErrorMessage="Experience is Required" Style="color: red" font-style="italic" Font-Size="Small"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>
                    JoiningDate
                </td>
                <td>
                    <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="s" ControlToValidate="txtJoiningDate" runat="server" ErrorMessage="Joining date is Required" Style="color: red" font-style="italic" Font-Size="Small"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    LeavingDate
                </td>
                <td>
                    <asp:TextBox ID="txtLeavingDate" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="s" ControlToValidate="txtLeavingDate" runat="server" ErrorMessage="Leaving date is Required" Style="color: red" font-style="italic" Font-Size="Small"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="SAVE" ValidationGroup="s" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-primary" Text="CANCEL" OnClick="btnCancel_Click" />
                    <br />
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />

    <asp:Panel ID="pnlGrid" runat="server" GroupingText="List of Items">
        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add New Entry" OnClick="btnAdd_Click" /><br />
        <asp:GridView ID="grdGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="PK_Doctor" OnRowCommand="grdGridView_RowCommand" CssClass="table">

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
