<%@ Page Title="" Language="C#" MasterPageFile="~/ReceptionMaster.Master" AutoEventWireup="true" CodeBehind="PrescriptionList.aspx.cs" Inherits="HMS.Reception.PrescriptionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 10px;">
        <asp:Label ID="txtDocPage" runat="server" Text="Prescription List" CssClass="label label-info" Font-Size="20px"></asp:Label>
    </div>
    <asp:GridView ID="grdPatientList" runat="server" AutoGenerateColumns="false" CssClass="table" OnRowCommand="grdPatientList_RowCommand">
        <Columns>
            <asp:BoundField DataField="PKPrescriptionId" HeaderText="Prescription Id" />
            <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" />
            <asp:BoundField DataField="Name" HeaderText="Patient Name" />
            <asp:BoundField DataField="Gender" HeaderText="Patient Gender" />
            <asp:BoundField DataField="Mobile" HeaderText="Patient Mobile" />
            <asp:BoundField DataField="Age" HeaderText="Patient Age" />
            <asp:BoundField DataField="PrescriptionRemark" HeaderText="Prescription Remark" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("PKPrescriptionId") %>' CommandName="download">Download Prescription</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
