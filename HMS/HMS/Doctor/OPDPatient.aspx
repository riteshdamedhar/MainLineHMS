<%@ Page Title="" Language="C#" MasterPageFile="~/DoctorMaster.Master" AutoEventWireup="true" CodeBehind="OPDPatient.aspx.cs" Inherits="HMS.Doctor.OPDPatient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlOPDList" runat="server" GroupingText="OPD PATIENT LIST">
        <asp:GridView ID="grdOPDList" runat="server" CssClass="table table-hover" AutoGenerateColumns="false" OnRowCommand="grdOPDList_RowCommand">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Patient Name" />
                <asp:BoundField DataField="Mobile" HeaderText="Patient Mobile" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:BoundField DataField="Gender" HeaderText="Patient Gender" />
                <asp:BoundField DataField="Purposeofvisit" HeaderText="Purpose" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="Button1" runat="server" Text="Add Prescription" CssClass="btn btn-primary" CommandName="AddPresc" CommandArgument='<%# Bind("PatientId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Content>
