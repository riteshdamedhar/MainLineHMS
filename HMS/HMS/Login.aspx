<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HMS.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 355px;
            height: 149px;
        }
        .auto-style4 {
            width: 100%;
            border-collapse: collapse;
            border: 3px solid #008000;
            background-color: #EEA7C1;
            height: 70px;
        }
        .auto-style5 {
            width: 168px;
            height: 25px;
        }
        .auto-style6 {
            color: #3399FF;
            height: 23px;
        }
        .auto-style7 {
            color: #CC99FF;
            height: 25px;
        }
        .auto-style8 {
            margin-left: 118px;
        }
        .auto-style9 {
            width: 168px;
            height: 23px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-bordered" style="width:500px;margin:auto;margin-top:20px !important;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="User Type"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                    <asp:ListItem Value="--Select--" Text="--Select--"></asp:ListItem>
                    <asp:ListItem Value="HospitalAdmin" Text="HospitalAdmin"></asp:ListItem>
                    <asp:ListItem Value="Doctor" Text="Doctor"></asp:ListItem>
                    <asp:ListItem Value="Reception" Text="Reception"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnogin_Click"/>
                <br />
                <asp:LinkButton ID="lnkForgetPassword" runat="server">Forget Password</asp:LinkButton>
            </td>
        </tr>
    </table>

    <script type="text/javascript">

        $(document).ready(function () {

            $("#LoginItem").addClass("current_page_item");
        });
    </script>
</asp:Content>
