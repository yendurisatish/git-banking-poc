<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AviewUsers.aspx.cs" Inherits="BankingApp.AviewUsers" %>

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
                <h2>
                    Users Details</h2>
                <asp:GridView ID="AviewUsersGrid" runat="server"  AutoGenerateColumns="false" Height="154px">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" ItemStyle-Width="150" />
                        <asp:BoundField DataField="AccountNumber" HeaderText="Account number" ItemStyle-Width="150" />
                        <asp:BoundField DataField="FirstName" HeaderText="First name" ItemStyle-Width="150" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" ItemStyle-Width="150" />
                        <asp:BoundField DataField="Dob" HeaderText="Date of Birth" ItemStyle-Width="150" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone number" ItemStyle-Width="150" />
                        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="150" />
                        <asp:BoundField DataField="Aadhar" HeaderText="Aadhar number" ItemStyle-Width="150" />
                         <asp:BoundField DataField="AccountType" HeaderText="Account Type" ItemStyle-Width="150" />
                         <asp:BoundField DataField="Balance" HeaderText="Balance" ItemStyle-Width="150" />
                         <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="150" />


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
