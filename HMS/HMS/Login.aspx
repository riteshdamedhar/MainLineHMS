﻿<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HMS.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    This is My Login Page

    <script type="text/javascript">

        $(document).ready(function () {

            $("#LoginItem").addClass("current_page_item");
        });
    </script>
</asp:Content>
