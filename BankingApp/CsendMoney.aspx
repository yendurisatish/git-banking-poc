<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CsendMoney.aspx.cs" Inherits="BankingApp.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>send money</h2>
    <table style="width: 100%;">
        <tr>
            <td>Enter account number to transfer:</td>
            <td> <asp:TextBox ID="AccountNumbertxt" runat="server"></asp:TextBox> </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Enter amount:</td>
            <td> <asp:TextBox ID="Amounttxt" runat="server"></asp:TextBox> </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Transferbtn" runat="server" Text="Transfer" OnClick="Transferbtn_Click" /> </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
