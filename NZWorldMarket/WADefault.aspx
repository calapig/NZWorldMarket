<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/WebApp.Master" AutoEventWireup="true" CodeBehind="WADefault.aspx.cs" Inherits="NZWorldMarket.WADefault" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        
          <asp:Repeater ID="rpCarousel" runat="server" DataSourceID="dsFvCarousel">
              <ItemTemplate>
                  <div class="carousel-item">
                      <asp:Image ID="imgAdver" runat="server" style="max-width: 800px; height: auto" ImageUrl='<%# Eval("PhotoId", "CommonResources/ShowImage.ashx?photoId={0}") %>' class="d-block w-100" AlternateText="First slide" />
                      <div class="carousel-caption d-none d-md-block">
                        <%--<hr class="my-1">--%>
                        <h5><asp:Label ID="lbTitle" runat="server" CssClass="badge badge-dark" Text='<%# Eval("Title") %>' ></asp:Label></h5>
                        <p><asp:Label ID="lbOverview" runat="server" CssClass="badge badge-secondary" Text='<%# Eval("Overview") %>' ></asp:Label></p>
                      </div>
                  </div>
              </ItemTemplate>
          </asp:Repeater>
         
          <asp:SqlDataSource runat="server" ID="dsFvCarousel" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' SelectCommand="SELECT TOP (3) Id, Title, Overview, AdvertTypeId, PhotoId, Modified FROM Advertisement ORDER BY Modified DESC"></asp:SqlDataSource>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
<script>
    $(".carousel-inner div:first-child").toggleClass("active");
</script>
</asp:Content>
