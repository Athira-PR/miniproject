<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="TSMS.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="float:none" class="FormStyle">
      <asp:Label ID="Label1" runat="server" Text="Add Your Tasks" Font-Bold="True" Font-Italic="True" Font-Names="Segoe Script" Font-Size="X-Large" ForeColor="Maroon"></asp:Label><br />
      <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/add.png" Width="50" Height="50" runat="server" OnClick="ImageButton1_Click" /><br /><br />
      <asp:Label ID="Label2" runat="server" Text="Log Your Tasks" Font-Bold="True" Font-Italic="True" Font-Names="Segoe Script" Font-Size="X-Large" ForeColor="Maroon"></asp:Label><br />
      <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/log.png" Width="50" Height="50" runat="server" OnClick="ImageButton2_Click" /><br /><br />
    </div>
   
    <div class="GridStyle">      
        <br /><br /><br /><br /><br />
         <asp:Label ID="Lblmessage" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="MV Boli" Font-Size="Larger"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" HorizontalAlign="Center" VerticalAlign="Bottom" CellSpacing="5" Width="1000px" >  
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />  
                </ItemTemplate>  
                <EditItemTemplate>
                    <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                </EditItemTemplate>  
            </asp:TemplateField>  
            <asp:TemplateField>
                 <ItemTemplate>
                     <asp:Button ID="btn_Delete" runat="server" Text="Delete" CommandName="Delete" />
                 </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TaskId" Visible="false">  
                  <ItemTemplate>  
                      <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("TaskId") %>' ></asp:Label>  
                  </ItemTemplate>  
            </asp:TemplateField>  
            <asp:TemplateField HeaderText=" Task Name">
                <ItemTemplate>
                    <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("TaskName") %>'></asp:Label>  
                </ItemTemplate> 
                <EditItemTemplate>  
                     <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("TaskName") %>'></asp:TextBox>  
                </EditItemTemplate>  
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="Start Date">  
                <ItemTemplate>  
                     <asp:Label ID="lbl_SDate" runat="server" Text='<%#Eval("StartDate","{0:yyyy/MM/dd}") %>'></asp:Label>  
                </ItemTemplate>  
                <EditItemTemplate>  
                      <asp:TextBox ID="txt_SDate" runat="server" Text='<%#Eval("StartDate","{0:yyyy/MM/dd}") %>'></asp:TextBox>  
                </EditItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Date">  
                <ItemTemplate>
                    <asp:Label ID="lbl_EDate" runat="server" Text='<%#Eval("EndDate","{0:yyyy/MM/dd}") %>'></asp:Label>  
                </ItemTemplate>  
                <EditItemTemplate>  
                     <asp:TextBox ID="txt_EDate" runat="server" Text='<%#Eval("EndDate","{0:yyyy/MM/dd}") %>'></asp:TextBox>  
                </EditItemTemplate> 
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="Estimated Hours">
                <ItemTemplate>  
                    <asp:Label ID="lbl_EHours" runat="server" Text='<%#Eval("EstimatedHours") %>'></asp:Label>  
                </ItemTemplate> 
                <EditItemTemplate>  
                    <asp:TextBox ID="txt_EHours" runat="server" Text='<%#Eval("EstimatedHours") %>'></asp:TextBox>  
                </EditItemTemplate>  
             </asp:TemplateField>  
             <asp:TemplateField HeaderText="Logged Hours">
                 <ItemTemplate>
                     <asp:Label ID="lbl_LHours" runat="server" Text='<%#Eval("LoggedHours") %>'></asp:Label>  
                 </ItemTemplate>  
             </asp:TemplateField>  
        </Columns>  
        </asp:GridView>
          
    </div>
    
</asp:Content>


