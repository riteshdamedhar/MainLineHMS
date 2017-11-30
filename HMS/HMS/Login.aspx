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
    <table class="auto-style3">
        <tr>
            <td class="box1" role="checkbox" rowspan="2" style="width: 363px">ENTER LOGIN DETAILS<br />
                <table class="auto-style4">
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="Label1" runat="server" Text="USER NAME"></asp:Label>
                        </td>
                        <td class="auto-style7" style="display: inline"></td>
                    </tr>
                    <tr>
                        <td class="auto-style9">
                            <asp:Label ID="Label2" runat="server" Text="PASSWORD"></asp:Label>
                        </td>
                        <td id="txtpwd" class="auto-style6">&nbsp;&nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="btnLogin" runat="server" CssClass="auto-style8" Height="35px" Text="LOGIN" Width="118px" BackColor="#66FFFF" BorderColor="#66CCFF" Font-Bold="True" Font-Italic="False" Font-Names="Aharoni" Font-Overline="False" Font-Size="Medium" ForeColor="#6600FF" />
                <br />
               </td>
        </tr>
         <tr>
             <asp:button ID="Button1" runat="server" Text="USER NAME" />         
         </tr>

    </table>

    <script type="text/javascript">

        $(document).ready(function () {

            $("#LoginItem").addClass("current_page_item");
        });
    </script>
</asp:Content>
