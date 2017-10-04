<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="TSMS.Public.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form1">
        <asp:Label ID="Label1" runat="server" Text="Reset your password" Font-Bold="True" Font-Names="MV Boli" Font-Size="Large" Font-Underline="True" ForeColor="#990000"></asp:Label><br /><br />
        <asp:Label ID="Lblname" runat="server" Text="User name:"></asp:Label><br />
        <asp:TextBox ID="txtname" runat="server" Width="250px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ErrorMessage="cant be blank" ForeColor="Red"></asp:RequiredFieldValidator>
        <br /><br />
        <asp:Label ID="LblNewPass" runat="server" Text="New Password:"></asp:Label><br />
        <asp:TextBox ID="txtnewpass" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtname" ControlToValidate="txtnewpass" ErrorMessage="User name and password cant be same" ForeColor="#009900" Operator="NotEqual"></asp:CompareValidator>
        <br /><br />
        <asp:Label ID="LblCpass" runat="server" Text="Confirm Password"></asp:Label><br />
        <asp:TextBox ID="txtcpass" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnewpass" ControlToValidate="txtcpass" ErrorMessage="Passwords do not match" ForeColor="#009933"></asp:CompareValidator>
        <br /><br />
        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" /><br /><br />
        <asp:Label ID="Lblmessege" runat="server" Text=""></asp:Label><br /><br />
        <a href="../LoginPage.aspx">Back to Login...</a>
    </div>
</asp:Content>
