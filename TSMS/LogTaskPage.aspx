<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="LogTaskPage.aspx.cs" Inherits="TSMS.LogTaskPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br />
    <div style="text-align:center; background-color:#e7ceb6" >
        <asp:Label ID="Label1" runat="server" Text="Choose Your Task" Font-Italic="True" Font-Names="MV Boli" Font-Size="Large" ForeColor="Maroon" Font-Bold="True"></asp:Label><br /><br /><br />
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" Width="300px" BackColor="#663300" ForeColor="#e7ceb6"></asp:DropDownList>
    </div><br /><br /><br /><br /><br />
    <div class="gridStyle">      
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"  OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" HorizontalAlign="Center" VerticalAlign="Middle" Width="1000px">    
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Add" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="TaskId" Visible="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("TaskId") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText=" Task Name">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("TaskName") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Start Date">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_SDate"  runat="server" Text='<%#Eval("StartDate","{0:yyyy/MM/dd}") %>' ></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="End Date">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_EDate" runat="server" Text='<%#Eval("EndDate","{0:yyyy/MM/dd}") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Estimated Hours">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_EHours" runat="server" Text='<%#Eval("EstimatedHours") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Logged Hours">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_LHours" runat="server" Text='<%#Eval("LoggedHours") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_LHours" runat="server" Text='<%#Eval("LoggedHours") %>' ></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff" Height="20px" />  
            <RowStyle BackColor="#e7ceb6" Height="50px" Width="500px"/>  
        </asp:GridView>  
    </div>  
</asp:Content>
