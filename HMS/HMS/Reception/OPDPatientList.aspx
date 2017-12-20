<%@ Page Title="" Language="C#" MasterPageFile="~/ReceptionMaster.Master" AutoEventWireup="true" CodeBehind="OPDPatientList.aspx.cs" Inherits="HMS.Reception.OPDPatientList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlOPDList" runat="server" GroupingText="OPD PATIENT LIST">
        <asp:GridView ID="grdOPDList" runat="server" CssClass="table table-hover" AutoGenerateColumns="false" OnRowCommand="grdOPDList_RowCommand">
             <Columns>
                <asp:BoundField DataField="Name" HeaderText="Patient Name" />
                <asp:BoundField DataField="Mobile" HeaderText="Patient Mobile" />
                <asp:BoundField DataField="Email" HeaderText="Patient Email" />
                <asp:BoundField DataField="Gender" HeaderText="Patient Gender" />
                <asp:BoundField DataField="Purposeofvisit" HeaderText="Purpose" />
                 <asp:TemplateField>
                     <ItemTemplate>
                         <asp:Button ID="Button1" runat="server" Text="Download Prescription" CssClass="btn btn-primary"/>
                     </ItemTemplate>
                 </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Content>
