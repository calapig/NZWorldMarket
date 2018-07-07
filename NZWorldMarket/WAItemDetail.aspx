<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp.Master" AutoEventWireup="true" CodeBehind="WAItemDetail.aspx.cs" Inherits="NZWorldMarket.WAItemDetail" %>
<asp:Content ID="cDetailItem" ContentPlaceHolderID="MainContent" runat="server">

    <div class="meContainer" >
        <div class="card">
          <div class="card-header">
            <h5><asp:Label ID="lblRegion" runat="server" ><asp:Label ID="lblAdvertType" runat="server" ></asp:Label></asp:Label></h5>
          </div>
          <div class="card-body">
            <h1 class="card-title"><asp:Label ID="lblTitle" runat="server" ></asp:Label></h1>

             <div class="row row justify-content-start">
                <div class="col-4">
                    <blockquote class="blockquote mb-0">
                      <p><asp:Label ID="lblDescription" runat="server" ></asp:Label></p>
                      <%--<footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>--%>
                    </blockquote>
                </div>
                <div class="col-4">
                    <div class="photoItemContainer" >
                      <asp:Image ID="advImage" runat="server" CssClass="rounded mx-auto d-block" Style="max-width: 100%; height: auto;" />
                    </div>
                </div>
              </div>
          </div>
        </div>
    </div>

    <asp:HiddenField ID="hdfDeadLine" runat="server" />
    <asp:SqlDataSource ID="dsDvAdvertisement" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>"
    DeleteCommand="DELETE FROM [Advertisement] WHERE [Id] = @Id"
    InsertCommand="INSERT INTO [Advertisement] ([UserId], [RegionId], [AdvertTypeId], [Title], [Overview], [URL], [StyleSheet], [PostDeadLine], [SearchTags], [PhotoId], [Active], [Creation], [Modified]) VALUES (@UserId, @RegionId, @AdvertTypeId, @Title, @Overview, @URL, @StyleSheet, @PostDeadLine, @SearchTags, @PhotoId, @Active, @Creation, @Modified)"
    SelectCommand="SELECT Advertisement.Id, Advertisement.UserId, Advertisement.RegionId, Advertisement.AdvertTypeId, Advertisement.Title, Advertisement.Overview, Advertisement.URL, Advertisement.StyleSheet, Advertisement.PostDeadLine, Advertisement.SearchTags, Advertisement.PhotoId, Advertisement.Active, Advertisement.Creation, Advertisement.Modified, Region.Code, Region.Name RegionName, AdvertType.Name AS AdverTypeName FROM Advertisement INNER JOIN Region ON Advertisement.RegionId = Region.Id INNER JOIN AdvertType ON Advertisement.AdvertTypeId = AdvertType.Id WHERE (Advertisement.Id = @Id)"
    UpdateCommand="UPDATE [Advertisement] SET [UserId] = @UserId, [RegionId] = @RegionId, [AdvertTypeId] = @AdvertTypeId, [Title] = @Title, [Overview] = @Overview, [URL] = @URL, [StyleSheet] = @StyleSheet, [PostDeadLine] = @PostDeadLine, [SearchTags] = @SearchTags, [PhotoId] = @PhotoId, [Active] = @Active, [Creation] = @Creation, [Modified] = @Modified WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserId" Type="Int64" />
            <asp:Parameter Name="RegionId" Type="Byte" />
            <asp:Parameter Name="AdvertTypeId" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Overview" Type="String" />
            <asp:Parameter Name="URL" Type="String" />
            <asp:Parameter Name="StyleSheet" Type="String" />
            <asp:Parameter DbType="Date" Name="PostDeadLine" />
            <asp:Parameter Name="SearchTags" Type="String" />
            <asp:Parameter Name="PhotoId" Type="Int64" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="Creation" />
            <asp:Parameter DbType="Date" Name="Modified" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hdfAdverId" Name="Id" PropertyName="Value" Type="Int64" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserId" Type="Int64" />
            <asp:Parameter Name="RegionId" Type="Byte" />
            <asp:Parameter Name="AdvertTypeId" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Overview" Type="String" />
            <asp:Parameter Name="URL" Type="String" />
            <asp:Parameter Name="StyleSheet" Type="String" />
            <asp:Parameter DbType="Date" Name="PostDeadLine" />
            <asp:Parameter Name="SearchTags" Type="String" />
            <asp:Parameter Name="PhotoId" Type="Int64" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="Creation" />
            <asp:Parameter DbType="Date" Name="Modified" />
            <asp:Parameter Name="Id" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:HiddenField ID="hdfAdverId" runat="server" />

    <ul class="nav nav-tabs">
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#detail">Details</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " data-toggle="tab" href="#photos">Photos</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " data-toggle="tab" href="#schedule">Schedule</a>
      </li>
    </ul>

    <div id="myTabContent" class="tab-content">

        <div class="tab-pane fade" id="detail" style="padding:10px" >

            <asp:Repeater ID="rpItemsAdvert" runat="server" DataSourceID="dsRpItemsAdvert">
                <HeaderTemplate>
                    <div class="table-responsive">
                        <table class="table" >
                </HeaderTemplate>
                <ItemTemplate>
                            <tr class="bg-Primary" >
                                <td >
                                    <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUnitsBuy" runat="server" Width="70px" Text="1"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnOrderNow" runat="server" CssClass="btn btn-success" Text="order Now!" CommandName="Order" CommandArgument='<%# Eval("Id") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="1">
                                    <asp:Label ID="lblItemDesc" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                </td>                                
                            </tr>
                </ItemTemplate>
                <FooterTemplate>
                        </table>
                    </div>
                </FooterTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="dsRpItemsAdvert" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' 
                SelectCommand="SELECT AdvertItem.Id, AdvertItem.Name, ItemType.Name AS ItemTypeName, AdvertItemCategory.Name AS AdvertItemCategoryName, 
                Country.Name AS CountryName, Country.Nationality, Continent.Name AS ContinentName, AdvertItem.Price, AdvertItem.Stock, AdvertItem.Description, 
                AdvertItem.PhotoId, AdvertItem.OrderCode 
                FROM AdvertItem INNER JOIN Country ON AdvertItem.CountryId = Country.Id 
                INNER JOIN Continent ON Country.ContinentId = Continent.Id INNER JOIN ItemType ON AdvertItem.ItemType = ItemType.Id 
                INNER JOIN AdvertItemCategory ON AdvertItem.AdvertItemCategoryId = AdvertItemCategory.Id 
                WHERE (AdvertItem.AdvertisementId = @AdvertisementId) ORDER BY AdvertItem.OrderCode, AdvertItem.Name">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hdfAdverId" PropertyName="Value" Name="AdvertisementId"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        
        <div class="tab-pane fade" id="photos" style="padding:10px" >

        </div>

        <div class="tab-pane fade" id="schedule" style="padding:10px" >
        
        </div>

    </div>

</asp:Content>
