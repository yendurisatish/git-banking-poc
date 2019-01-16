<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CtransHis.aspx.cs" Inherits="BankingApp.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Transaction history</h2>
    <asp:GridView ID="CTransHistoryGrid" runat="server"  AutoGenerateColumns="false" Height="154px" >
                    <Columns>
                        <asp:BoundField DataField="trans id" HeaderText="trans id" ItemStyle-Width="150" />
                        <asp:BoundField DataField="account number" HeaderText="account number" ItemStyle-Width="150" />
                        <asp:BoundField DataField="amount" HeaderText="amount" ItemStyle-Width="150" />
                        <asp:BoundField DataField="other account" HeaderText="other account" ItemStyle-Width="150" />
                        <asp:BoundField DataField="time" HeaderText="time" ItemStyle-Width="150" />
                      


                    </Columns>
        </asp:GridView>
</asp:Content>
