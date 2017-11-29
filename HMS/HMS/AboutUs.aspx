<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMaster.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="HMS.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    This is about my us page
    <script type="text/javascript">

        $(document).ready(function () {

            $("#AboutUsItem").addClass("current_page_item");
        });
    </script>
</asp:Content>
