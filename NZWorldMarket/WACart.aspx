<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp.Master" AutoEventWireup="true" CodeBehind="WACart.aspx.cs" Inherits="NZWorldMarket.WACart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="col-sm-12"><h1>Your shopping cart</h1></div> 
       
    <div class="form-group"> 
        <asp:ListBox ID="lstCart" runat="server" CssClass="form-control" style="max-width: 800px; height: auto" ></asp:ListBox>
        <asp:Button ID="btnRemove" runat="server" CssClass="btn btn-warning" Text="Remove Item" OnClick="btnRemove_Click" />     
        <asp:Button ID="btnEmpty" runat="server" CssClass="btn btn-danger" Text="Empty Cart" OnClick="btnEmpty_Click" />
    </div>
    
    <hr class="my-4">
    

        <div class="col-sm-12">
            <%--<div class="form-group">
                
            </div>--%><asp:Label ID="lblMessage" runat="server" EnableViewState="False" CssClass="text-info col-sm-12"></asp:Label> 
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnContinue" CssClass="btn btn-info"  runat="server" PostBackUrl="~/WAIndex.aspx" Text="Continue Shopping" />
                    <%--<asp:Button ID="btnCheckOut" CssClass="btn btn-info"  runat="server" Text="Check Out" OnClick="btnCheckOut_Click" CssClass="btn" />--%>
                </div> 
            </div> 
        </div>


</asp:Content>
