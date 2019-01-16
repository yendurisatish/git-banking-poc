<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Aupdateaccount.aspx.cs" Inherits="BankingApp.Aupdateaccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 286px;
        }
        .auto-style2 {
            width: 286px;
            height: 31px;
        }
        .auto-style4 {
            height: 31px;
        }
        .auto-style5 {
            width: 286px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            width: 286px;
            height: 22px;
        }
        .auto-style8 {
            height: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="font-family : Arial">

        <tr>
            <td colspan="2" style="width: 800px; height: 80px; background-color: #BDBDBD;text-align:center">
                <h1>
                    My Bank admin</h1>
            </td>



        </tr>
        <tr>
            <td style="height: 500px;background-color:#D8D8D8;width:150px" valign="top">
                <h3>
                    Menu
                </h3>

                <asp:Menu ID="Menu1" runat="server">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/AdminHome.aspx" Text="Home" Value="Home"></asp:MenuItem>
                        <asp:MenuItem Text="Accounts" Value="Accounts">
                            <asp:MenuItem NavigateUrl="~/AviewUsers.aspx" Text="View Users" Value="View Users"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/AcreateAccount.aspx" Text="Create Account" Value="Create Account"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/AcloseAccount.aspx" Text="Close Account" Value="Close Account"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Aupdateaccount.aspx" Text="Update Account" Value="Update Account"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="Loans" Value="Loans">
                            <asp:MenuItem NavigateUrl="~/AviewLoans.aspx" Text="View loans" Value="View loans"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/AapproveLoans.aspx" Text="approve loans" Value="approve loans"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="deposits" Value="deposits">
                            <asp:MenuItem NavigateUrl="~/Aviewdeposits.aspx" Text="View all deposits" Value="View all deposits"></asp:MenuItem>
                         <asp:MenuItem NavigateUrl="~/AapproveDeposits.aspx" Text="approve deposits" Value="approve deposits"></asp:MenuItem>
                             </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Login.aspx" Text="sign out" Value="sign out"></asp:MenuItem>
                    </Items>
                </asp:Menu>

            </td>
            <td style="height:500px;background-color:#E6E6E6;width:650px">
                
<div>
     
        <asp:GridView ID="UpdateAccountGrid" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="UpdateAccountGrid_RowCancelingEdit"   
  
OnRowEditing="UpdateAccountGrid_RowEditing" OnRowUpdating="UpdateAccountGrid_RowUpdating">  
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
              
                <asp:TemplateField HeaderText="Username">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_UName" runat="server" Text='<%#Eval("username") %>'></asp:Label>  
                    </ItemTemplate>  
                   
                </asp:TemplateField>  
                  <asp:TemplateField HeaderText="Account number">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_acc" runat="server" Text='<%#Eval("accountno") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="FirstName">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Fname" runat="server" Text='<%#Eval("firstname") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Fname" runat="server" Text='<%#Eval("firstname") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                
                
                 <asp:TemplateField HeaderText="LastName">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Lname" runat="server" Text='<%#Eval("lastname") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Lname" runat="server" Text='<%#Eval("lastname") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 

                <asp:TemplateField HeaderText="Date of Birth">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_dob" runat="server" Text='<%#Eval("dob") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_dob" runat="server" Text='<%#Eval("dob") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Phone Number">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ph" runat="server" Text='<%#Eval("phoneno") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_ph" runat="server" Text='<%#Eval("phoneno") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("email") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_email" runat="server" Text='<%#Eval("email") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Aadhar Number">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_aadhar" runat="server" Text='<%#Eval("aadhar_no") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_aadhar" runat="server" Text='<%#Eval("aadhar_no") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Account Type">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_accType" runat="server" Text='<%#Eval("account_type") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_accType" runat="server" Text='<%#Eval("account_type") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Balance">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_bal" runat="server" Text='<%#Eval("balance") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_bal" runat="server" Text='<%#Eval("balance") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Address">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_address" runat="server" Text='<%#Eval("address") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_address" runat="server" Text='<%#Eval("address") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                 
            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>  
      
  
          </div>      


            </td>

        </tr>
        <tr>
            <td colspan="2" style="background-color:#BDBDBD;text-align:center">
                <b>website footer</b>
            </td>
        </tr>


    </table>


    </form>
</body>
</html>

