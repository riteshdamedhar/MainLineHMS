<%@ Page Title="" Language="C#" MasterPageFile="~/HospitalAdmin.Master" AutoEventWireup="true" CodeBehind="ManageReception.aspx.cs" Inherits="HMS.HospitalAdmin.ManageReception" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 483px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlAddForm" runat="server" GroupingText ="Add Item" Visible="false">
    <table class="table table-hover">
        <tr>
            <td class="auto-style1"> Full Name
            </td>
            <td>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
            </td> 
        </tr>
        <tr >  
            <td  >  Date of Birth   </td> 
            <td> <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" Width="200"></asp:TextBox></td>       
        </tr>

        <tr>
            <td class="auto-style1">  AGE
            </td>
            <td>
                <asp:TextBox ID="txtAGE" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">  Gender
            </td>
            <td>
                <asp:RadioButtonList ID="rbtGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value ="Male" Text="Male"></asp:ListItem>
                    <asp:ListItem Value ="Female" Text="Female"></asp:ListItem>
                </asp:RadioButtonList>                     
            </td>
        </tr>
        <tr>
            <td class="auto-style1">  Address
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">  Mobile Number
            </td>
            <td>
                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">  Email
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>          
            <td>
                <asp:Button ID="btnSave" runat="server" Text="SAVE" OnClick="btnSave_Click"/>
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" OnClick="btnCancel_Click"/>
                <br />
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="pnlGrid" runat="server" GroupingText="List of Items">
         <asp:Button ID="btnAdd" runat="server" Text="Add New Entry" Onclick="btnAdd_Click"/><br />
        <asp:GridView ID="grdGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="PK_Reception" OnRowCommand="grdGridView_RowCommand">

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
