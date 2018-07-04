<%@ Page Title="" Language="C#" MasterPageFile="~/ContentManager.Master" AutoEventWireup="true" CodeBehind="AdverManager.aspx.cs" Inherits="NZWorldMarket.WebForm3" %>
<asp:Content ID="cManagerAdver" ContentPlaceHolderID="MainContent" runat="server">

    <div class="meContainer" >
        <h1>Advertisement Manager</h1>
    </div>

    <asp:HiddenField ID="hdfAdverId" runat="server" />

    <ul class="nav nav-tabs">
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#infoCard">Info Card</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " data-toggle="tab" href="#detail">Detail</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " data-toggle="tab" href="#album">Album</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " data-toggle="tab" href="#schedule">Schedule</a>
      </li>
    </ul>

    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade" id="infoCard" style="padding:10px" >
          <asp:DetailsView ID="dvInfoCardAdv" runat="server" Height="50px" Width="355px" DefaultMode="Edit" 
              AutoGenerateRows="False" DataKeyNames="Id,UserId" DataSourceID="dsDvInfoCardAdv" >
              <Fields>
                  <asp:BoundField DataField="Id" HeaderText="Id" Visible="false" InsertVisible="False" ReadOnly="True" />
                  <asp:BoundField DataField="UserId" HeaderText="UserId" Visible="false" ReadOnly="True" />
                  <asp:TemplateField HeaderText="Region" HeaderStyle-CssClass="input-group-text" >
                      <EditItemTemplate>
                        <asp:DropDownList ID="DdlRegionId" runat="server" Width="100%" CssClass="custom-select-sm" DataSourceID="dsDdlRegion" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("RegionId") %>' ></asp:DropDownList>
                        <asp:SqlDataSource ID="dsDdlRegion" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Code], [Name] FROM [Region] WHERE ([Active] = @Active) ORDER BY [OrderCode]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                      </EditItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Type" HeaderStyle-CssClass="input-group-text" >
                      <EditItemTemplate>
                        <asp:DropDownList ID="DdlAdvertTypeId" runat="server" Width="100%" CssClass="custom-select-sm" DataSourceID="dsDdlTypeAdv" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("AdvertTypeId") %>' ></asp:DropDownList>
                        <asp:SqlDataSource ID="dsDdlTypeAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [AdvertType] WHERE ([Active] = @Active) ORDER BY [OrderCode]">
                            <SelectParameters>
                                 <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                      </EditItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="Title" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Title" SortExpression="Title" />
                  <asp:BoundField DataField="Overview" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Overview" SortExpression="Overview" />
                  <asp:BoundField DataField="URL" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="URL" SortExpression="URL" />
                  <asp:BoundField DataField="StyleSheet" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="StyleSheet" SortExpression="StyleSheet" Visible="false" />
                  <asp:BoundField DataField="PostDeadLine" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="PostDeadLine" SortExpression="PostDeadLine" />
                  <asp:BoundField DataField="SearchTags" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="SearchTags" SortExpression="SearchTags" />
                  <asp:BoundField DataField="PhotoId" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="PhotoId" SortExpression="PhotoId" Visible="false" />
                  <asp:CheckBoxField DataField="Active" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Active" SortExpression="Active" />
                  <asp:BoundField DataField="Creation" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text"  HeaderText="Creation" SortExpression="Creation" />
                  <asp:BoundField DataField="Modified" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text"  HeaderText="Modified" SortExpression="Modified" />
                  <asp:CommandField ShowEditButton="True" ButtonType="Button"  ControlStyle-CssClass="btn btn-success" />
              </Fields>
          </asp:DetailsView>
          <asp:SqlDataSource ID="dsDvInfoCardAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" DeleteCommand="DELETE FROM [Advertisement] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Advertisement] ([UserId], [RegionId], [AdvertTypeId], [Title], [Overview], [URL], [StyleSheet], [PostDeadLine], [SearchTags], [PhotoId], [Active], [Creation], [Modified]) VALUES (@UserId, @RegionId, @AdvertTypeId, @Title, @Overview, @URL, @StyleSheet, @PostDeadLine, @SearchTags, @PhotoId, @Active, @Creation, @Modified)" SelectCommand="SELECT * FROM [Advertisement] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [Advertisement] SET [UserId] = @UserId, [RegionId] = @RegionId, [AdvertTypeId] = @AdvertTypeId, [Title] = @Title, [Overview] = @Overview, [URL] = @URL, [StyleSheet] = @StyleSheet, [PostDeadLine] = @PostDeadLine, [SearchTags] = @SearchTags, [PhotoId] = @PhotoId, [Active] = @Active, [Creation] = @Creation, [Modified] = @Modified WHERE [Id] = @Id">
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
      </div>
      <div class="tab-pane fade " id="detail" style="padding:10px" >
          <asp:DetailsView ID="dvItemsAdv" runat="server" Height="50px" Width="355px" AllowPaging="True" AutoGenerateRows="False" 
              DataKeyNames="Id" DataSourceID="dsDvItemsAdv" BorderStyle="None" OnDataBound="dvItemsAdv_DataBound">
              <Fields>
                  <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                  <asp:BoundField DataField="AdvertisementId" Visible="false" HeaderText="AdvertisementId" InsertVisible="False" ReadOnly="True" SortExpression="AdvertisementId" />
                  <asp:BoundField DataField="OrderCode" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Priority" SortExpression="OrderCode" />
                  <asp:BoundField DataField="Name" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Name" SortExpression="Name" />
                  <asp:TemplateField HeaderText="Type" HeaderStyle-CssClass="input-group-text" >
                      <InsertItemTemplate>
                        <asp:DropDownList ID="DdlItemType" runat="server" Width="100%" CssClass="custom-select-sm" SelectedValue='<%# Bind("ItemType") %>' >
                            <asp:ListItem Value="NA" >-- Select --</asp:ListItem>
                            <asp:ListItem Value="PR" >Product</asp:ListItem>
                            <asp:ListItem Value="SV" >Service</asp:ListItem>
                        </asp:DropDownList>
                      </InsertItemTemplate>
                      <EditItemTemplate>
                        <asp:DropDownList ID="DdlItemType" runat="server" Width="100%" CssClass="custom-select-sm" SelectedValue='<%# Bind("ItemType") %>' >
                            <asp:ListItem Value="NA" >-- Select --</asp:ListItem>
                            <asp:ListItem Value="PR" >Product</asp:ListItem>
                            <asp:ListItem Value="SV" >Service</asp:ListItem>
                        </asp:DropDownList>
                      </EditItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Category" HeaderStyle-CssClass="input-group-text" >
                      <InsertItemTemplate>
                          <asp:DropDownList ID="DdlAdvertItemCategoryId" runat="server" Width="100%" CssClass="custom-select-sm" DataSourceID="dsDdlAdvertItemCategoryId" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("AdvertItemCategoryId") %>' AppendDataBoundItems="True" >
                              <asp:ListItem Value="-1" >-- Select --</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource ID="dsDdlAdvertItemCategoryId" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [AdvertItemCategory] WHERE ([Active] = @Active) ORDER BY [OrderCode]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                            </SelectParameters>
                          </asp:SqlDataSource>
                      </InsertItemTemplate>
                      <EditItemTemplate>
                          <asp:DropDownList ID="DdlAdvertItemCategoryId" runat="server" Width="100%" CssClass="custom-select-sm" DataSourceID="dsDdlAdvertItemCategoryId" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("AdvertItemCategoryId") %>' ></asp:DropDownList>
                          <asp:SqlDataSource ID="dsDdlAdvertItemCategoryId" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [AdvertItemCategory] WHERE ([Active] = @Active) ORDER BY [OrderCode]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                            </SelectParameters>
                          </asp:SqlDataSource>
                      </EditItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Country" HeaderStyle-CssClass="input-group-text" >
                      <InsertItemTemplate>
                        <asp:DropDownList ID="DdlCountry" runat="server" Width="100%" class="custom-select-sm" DataSourceID="dsDdlCountry" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("CountryId") %>' AppendDataBoundItems="True" >
                            <asp:ListItem Selected="True" Value="-1" >-- Select --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsDdlCountry" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Nationality], [Name] FROM [Country] WHERE ([Active] = @Active) ORDER BY [Nationality], [Name]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                      </InsertItemTemplate>
                      <EditItemTemplate>
                        <asp:DropDownList ID="DdlCountry" runat="server" Width="100%" class="custom-select-sm" DataSourceID="dsDdlCountry" DataTextField="Nationality" DataValueField="Id" SelectedValue='<%# Bind("CountryId") %>' ></asp:DropDownList>
                        <asp:SqlDataSource ID="dsDdlCountry" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Nationality], [Name] FROM [Country] WHERE ([Active] = @Active) ORDER BY [Nationality], [Name]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                      </EditItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Continent" HeaderStyle-CssClass="input-group-text" >
                      <InsertItemTemplate>
                          <asp:DropDownList ID="ddlContinent" runat="server" Width="100%" class="custom-select-sm" DataSourceID="dsDdlContinent" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("ContinentId") %>' AppendDataBoundItems="True" >
                            <asp:ListItem Selected="True" Value="-1" >-- Select --</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource ID="dsDdlContinent" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT Id, Name, OrderCode, Active FROM Continent WHERE (Active = 1) ORDER BY OrderCode"></asp:SqlDataSource>
                      </InsertItemTemplate>
                      <EditItemTemplate>
                          <asp:DropDownList ID="ddlContinent" runat="server" Width="100%" class="custom-select-sm" DataSourceID="dsDdlContinent" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("ContinentId") %>' >
                          </asp:DropDownList>
                          <asp:SqlDataSource ID="dsDdlContinent" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT Id, Name, OrderCode, Active FROM Continent WHERE (Active = 1) ORDER BY OrderCode"></asp:SqlDataSource>
                      </EditItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="Price" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Price" SortExpression="Price" />
                  <asp:BoundField DataField="InitialStock" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="InitialStock" SortExpression="InitialStock" />
                  <asp:BoundField DataField="Stock" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Stock" SortExpression="Stock" />
                  <asp:BoundField DataField="Description" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Description" SortExpression="Description" />
                  <asp:BoundField DataField="SearchTags" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="SearchTags" SortExpression="SearchTags" />
                  <asp:BoundField DataField="PhotoId" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="PhotoId" SortExpression="PhotoId" />
                  <asp:CheckBoxField DataField="Active" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Active" SortExpression="Active" />
                  <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ButtonType="Button"  ControlStyle-CssClass="btn btn-success" />
              </Fields>
              <EmptyDataTemplate>
                   <asp:LinkButton ID="lnkNewItem" runat="server" CssClass="btn btn-outline-info" onclick="lnkNewItem_Click">No records found click here to insert one</asp:LinkButton>
              </EmptyDataTemplate>
          </asp:DetailsView>
          <asp:SqlDataSource ID="dsDvItemsAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" DeleteCommand="DELETE FROM [AdvertItem] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AdvertItem] ([OrderCode], [Name], [AdvertisementId], [ItemType], [AdvertItemCategoryId], [CountryId], [ContinentId], [Price], [InitialStock], [Stock], [Description], [SearchTags], [PhotoId], [Active]) VALUES (@OrderCode, @Name, @AdvertisementId, @ItemType, @AdvertItemCategoryId, @CountryId, @ContinentId, @Price, @InitialStock, @Stock, @Description, @SearchTags, @PhotoId, @Active)" SelectCommand="SELECT * FROM [AdvertItem] WHERE ([AdvertisementId] = @AdvertisementId) ORDER BY [OrderCode]" UpdateCommand="UPDATE [AdvertItem] SET [OrderCode] = @OrderCode, [Name] = @Name, [AdvertisementId] = @AdvertisementId, [ItemType] = @ItemType, [AdvertItemCategoryId] = @AdvertItemCategoryId, [CountryId] = @CountryId, [ContinentId] = @ContinentId, [Price] = @Price, [InitialStock] = @InitialStock, [Stock] = @Stock, [Description] = @Description, [SearchTags] = @SearchTags, [PhotoId] = @PhotoId, [Active] = @Active WHERE [Id] = @Id">
              <DeleteParameters>
                  <asp:Parameter Name="Id" Type="Int64" />
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="OrderCode" Type="String" />
                  <asp:Parameter Name="Name" Type="String" />
                  <asp:ControlParameter ControlID="hdfAdverId" Name="AdvertisementId" PropertyName="Value" Type="Int64" />
                  <asp:Parameter Name="ItemType" Type="String" />
                  <asp:Parameter Name="AdvertItemCategoryId" Type="Byte" />
                  <asp:Parameter Name="CountryId" Type="Byte" />
                  <asp:Parameter Name="ContinentId" Type="String" />
                  <asp:Parameter Name="Price" Type="Decimal" />
                  <asp:Parameter Name="InitialStock" Type="Byte" />
                  <asp:Parameter Name="Stock" Type="Byte" />
                  <asp:Parameter Name="Description" Type="String" />
                  <asp:Parameter Name="SearchTags" Type="String" />
                  <asp:Parameter Name="PhotoId" Type="Int64" />
                  <asp:Parameter Name="Active" Type="Boolean" />
              </InsertParameters>
              <SelectParameters>
                  <asp:ControlParameter ControlID="hdfAdverId" Name="AdvertisementId" PropertyName="Value" Type="Int64" />
              </SelectParameters>
              <UpdateParameters>
                  <asp:Parameter Name="OrderCode" Type="String" />
                  <asp:Parameter Name="Name" Type="String" />
                  <asp:Parameter Name="AdvertisementId" Type="Int64" />
                  <asp:Parameter Name="ItemType" Type="String" />
                  <asp:Parameter Name="AdvertItemCategoryId" Type="Byte" />
                  <asp:Parameter Name="CountryId" Type="Byte" />
                  <asp:Parameter Name="ContinentId" Type="String" />
                  <asp:Parameter Name="Price" Type="Decimal" />
                  <asp:Parameter Name="InitialStock" Type="Byte" />
                  <asp:Parameter Name="Stock" Type="Byte" />
                  <asp:Parameter Name="Description" Type="String" />
                  <asp:Parameter Name="SearchTags" Type="String" />
                  <asp:Parameter Name="PhotoId" Type="Int64" />
                  <asp:Parameter Name="Active" Type="Boolean" />
                  <asp:Parameter Name="Id" Type="Int64" />
              </UpdateParameters>
          </asp:SqlDataSource>
      </div>
      <div class="tab-pane fade active show" id="album" style="padding:10px" >
          <div class="form-group">
            <label class="form-control-label" for="DdlItemsAdv">Item:</label>
            <asp:DropDownList ID="DdlItemsAdv" CssClass="custom-select-sm" runat="server" DataSourceID="dsDdlItemsAdv" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true" >
                <asp:ListItem Value="-1" >-- Select --</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="dsDdlItemsAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [AdvertItem] WHERE ([AdvertisementId] = @AdvertisementId) ORDER BY [OrderCode], [Name]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hdfAdverId" Name="AdvertisementId" PropertyName="Value" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
          </div>

          <fieldset>
              <legend>Add New Photo</legend>

              <div class="form-group">
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="customCheck1" checked="">
                    <label class="custom-control-label" for="customCheck1">Main Photo</label>
                  </div>
              </div>

              <asp:FileUpload ID="fuAlbum" runat="server" />
              <asp:Button ID="btnUploadPhoto" runat="server" Text="Upload" class="input-group-text" OnClick="btnUploadPhoto_Click" />

              <%--<div class="form-group">
                <div class="input-group mb-3">
                  <div class="custom-file">
                    
                    
                    <label class="custom-file-label" for="inFile">Choose file</label>
                  </div>
                  <div class="input-group-append">
                    
                  </div>
                </div>
              </div>--%>


          </fieldset>

          <fieldset>
              <legend>Photos</legend>

              <asp:DataList ID="DlPhotos" runat="server" DataSourceID="dsDlPhotos">
                  <ItemTemplate>
                      Id:
                      <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" /><br />
                      AdvertItemId:
                      <asp:Label Text='<%# Eval("AdvertItemId") %>' runat="server" ID="AdvertItemIdLabel" /><br />
                      PhotoId:
                      <asp:Label Text='<%# Eval("PhotoId") %>' runat="server" ID="PhotoIdLabel" /><br />
                      Location:
                      <asp:Label Text='<%# Eval("Location") %>' runat="server" ID="LocationLabel" /><br />
                      Extension:
                      <asp:Label Text='<%# Eval("Extension") %>' runat="server" ID="ExtensionLabel" /><br />
                      Active:
                      <asp:Label Text='<%# Eval("Active") %>' runat="server" ID="ActiveLabel" /><br />
                      MainPhoto:
                      <asp:Label Text='<%# Eval("MainPhoto") %>' runat="server" ID="MainPhotoLabel" /><br />
                      <br />
                  </ItemTemplate>
              </asp:DataList>

              <asp:SqlDataSource runat="server" ID="dsDlPhotos" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' SelectCommand="SELECT AdvertItemPhoto.Id, AdvertItemPhoto.AdvertItemId, Photo.Id AS PhotoId, Photo.Location, Photo.Extension, Photo.Active, AdvertItem.PhotoId AS MainPhoto FROM AdvertItemPhoto INNER JOIN Photo ON AdvertItemPhoto.PhotoId = Photo.Id INNER JOIN AdvertItem ON AdvertItemPhoto.AdvertItemId = AdvertItem.Id AND Photo.Id = AdvertItem.PhotoId WHERE (AdvertItemPhoto.AdvertItemId = @AdvertItemId)">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="DdlItemsAdv" PropertyName="SelectedValue" Name="AdvertItemId"></asp:ControlParameter>
                  </SelectParameters>
              </asp:SqlDataSource>
          </fieldset>

      </div>
      <div class="tab-pane fade" id="schedule" style="padding:10px" >
        
      </div>
    </div>
    
    <%--<asp:MultiView ID="MultiView1" runat="server">
    </asp:MultiView>--%>

</asp:Content>
