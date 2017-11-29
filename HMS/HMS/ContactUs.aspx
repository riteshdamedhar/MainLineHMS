<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="HMS.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    This is my Contact us page
    <script type="text/javascript">

        $(document).ready(function () {

            $("#ContactUsItem").addClass("current_page_item");
        });
    </script>
</asp:Content>
