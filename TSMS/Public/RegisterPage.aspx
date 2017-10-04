<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="TSMS.Public.RegisterPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../stylesheet.css" rel="stylesheet" />
    <div class="wrapper">
       <div class="form1">
           <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" Font-Underline="True" ForeColor="#663300" Text="REGISTER"></asp:Label><br /><br />
           <asp:Label ID="LblValidation" runat="server" ForeColor="#FF3300"></asp:Label>
           <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtName" ControlToValidate="txtPassword" ErrorMessage="Username and password cant be same" ForeColor="#009900" Operator="NotEqual"></asp:CompareValidator><br />
           <asp:Label ID="lblname" runat="server" Text="User Name:"></asp:Label><br />
           <asp:TextBox ID="txtName" runat="server" Width="250px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="User name is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
           <asp:Label ID="lblmail" runat="server" Text="Email:"></asp:Label><br />
           <asp:TextBox ID="txtMail" runat="server" Width="250px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMail" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="vgSubmit" ControlToValidate="txtMail" CssClass="requiredFieldValidateStyle" ForeColor="Red"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> </asp:RegularExpressionValidator><br />
           <asp:Label ID="lblpwd" runat="server" Text="Password:"></asp:Label><br />
           <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="password is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
           <asp:Label ID="lblcpwd" runat="server" Text="Confirm Password:"></asp:Label><br />
           <asp:TextBox ID="txtCPassword" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="This can't be blank" ForeColor="Red"></asp:RequiredFieldValidator>
           <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" ErrorMessage="Passwords do not match" ForeColor="#009900"></asp:CompareValidator><br />
           <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" BackColor="#FFCC99" Font-Bold="True" Font-Size="Medium" float="right"/><br /><br />
           <a href="../LoginPage.aspx">Sign in</a>
       </div>  
       <div class="sucess">
          <asp:Label ID="LblSuccess1" runat="server" ForeColor="Maroon" Font-Bold="True" Font-Italic="True" Font-Names="Segoe UI Black" Font-Size="XX-Large" ></asp:Label><br />
          <asp:Label ID="LblSucess2" runat="server" ForeColor="Maroon" Font-Size="Large" Font-Bold="True" ></asp:Label>
        </div>
   </div>
      
</asp:Content>
