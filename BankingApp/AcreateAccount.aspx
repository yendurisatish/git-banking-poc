<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcreateAccount.aspx.cs" Inherits="BankingApp.AcreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <%--   <style type="text/css">
        .auto-style2 {
            height: 22px;
            width: 171px;
        }
        </style>--%>
    <link href="Content/CreateAccount.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style4 {
            height: 22px;
            width: 128px;
        }
        .auto-style5 {
            height: 22px;
            width: 277px;
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
                <h2>
                    Create Account</h2><table style="width:100%;">
                        <tr>
                            <td class="auto-style2">Username:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="Usernametxt" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Usernametxt" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">First name:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="Firstnametxt" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Firstnametxt" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Last name:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="Lastnametxt" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Lastnametxt" ForeColor="Red" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Date of birth:(dd/mm/yyyy)</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="Dobtxt"  runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Dobtxt" ForeColor="Red" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">phone number:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="Phonetxt" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="Phonetxt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">email:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="Emailtxt" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ControlToValidate="Emailtxt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">password:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="Passwordtxt" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" ControlToValidate="Passwordtxt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">confirm password:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="CPasswordtxt" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required" ControlToValidate="CPasswordtxt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">aadhar number:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="Aadhartxt" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required" ControlToValidate="Aadhartxt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">account type:</td>
                            <td class="auto-style4">
                                <asp:DropDownList ID="AccountTypeList" runat="server">
                                    <asp:ListItem>savings</asp:ListItem>
                                    <asp:ListItem>current</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Required" ControlToValidate="AccountTypeList" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">balance:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="Balancetxt" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Required" ControlToValidate="Balancetxt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">address:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="Addresstxt" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Required" ControlToValidate="Addresstxt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Is Admin(yes/no : 1/0):</td>
                            <td class="auto-style4">
                                <asp:DropDownList ID="IsAdminDropDown" runat="server">
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Required" ControlToValidate="IsAdminDropDown" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style4">
                                &nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style4">
                                <asp:Button ID="Submitbtn" runat="server" Height="35px" OnClick="Submit_Click" Text="Submit" Width="77px" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                
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

