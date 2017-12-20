<%@ Page Title="" Language="C#" MasterPageFile="~/ReceptionMaster.Master" AutoEventWireup="true" CodeBehind="PatientList.aspx.cs" Inherits="HMS.Reception.PatientList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" CssClass="col-md-12" GroupingText="Patient List">
        <asp:GridView ID="grdPatientList" runat="server" CssClass="table table-hover" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Patient Name" />
                <asp:BoundField DataField="Mobile" HeaderText="Patient Mobile" />
                <asp:BoundField DataField="Email" HeaderText="Patient Email" />
                <asp:BoundField DataField="Gender" HeaderText="Patient Gender" />
                <asp:BoundField DataField="Purposeofvisit" HeaderText="Purpose" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Content>
