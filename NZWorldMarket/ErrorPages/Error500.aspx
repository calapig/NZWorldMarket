﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error500.aspx.cs" Inherits="NZWorldMarket.ErrorPages.Error500" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body class="table-active" >
    <form id="form1" runat="server">
        <div>
            <div class="alert alert-dismissible alert-warning">
                <h1>The website has suffered an unexpected error</h1>
            </div>
            <div class="alert alert-danger" role="alert">
                Please contact the administrator of the website
            </div>
        </div>
    </form>
</body>
</html>
