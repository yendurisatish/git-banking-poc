<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CapplyDeposits.aspx.cs" Inherits="BankingApp.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>apply for deposits</h2>
    <table style="width: 100%;">
        <tr>
            <td>Enter deposit amount</td>
            <td>
                <asp:TextBox ID="DepositAmounttxt" runat="server"></asp:TextBox></td>
            
        </tr>
        <tr>
            <td>Enter duration(years) :</td>
            <td>
                <asp:TextBox ID="Durationtxt" runat="server"></asp:TextBox>
            </td>
               
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td> <asp:Button ID="applybtn" runat="server" Text="apply" OnClick="applybtn_Click" /></td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
