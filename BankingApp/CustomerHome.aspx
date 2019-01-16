<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerHome.aspx.cs" Inherits="BankingApp.CustomerHome" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">
    <h2>Welcome&nbsp; <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </h2>
     <asp:GridView ID="CustomerHomeGrid" runat="server" AutoGenerateColumns="False" Height="154px"   >
                        <Columns>
                            <asp:BoundField DataField="username" HeaderText="user name" ItemStyle-Width="150" />
                            <asp:BoundField DataField="accountno" HeaderText="Account number" ItemStyle-Width="150" />
                            <asp:BoundField DataField="account_type" HeaderText="account type" ItemStyle-Width="150" />
                              <asp:BoundField DataField="balance" HeaderText="balance" ItemStyle-Width="150" />

                           
                            
                        </Columns>
                    </asp:GridView>
</asp:Content>

