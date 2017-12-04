<%@ Page Title="" Language="C#" MasterPageFile="~/ReceptionMaster.Master" AutoEventWireup="true" CodeBehind="PatientRegistration.aspx.cs" Inherits="HMS.Reception.PatientRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-hover">
        <tr>
            <td >Patient Name
            </td>
            <td>
                <asp:TextBox ID="txtPatientName" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >Age
            </td>
            <td>
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >Patient Address Line1
            </td>
            <td>
                <asp:TextBox ID="txtAddressLine1" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >Patient Address Line2
            </td>
            <td>
                <asp:TextBox ID="txtAddressLine2" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >Country
            </td>
            <td>
                <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
                    <asp:ListItem>--Select--</asp:ListItem>
                    <asp:ListItem>India</asp:ListItem>
                    <asp:ListItem>USA</asp:ListItem>
                    <asp:ListItem>Mexico</asp:ListItem>
                    <asp:ListItem>Australia</asp:ListItem>
                    <asp:ListItem>Newzeland</asp:ListItem>
                    <asp:ListItem>Canada</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td >State
            </td>
            <td>
                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                    <asp:ListItem>--Select--</asp:ListItem>
                    <asp:ListItem>Denver</asp:ListItem>
                    <asp:ListItem>Newyork</asp:ListItem>
                    <asp:ListItem>Chicago</asp:ListItem>
                    <asp:ListItem>Texas</asp:ListItem>
                    <asp:ListItem>Kentuky</asp:ListItem>
                    <asp:ListItem>Tenessee</asp:ListItem>
                    <asp:ListItem>California</asp:ListItem>
                    <asp:ListItem>Atlanta</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td >City
            </td>
            <td>
                <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control">
                    <asp:ListItem>--Select--</asp:ListItem>
                    <asp:ListItem>Fairfax</asp:ListItem>
                    <asp:ListItem>Centreville</asp:ListItem>
                    <asp:ListItem>Herndon</asp:ListItem>
                    <asp:ListItem>Vienna</asp:ListItem>
                    <asp:ListItem>Alexendria</asp:ListItem>
                    <asp:ListItem>Arlington</asp:ListItem>
                    <asp:ListItem>Gaithesburg</asp:ListItem>
                    <asp:ListItem>Reston</asp:ListItem>
                    <asp:ListItem>Manassas</asp:ListItem>
                </asp:DropDownList>              
            </td>
        </tr>
        <tr>
            <td >Pincode
            </td>
            <td>
                <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >Mobile Number
            </td>
            <td>
                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >Email
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >Gender
            </td>
            <td>
                <asp:RadioButtonList ID="rbtGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>            
            </td>
        </tr>
        <tr>
            <td >Purpose Of Visit
            </td>
            <td>
                <asp:TextBox ID="txtPurposeofVisit" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >Remark
            </td>
            <td>
                <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" />
            </td>

        </tr>
    </table>
</asp:Content>
