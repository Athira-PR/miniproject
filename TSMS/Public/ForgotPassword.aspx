<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="TSMS.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="FormStyle">
        <asp:Label ID="LblEmail" runat="server" Text="Enter Your Email address"></asp:Label><br /><br />
        <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox><br /><br />
        <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label><br /><br />
        <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
    </div>
</asp:Content>
