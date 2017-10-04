<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="AddTaskPage.aspx.cs" Inherits="TSMS.AddTaskPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form1">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Comic Sans MS" Font-Size="Larger" Font-Underline="True" ForeColor="#990000" Text="Add Your Task"></asp:Label><br /><br />
        <asp:Label ID="lblname" runat="server" Text="Task Name:"></asp:Label><br />
        <asp:TextBox ID="txtname" runat="server" Width="250px"></asp:TextBox>
        <asp:Label ID="LblNameValidation" runat="server" ForeColor="Red"></asp:Label><br /><br />
        <asp:Label ID="lblSDate" runat="server" Text="Start Date:"></asp:Label><br />
        <asp:TextBox ID="txtSDate" runat="server" TextMode="Date" Width="250px" ></asp:TextBox><br /><br />
        <asp:Label ID="lblEDate" runat="server" Text="End Date:"></asp:Label><br />
        <asp:TextBox ID="txtEDate" runat="server" TextMode="Date" Width="250px"></asp:TextBox><br /><br />
        <asp:Label ID="lblEhours" runat="server" Text="Estimated Hours:"></asp:Label><br />
        <asp:TextBox ID="txtEHours" runat="server" Width="250px"></asp:TextBox><br /><br /><br />
        <asp:Button ID="btnAddTask" runat="server" OnClick="btnAddTask_Click" Text="Add Task" BackColor="#CC6600" Font-Bold="True" Font-Names="Arial Black" Font-Size="Medium" ForeColor="#993300" /><br /><br />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"  BackColor="#CC6600" Font-Bold="True" Font-Names="Arial Black" Font-Size="Medium" ForeColor="#993300" />
    </div>
</asp:Content>
