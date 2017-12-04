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
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnLogin" runat="server" Text="Login" />
            </td>
        </tr>
    </table>

    <script type="text/javascript">

        $(document).ready(function () {

            $("#LoginItem").addClass("current_page_item");
        });
    </script>
</asp:Content>
