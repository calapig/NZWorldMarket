<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="NZWorldMarket.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to NZ World Market</title>
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous" />--%>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <style>
        body  {
            background-image: url("Images/bck_Market.jpg");
            background-color: #cccccc;
        }

        .vertical-center {
          min-height: 50%;  
          min-height: 50vh; 

          display: flex;
          align-items: center;
        }

        .vertical-centerButton {
          min-height: 20%;  
          min-height: 20vh; 

          display: flex;
          align-items: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" >

       <%-- <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
            </Scripts>
        </asp:ScriptManager>--%>

        <div class="container-fluid">
            <div class="row justify-content-around">
                <div class="text-center vertical-center">
                  <asp:Image ID="mainLogo" runat="server" ImageUrl="~/Images/Logo/Logo2.JPG" />
                </div>
            </div>
            <div class="row justify-content-around">
                <div class="vertical-centerButton">
                    <asp:LinkButton ID="btnWebApp" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Go to Customer Web Application" PostBackUrl="~/WAIndex.aspx" />
                </div>
                <div class="vertical-centerButton ">
                    <asp:LinkButton ID="btnContentMg" runat="server" CssClass="btn btn-warning btn-lg btn-block" Text="Go to Content Manager System" PostBackUrl="~/CMIndex.aspx" />
                </div>
            </div>

        </div>
    </form>
</body>
</html>
