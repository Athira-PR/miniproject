<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="TSMS.ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ErrorPage</title>
</head>
<body>
    <form id="form" runat="server">
    <div class="container">
       <h2 style="color:red">Some unexpected error occurred..... :(</h2><br />
       <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"  >Redirect To Login</asp:LinkButton>
    </div>
    </form>
</body>
</html>
