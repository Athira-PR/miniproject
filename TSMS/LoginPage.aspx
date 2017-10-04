<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="TSMS.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="stylesheet.css" rel="stylesheet" />
    <div class="wrapper"> 
        <div class="form1">  
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" Font-Underline="True" ForeColor="#663300" Text="LOGIN"></asp:Label><br /><br />
            <asp:Label ID="LblValidation" runat="server" ForeColor="#FF3300"></asp:Label><br /><br />
            <asp:Label ID="lblusername" runat="server" Text="User Name"></asp:Label><br />
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ErrorMessage="Name is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
            <asp:Label ID="lblpassword" runat="server" Text="Password"></asp:Label><br />
            <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="password is required" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
            <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Login" BackColor="#C26C0B" Font-Bold="True" Font-Size="Medium" /><br /><br />
            <a href="Public/RegisterPage.aspx">New User??</a><br />
            <a href="Public/ForgotPassword.aspx">Forgot Password??</a>
         </div>      
    </div> 
</asp:Content>
