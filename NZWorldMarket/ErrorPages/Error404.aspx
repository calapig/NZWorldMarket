<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="NZWorldMarket.ErrorPages.Error404" %>

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
                <h1>The website cannot be founded</h1>
            </div>
            <div class="alert alert-danger" role="alert">
                Please check the URL you are trying to access
            </div>
        </div>
    </form>
</body>
</html>
