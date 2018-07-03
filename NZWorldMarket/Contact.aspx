<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="NZWorldMarket.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="meContainer" >

        <h2><%: Title %>.</h2>
        <%--<h3>Your contact page.</h3>--%>
        <address>
            Auckland, New Zealand<br />
            <abbr title="Phone">P:</abbr>
            +64 210 885 1474
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:Support@example.com">joca006@ess.ais.ac.nz</a><br />
        </address>

    </div>

</asp:Content>
