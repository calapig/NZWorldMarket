<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp.Master" AutoEventWireup="true" CodeBehind="WACart.aspx.cs" Inherits="NZWorldMarket.WACart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row"><%--row 1 --%>
        <div class="col-sm-12"><h1>Your shopping cart</h1></div> 
            <div class="col-sm-6"><%--cart display column --%> 
                <div class="form-group"> 
                    <div class="col-sm-12">
                        <asp:ListBox ID="lstCart" runat="server" CssClass="form-control" ></asp:ListBox>
<%--                        <asp:Repeater ID="rpCart" runat="server" OnItemCommand="rpCart_ItemCommand">
                        <HeaderTemplate>
                            <div class="table-responsive">
                                <table class="table" >
                        </HeaderTemplate>
                        <ItemTemplate>
                                    <tr class="bg-Primary" >
                                        <td >
                                            <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("advertItemID") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtUnitsBuy" runat="server" Width="70px" Text='<%# Eval("quantity") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                </table>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>--%>
                    </div>
                </div>
            </div>
        <div class="col-sm-6"><%--cart edit buttons column --%> 
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnRemove" runat="server" Text="Remove Item" OnClick="btnRemove_Click" CssClass="btn" />
                </div> 
                <div class="col-sm-12">
                    <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" OnClick="btnEmpty_Click" CssClass="btn" />
                </div>
            </div>
        </div>
    </div><%--end of row 1 --%> 
    <div class="row"><%--row 2 --%> 
        <div class="col-sm-12">
            <div class="form-group"><%--message label --%> 
                <asp:Label ID="lblMessage" runat="server" EnableViewState="False" CssClass="text-info col-sm-12"></asp:Label> 
            </div>
            <div class="form-group"><%--buttons --%> 
                <div class="col-sm-12">
                    <asp:Button ID="btnContinue" runat="server" PostBackUrl="~/WAIndex.aspx" Text="Continue Shopping" CssClass="btn" />
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" CssClass="btn" />
                </div> 
            </div> 
        </div>
    </div><%--end of row 2 --%> 

</asp:Content>
