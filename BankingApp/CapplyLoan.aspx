<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CapplyLoan.aspx.cs" Inherits="BankingApp.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>apply for loan</h2>

    <table style="width: 100%;">
        <tr>
            <td>Enter loan amount</td>
            <td>
                <asp:TextBox ID="LoanAmountTxt" runat="server"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td></td>
               
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td> <asp:Button ID="ApplyLoanbtn" runat="server" Text="apply" OnClick="ApplyLoanbtn_Click" /></td>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>
