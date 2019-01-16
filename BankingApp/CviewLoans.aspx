<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CviewLoans.aspx.cs" Inherits="BankingApp.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>View loan details</h2>
    <asp:GridView ID="CViewLoansGrid" runat="server"  AutoGenerateColumns="false" Height="154px" >
                    <Columns>
                        <asp:BoundField DataField="loan id" HeaderText="loan id" ItemStyle-Width="150" />
                        <asp:BoundField DataField="account number" HeaderText="account number" ItemStyle-Width="150" />
                        <asp:BoundField DataField="loan amount" HeaderText="loan amount" ItemStyle-Width="150" />
                        <asp:BoundField DataField="approved time" HeaderText="approved time" ItemStyle-Width="150" />
                        <asp:BoundField DataField="approved" HeaderText="approved" ItemStyle-Width="150" />
                      


                    </Columns>
        </asp:GridView>
</asp:Content>
