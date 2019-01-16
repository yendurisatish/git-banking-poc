<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CviewDeposits.aspx.cs" Inherits="BankingApp.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>view my deposits</h2>
     <asp:GridView ID="CviewDepositsGrid" runat="server"  AutoGenerateColumns="false" Height="154px" >
                    <Columns>
                        <asp:BoundField DataField="deposit id" HeaderText="deposit id" ItemStyle-Width="150" />
                        <asp:BoundField DataField="account number" HeaderText="account number" ItemStyle-Width="150" />
                        <asp:BoundField DataField="deposit amount" HeaderText="deposit amount" ItemStyle-Width="150" />
                         <asp:BoundField DataField="duration" HeaderText="duration" ItemStyle-Width="150" />
                        <asp:BoundField DataField="approved time" HeaderText="approved time" ItemStyle-Width="150" />
                        <asp:BoundField DataField="approved" HeaderText="approved" ItemStyle-Width="150" />
                      


                    </Columns>
        </asp:GridView>
</asp:Content>
