<%@ Page Title="" Language="C#" MasterPageFile="~/HospitalAdmin.Master" AutoEventWireup="true" CodeBehind="ManageReception.aspx.cs" Inherits="HMS.HospitalAdmin.ManageReception" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 483px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:10px">
    <asp:Label ID="lblRecPage" runat="server" Text="Reception Page" CssClass="label label-info" Font-Size="20px"></asp:Label>
    </div> <br />
    <asp:Panel ID="pnlAddForm" runat="server" GroupingText ="Add Item" Visible="false">
    <table class="table">
        <tr>
            <td>
                 Full Name
            </td>
            <td>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>       
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="R" ControlToValidate="txtFullName" runat="server" ErrorMessage="Full name is Required" Style="color: red; font-style: italic; font-size: 12px"></asp:RequiredFieldValidator>               
           </td> 
        </tr>
        <tr >  
            <td> 
                 Date of Birth  
            </td> 
            <td> <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="R" ControlToValidate="txtDOB" runat="server" ErrorMessage="Date of Birth is Required" Style="color: red; font-style: italic; font-size: 12px"></asp:RequiredFieldValidator>                
            </td>  
            
        </tr>
        <tr>
            <td> 
                 AGE
            </td>
            <td>
                <asp:TextBox ID="txtAGE" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="R" ControlToValidate="txtAge" runat="server" ErrorMessage="Age is Required" Style="color: red; font-style: italic; font-size: 12px"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
               Gender
            </td>
            <td>
                <asp:RadioButtonList ID="rbtGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value ="Male" Text="Male"></asp:ListItem>
                    <asp:ListItem Value ="Female" Text="Female"></asp:ListItem>
                </asp:RadioButtonList>                     
            </td>
        </tr>
        <tr>
            <td>
               Address
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="R" ControlToValidate="txtAddress" runat="server" ErrorMessage="Address is Required" Style="color: red; font-style: italic; font-size: 12px"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> 
                Mobile Number
            </td>
            <td>
                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Please enter correct contact number-10 Digit" ControlToValidate="txtMobileNumber" ValidationGroup="R" MaximumValue="9999999999" MinimumValue="1000000000" Display="Dynamic"></asp:RangeValidator>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtMobileNumber" runat="server" ErrorMessage="Mobile number is Required" ValidationGroup="R" Style="color: red; font-style: italic; font-size: 12px" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> 
                Email
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="R" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email is Required" Style="color: red; font-style: italic; font-size: 12px"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> 
                Password
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="R" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password is Required" Style="color: red; font-style: italic; font-size: 12px"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>          
            <td>
                <asp:Button ID="btnSave" runat="server" Text="SAVE" CssClass="btn btn-primary" ValidationGroup="R" OnClick="btnSave_Click"/>
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" CssClass="btn btn-primary" OnClick="btnCancel_Click"/>
                <br />
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel><br />

         <asp:Panel ID="pnlGrid" runat="server" GroupingText="List of Items">
         <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary"  Text="Add New Entry" Onclick="btnAdd_Click"/><br />
        <asp:GridView ID="grdGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="PK_Reception" OnRowCommand="grdGridView_RowCommand" CssClass="table">

            <Columns>
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                <asp:BoundField DataField="MobileNumber" HeaderText="Contact Number" />
                <asp:BoundField DataField="Email" HeaderText="Email Address" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("PK_Reception") %>' CommandName="EditData" >Edit</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("PK_Reception") %>' CommandName="DeleteData">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:HiddenField ID="hdnOperationType" runat="server" />
    <asp:HiddenField ID="hdnIDPK" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {
        
            $("[id$=txtDOB]").datepicker({
              showOn:'button',
              changeYear: true,
              changeMonth: true,
              buttonImageOnly: true,
              buttonImage: '../Images/Calender.png',
              maxDate: new Date(),
              altFormat: "dd-mm-yy",
              dateFormat:'dd-mm-yy'
            });          
        });
    </script>
</asp:Content>

 