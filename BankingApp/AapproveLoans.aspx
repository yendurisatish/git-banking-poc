<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AapproveLoans.aspx.cs" Inherits="BankingApp.AapproveLoans" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <table style="font-family: Arial">

            <tr>
                <td colspan="2" style="width: 800px; height: 80px; background-color: #BDBDBD; text-align: center">
                    <h1>My Bank admin</h1>
                </td>



            </tr>
            <tr>
                <td style="height: 500px; background-color: #D8D8D8; width: 150px" valign="top">
                    <h3>Menu
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
                <td style="height: 500px; background-color: #E6E6E6; width: 650px">
                    <h2>Approve loans</h2>
                    <asp:GridView ID="AapproveLoansGrid" runat="server" AutoGenerateColumns="False" Height="154px" OnRowCommand="AapproveLoansGrid_RowCommand"  >
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

                           
                            <asp:TemplateField>
                                 <HeaderTemplate>
               Payslip
         </HeaderTemplate>
                                <ItemTemplate>

                                     <asp:LinkButton  ID="PayslipDownload" Text="Download" CommandArgument='<%#Eval("Payslip")%>' runat="server" onclick = "lnkDownload_Click" ></asp:LinkButton>
        &nbsp;&nbsp;
         <asp:LinkButton ID="PayslipOpen" Text="View" CommandArgument='<%#Eval("Payslip")%>' Font-Bold="true" runat="server" onclick = "btnOpen_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                 <HeaderTemplate>
               Photograph
         </HeaderTemplate>
                                <ItemTemplate>

                                     <asp:LinkButton  ID="PhotoDownload" Text="Download" CommandArgument='<%#Eval("Photo")%>' runat="server" onclick = "lnkDownload_Click" ></asp:LinkButton>
      <br />
         <asp:LinkButton ID="PhotoOpen" Text="View" CommandArgument='<%#Eval("Photo")%>' Font-Bold="true" runat="server" onclick = "btnOpen_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                 <HeaderTemplate>
               Signature
         </HeaderTemplate>
                                <ItemTemplate>

                                     <asp:LinkButton  ID="SignatureDownload" Text="Download" CommandArgument='<%#Eval("Signature")%>' runat="server" onclick = "lnkDownload_Click" ></asp:LinkButton>
        &nbsp;&nbsp;
         <asp:LinkButton ID="SignatureOpen" Text="View" CommandArgument='<%#Eval("Signature")%>' Font-Bold="true" runat="server" onclick = "btnOpen_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="ApproveLoan" Text="Approve" CssClass="btn btn-info" runat="server" CommandName="approve" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" />                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                        <h4 class="modal-title">
                            Loan Approvals</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Loan Id : "></asp:Label>
                                <asp:Label ID="lblLoanId" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="LabelAccountNo" runat="server" Text="Account Number : "></asp:Label>
                                <asp:Label ID="lblAccountNo" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblUname" runat="server" Text="Username : "></asp:Label>
                                <asp:Label ID="lblusername" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Loan Amount : "></asp:Label>
                                <asp:Label ID="lblamount" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblincome1" runat="server" Text="Income : "></asp:Label>
                                <asp:Label ID="lblincome" runat="server" Text="Income"></asp:Label>
                                
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnApprove" runat="server" Text="approve" OnClick="approve_click" CssClass="btn btn-info" />
                        <button type="button" class="btn btn-info" data-dismiss="modal">
                            Close</button>
                    </div>
                </div>
            </div>
            <script type='text/javascript'>
                function openModal() {
                    $('[id*=myModal]').modal('show');
                }
            </script>
        </div>
    </div>
                </td>

            </tr>
            <tr>
                <td colspan="2" style="background-color: #BDBDBD; text-align: center">
                    <b>website footer</b>
                </td>
            </tr>


        </table>


    </form>
</body>
</html>

