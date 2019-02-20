<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BankingApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
 
    <link href="Content/Login%20styling.css" rel="stylesheet" />
</head>
<body style="background-color:cyan" >
    <form id="form1" runat="server">
      <div class="logincontent">
        <div class="loginheading">
            Welcome to MyBank
        </div>
        <label for="txtUserName">
            Username:</label>
        <asp:TextBox ID="Usernametxt" runat="server"></asp:TextBox>
        <label for="txtPassword">
            Password:</label>
        <asp:TextBox ID="Passwordtxt" runat="server" TextMode="password"></asp:TextBox>
        <div class="loginremember">
            <p style="display: none" id="pLoginText" runat="server">
            </p><br/> 
            <input type="checkbox" id="chbRemember" name="chbRemember" /><label class="check"
                for="chbRemember">Remember me next time</label>
           
            <asp:Button ID="Loginbtn"  class="loginbtn" runat="server" OnClick="Loginbtn_Click" Text="Login" />
        </div>
    </div>
        </form>
 
</body>
</html>
