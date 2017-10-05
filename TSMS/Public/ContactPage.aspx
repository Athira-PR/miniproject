<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="TSMS.Public.ContactPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="FormStyle">
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
            <p>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Segoe Script" Font-Size="Large" ForeColor="#990000" Text="Please Fill Following to send mail..."></asp:Label>
            </p>
            <p>
                <asp:Label ID="Label2" runat="server" Text="Your Name:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="YourName" ErrorMessage="*" ValidationGroup="save"></asp:RequiredFieldValidator><br />
                <asp:TextBox ID="YourName" runat="server" Width="300px" /><br />
                <asp:Label ID="Label3" runat="server" Text="Your Email Address:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="YourEmail" ValidationGroup="save" /><br />
                <asp:TextBox ID="YourEmail" runat="server" Width="300px" /><br />
                <asp:Label ID="Label4" runat="server" Text="Subject:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="YourSubject" ValidationGroup="save" /><br />
                <asp:TextBox ID="YourSubject" runat="server" Width="300px" /><br />
                <asp:Label ID="Label5" runat="server" Text="Comments:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="Comments" ValidationGroup="save" /><br />
                <asp:TextBox ID="Comments" runat="server" TextMode="MultiLine" Rows="10" Width="300px" />
            </p>
            <p>
                <asp:Button ID="btnSubmit" runat="server" Text="Send" OnClick="btnSubmit_Click" ValidationGroup="save" BackColor="#FFCC99" Font-Bold="True" Font-Size="Medium" float="right" />
            </p>
        </asp:Panel>
        <p>
            <asp:Label ID="DisplayMessage" runat="server" Visible="false" ForeColor="#800000" Font-Size="Medium" />
        </p>  
        <a href="../LoginPage.aspx">Back to Login</a>
   </div>
</asp:Content>
