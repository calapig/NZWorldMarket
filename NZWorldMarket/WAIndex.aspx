<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/WebApp.Master" AutoEventWireup="true" CodeBehind="WAIndex.aspx.cs" Inherits="NZWorldMarket.WAIndex" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    <asp:HiddenField ID="HdfRegionId" runat="server" Value="-1" />
    <asp:HiddenField ID="HdfContinentId" runat="server" Value="-1" />
    <asp:HiddenField ID="HdfKeySearch" runat="server" Value="" />
    
    <div class="alert alert-dark" >
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" >
        
          <asp:Repeater ID="rpCarousel" runat="server" DataSourceID="dsFvCarousel">
              <ItemTemplate>
                  <div class="carousel-item">
                      <asp:Image ID="imgAdver" runat="server" ImageUrl='<%# Eval("PhotoId", "CommonResources/ShowImage.ashx?photoId={0}") %>' class="d-block w-100" AlternateText="First slide" />
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
    </div>

    <div class="card-deck" style="padding-top: 15px">

    <asp:DataList ID="dlAdvertisements" runat="server" DataKeyField="Id" DataSourceID="dsDlAdvertisements" RepeatColumns="3" OnItemDataBound="dlAdvertisements_ItemDataBound" OnItemCommand="dlAdvertisements_ItemCommand">
        <ItemTemplate>
            <div class="card border-primary text-white bg-dark mb-3">
                <div class="card-header bg-primary"><b><%# Eval("RegionName") %></b></div>
                <asp:Image ID="advImage" runat="server" CssClass="rounded mx-auto d-block" ImageUrl='<%# Eval("PhotoId", "CommonResources/ShowImage.ashx?photoId={0}") %>' />
                <div class="card-body">
                    <h5 class="card-title"><b><%# Eval("Title") %></b></h5>
                    <p class="card-text">'<%# Eval("Overview") %>'</p>
                    <asp:Button ID="btnDetail" runat="server" CssClass="btn btn-info" Text="go to Detail" CommandName="Detail" CommandArgument='<%# Eval("Id") %>' />
                    <asp:Button ID="btnOrderNow" runat="server" CssClass="btn btn-success" Text="order Now!" CommandName="Order" CommandArgument='<%# Eval("Id") %>' />
                </div>
                <div class="card-footer">
                    <small class="text-muted">Last updated <%# Eval("Modified") %></small>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

    </div>
    <asp:SqlDataSource runat="server" ID="dsDlAdvertisements" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>'
          SelectCommand="SELECT Advertisement.Id, Advertisement.UserId, Advertisement.RegionId, Advertisement.AdvertTypeId, 
        Advertisement.Title, Advertisement.Overview, Advertisement.URL, Advertisement.StyleSheet, Advertisement.PostDeadLine, 
        Advertisement.SearchTags, Advertisement.PhotoId, Advertisement.Active, Advertisement.Creation, Advertisement.Modified, 
        Region.Name AS RegionName FROM Advertisement INNER JOIN Region ON Advertisement.RegionId = Region.Id 
        WHERE Advertisement.RegionId = (CASE WHEN @RegionId = -1 THEN Advertisement.RegionId ELSE @RegionId END)
        ORDER BY Advertisement.Modified DESC, Advertisement.PostDeadLine">
        <SelectParameters>
            <asp:ControlParameter ControlID="HdfRegionId" PropertyName="Value" Name="RegionId"></asp:ControlParameter>
            
        </SelectParameters>
    </asp:SqlDataSource>
    <script>
        $(".carousel-inner div:first-child").toggleClass("active");
    </script>

</asp:Content>
