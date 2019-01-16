<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AviewLoans.aspx.cs" Inherits="BankingApp.AviewLoans" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                <table style="width: 645px">
                    <tr>
                        <td>
                <asp:Label ID="FromDtLabel" runat="server" Text="From Date : "></asp:Label>
                 <asp:TextBox ID="FromDt" type="date" runat="server"></asp:TextBox>
                            </td>
                        <td>
                <asp:Label ID="ToDtLabel" runat="server" Text="To Date : "></asp:Label>
                 <asp:TextBox ID="ToDt" type="date" runat="server"></asp:TextBox>
                            </td>
                        <td>
                            <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" />
                        </td>
                        <td>
                            <asp:Button ID="ResetBtn" runat="server" Text="Reset" OnClick="ResetBtn_Click"  />
                        </td>
               </tr>
                         </table>
                
                <h2>
                    loans</h2>
                  <asp:GridView ID="AviewLoansGrid" runat="server" AutoGenerateColumns="False" Height="154px"   >
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="loan id" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                             <asp:BoundField DataField="username" HeaderText="Username" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="LoanType" HeaderText="Loan Type" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Income" HeaderText="Income" ItemStyle-Width="150" >

<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="account_no" HeaderText="Account Number" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="loan_amount" HeaderText="Loan Amount" ItemStyle-Width="150" >

<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                             <asp:BoundField DataField="approved_time" HeaderText="Approved Time" ItemStyle-Width="150" >

<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                           
                            <asp:TemplateField>
                                 <HeaderTemplate>
               Payslip
         </HeaderTemplate>
                                <ItemTemplate>

                                     <asp:LinkButton  ID="PayslipDownload" Text="Download" CommandArgument='<%#Eval("Payslip")%>' runat="server" onclick = "lnkDownload_Click" ></asp:LinkButton>
      
         <asp:LinkButton ID="PayslipOpen" Text="View" CommandArgument='<%#Eval("Payslip")%>' Font-Bold="true" runat="server" onclick = "btnOpen_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                 <HeaderTemplate>
               Photograph
         </HeaderTemplate>
                                <ItemTemplate>

                                     <asp:LinkButton  ID="PhotoDownload" Text="Download" CommandArgument='<%#Eval("Photo")%>' runat="server" onclick = "lnkDownload_Click" ></asp:LinkButton>
       
         <asp:LinkButton ID="PhotoOpen" Text="View" CommandArgument='<%#Eval("Photo")%>' Font-Bold="true" runat="server" onclick = "btnOpen_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                 <HeaderTemplate>
               Signature
         </HeaderTemplate>
                                <ItemTemplate>

                                     <asp:LinkButton  ID="SignatureDownload" Text="Download" CommandArgument='<%#Eval("Signature")%>' runat="server" onclick = "lnkDownload_Click" ></asp:LinkButton>
        
         <asp:LinkButton ID="SignatureOpen" Text="View" CommandArgument='<%#Eval("Signature")%>' Font-Bold="true" runat="server" onclick = "btnOpen_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:BoundField DataField="approved" HeaderText="Approval Status" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <%-- <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="ApproveLoan" Text="Approve" runat="server" CommandName="approve" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" />                                    
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>
                    </asp:GridView>
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

