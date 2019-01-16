<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="BankingApp.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 250px;
        }
        .auto-style2 {
            width: 250px;
            height: 26px;
        }
        .auto-style3 {
            height: 26px;
        }
        .auto-style4 {
            width: 509px;
        }
        .auto-style5 {
            height: 26px;
            width: 509px;
        }
        .auto-style6 {
            width: 250px;
            height: 28px;
        }
        .auto-style7 {
            width: 509px;
            height: 28px;
        }
        .auto-style8 {
            height: 28px;
        }
        .auto-style9 {
            width: 250px;
            height: 25px;
        }
        .auto-style10 {
            width: 509px;
            height: 25px;
        }
        .auto-style11 {
            height: 25px;
        }
    </style>
</head>
    
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Registration Form<br />
        <table style="width: 100%; height: 265px; margin-top: 0px; margin-bottom: 5px;">
            <tr>
                <td class="auto-style1">Name :</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter name" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="invalid name" ForeColor="Red" ValidationExpression="^[a-zA-Z][a-zA-Z\\s]+$"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">Password :</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BorderColor="Red" ErrorMessage="please enter password" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style1">Confirm Password :</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="Password mismatch" ForeColor="Red"></asp:CompareValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Age :</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="age should be between 18-70" ForeColor="Red" MaximumValue="70" MinimumValue="18"></asp:RangeValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">Address:</td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="Address required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style11"></td>
            </tr>
            <tr>
                <td class="auto-style1">Email :</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage="Enter email" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Date of Birth : (dd/mm/yyyy)</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox7" ErrorMessage="invalid date " ForeColor="Red" ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>

                    
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Sex:</td>
                <td class="auto-style4">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Please select gender" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">City :</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Hyderabad</asp:ListItem>
                        <asp:ListItem>chennai</asp:ListItem>
                        <asp:ListItem>bangalore</asp:ListItem>
                        <asp:ListItem>delhi</asp:ListItem>
                        <asp:ListItem>Mumbai</asp:ListItem>
                        
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Select city" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style3"></td>
            </tr>
        </table>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
