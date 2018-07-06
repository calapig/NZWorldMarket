<%@ Page Title="" Language="C#" MasterPageFile="~/ContentManager.Master" AutoEventWireup="true" CodeBehind="CMAdverManager.aspx.cs" Inherits="NZWorldMarket.CMAdverManager" %>
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
        <a class="nav-link " data-toggle="tab" href="#detail">Items</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " data-toggle="tab" href="#photos">Photos</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " data-toggle="tab" href="#schedule">Schedule</a>
      </li>
    </ul>

    <div id="myTabContent" class="tab-content">

      <div class="tab-pane fade" id="infoCard" style="padding:10px" >

           <div class="row row justify-content-start">
            <div class="col-4">
              
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
                      <asp:CommandField ShowEditButton="True" ButtonType="Button"  ControlStyle-CssClass="btn btn-primary" />
                  </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="dsDvInfoCardAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" 
                    DeleteCommand="DELETE FROM [Advertisement] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [Advertisement] ([UserId], [RegionId], [AdvertTypeId], [Title], [Overview], [URL], [StyleSheet], [PostDeadLine], [SearchTags], [PhotoId], [Active], [Creation], [Modified]) VALUES (@UserId, @RegionId, @AdvertTypeId, @Title, @Overview, @URL, @StyleSheet, @PostDeadLine, @SearchTags, @PhotoId, @Active, @Creation, @Modified)" 
                    SelectCommand="SELECT * FROM [Advertisement] WHERE ([Id] = @Id)" 
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

            </div>
            <div class="col-4">
                <fieldset>

                    <legend>Main Photo</legend>

                    <div class="form-group">

                        <asp:HiddenField ID="hdfPhotoId" runat="server" />
                      
                        <div class="card mb-3" >
                            <div class="photoItemContainer" >
                                <asp:Image ID="advImage" runat="server" CssClass="rounded mx-auto d-block" Style="max-width: 100%; height: auto;" />
                            </div>
                            <div class="card-body">
                                <%--
                                <asp:LinkButton ID="LnkDelAdvPhoto" runat="server" CssClass="card-link" onclick="lnkDelAdvItemPhoto_Click">Delete</asp:LinkButton>
                                <asp:LinkButton ID="lnkSetAdvMainPhoto" runat="server" CssClass="card-link" onclick="lnkSetMainPhoto_Click">Set Main</asp:LinkButton>
                                --%>
                            </div>
                        </div>

                        <div class="input-group mb-3">
                            <asp:FileUpload ID="fuPhotoAdv" runat="server" />
                            <asp:Button ID="btnUploadPhotoAdv" runat="server" Text="Upload" class="input-group-text" OnClick="btnUploadPhotoAdv_Click" />
                        </div>
                    </div>

                </fieldset>
            </div>
          </div>

          
      </div>

      <div class="tab-pane fade active show" id="detail" style="padding:10px" >
          <asp:DetailsView ID="dvItemsAdv" runat="server" Height="50px" Width="355px" AllowPaging="True" PagerSettings-Mode="Numeric"  
              PagerStyle-Font-Size="XX-Large" PagerStyle-Font-Bold="true"
              AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="dsDvItemsAdv" BorderStyle="None" OnDataBound="dvItemsAdv_DataBound" 
              OnItemCommand="dvItemsAdv_ItemCommand" OnItemInserted="dvItemsAdv_ItemInserted">
              <Fields>
                  <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                  <asp:BoundField DataField="AdvertisementId" Visible="false" HeaderText="AdvertisementId" InsertVisible="False" ReadOnly="True" SortExpression="AdvertisementId" />
                  <asp:BoundField DataField="OrderCode" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Priority" SortExpression="OrderCode" />
                  <asp:BoundField DataField="Name" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Name" SortExpression="Name" />
                  <asp:TemplateField HeaderText="Type" HeaderStyle-CssClass="input-group-text" >
                      <ItemTemplate>
                          <asp:Label ID="lbType" runat="server" Text='<%# Bind("TypeName") %>' ></asp:Label>
                      </ItemTemplate>
                      <InsertItemTemplate>
                          <asp:DropDownList ID="DdlItemType" runat="server" Width="100%" CssClass="custom-select-sm" SelectedValue='<%# Bind("ItemType") %>' AppendDataBoundItems="true" DataSourceID="dsDdlItemType" DataTextField="Name" DataValueField="Id">
                              <asp:ListItem Value="NA">-- Select --</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource runat="server" ID="dsDdlItemType" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' SelectCommand="SELECT * FROM [ItemType] ORDER BY [Name]"></asp:SqlDataSource>
                      </InsertItemTemplate>
                      <EditItemTemplate>
                          <asp:DropDownList ID="DdlItemTypeE" runat="server" Width="100%" CssClass="custom-select-sm" SelectedValue='<%# Bind("ItemType") %>' AppendDataBoundItems="true" DataSourceID="dsDdlItemType" DataTextField="Name" DataValueField="Id">
                            <asp:ListItem Value="NA" >-- Select --</asp:ListItem>
                        </asp:DropDownList>
                      </EditItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Category" HeaderStyle-CssClass="input-group-text" >
                      <ItemTemplate>
                          <asp:Label ID="lbCategory" runat="server" Text='<%# Bind("CategoryName") %>' ></asp:Label>
                      </ItemTemplate>
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
                      <ItemTemplate>
                          <asp:Label ID="lbCountry" runat="server" Text='<%# Bind("CountryName") %>' ></asp:Label>
                      </ItemTemplate>
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
                      <ItemTemplate>
                          <asp:Label ID="lbContinent" runat="server" Text='<%# Bind("ContinentName") %>' ></asp:Label>
                      </ItemTemplate>
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
                  <asp:BoundField DataField="PhotoId" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="PhotoId" SortExpression="PhotoId" Visible="false" />
                  <asp:CheckBoxField DataField="Active" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="Active" SortExpression="Active" />
                  <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ButtonType="Button"  ControlStyle-CssClass="btn btn-primary" />
              </Fields>
              <EmptyDataTemplate>
                   <asp:LinkButton ID="lnkNewItem" runat="server" CssClass="btn btn-outline-info" onclick="lnkNewItem_Click">No records found click here to insert one</asp:LinkButton>
              </EmptyDataTemplate>
          </asp:DetailsView>
          <asp:SqlDataSource ID="dsDvItemsAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" 
              DeleteCommand="DELETE FROM [AdvertItem] WHERE [Id] = @Id" 
              InsertCommand="INSERT INTO [AdvertItem] ([OrderCode], [Name], [AdvertisementId], [ItemType], [AdvertItemCategoryId], [CountryId], 
              [ContinentId], [Price], [InitialStock], [Stock], [Description], [SearchTags], [PhotoId], [Active]) 
              VALUES (@OrderCode, @Name, @AdvertisementId, @ItemType, @AdvertItemCategoryId, @CountryId, @ContinentId, @Price, @InitialStock, 
              @Stock, @Description, @SearchTags, @PhotoId, @Active)" 
              SelectCommand="SELECT [AdvertItem].[Id],[AdvertItem].[OrderCode],[AdvertItem].[Name],[AdvertisementId],[ItemType],[AdvertItemCategoryId],
              [AdvertItem].[CountryId],[AdvertItem].[ContinentId],[Price],[InitialStock],[Stock],[Description],[SearchTags],[PhotoId],
              [AdvertItem].[Active],[ItemType].[Name] TypeName, [AdvertItemCategory].Name CategoryName,[Country].Name CountryName,
              [Continent].Name ContinentName
              FROM [AdvertItem] INNER JOIN [ItemType] ON [AdvertItem].[ItemType] = [ItemType].[Id] 
              INNER JOIN [AdvertItemCategory] ON [AdvertItem].AdvertItemCategoryId = [AdvertItemCategory].Id
              INNER JOIN [Country] ON [AdvertItem].[CountryId] = [Country].Id
			  INNER JOIN [Continent] ON [AdvertItem].[ContinentId] = [Continent].Id
              WHERE ([AdvertisementId] = @AdvertisementId) 
              ORDER BY [OrderCode]" 
              UpdateCommand="UPDATE [AdvertItem] SET [OrderCode] = @OrderCode, [Name] = @Name, [AdvertisementId] = @AdvertisementId, 
              [ItemType] = @ItemType, [AdvertItemCategoryId] = @AdvertItemCategoryId, [CountryId] = @CountryId, [ContinentId] = @ContinentId, 
              [Price] = @Price, [InitialStock] = @InitialStock, [Stock] = @Stock, [Description] = @Description, [SearchTags] = @SearchTags, 
              [PhotoId] = @PhotoId, [Active] = @Active WHERE [Id] = @Id">
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

      <div class="tab-pane fade" id="photos" style="padding:10px" >
          <div class="form-group">

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="DdlItemsAdv">Item:</label>
                </div>
                <asp:DropDownList ID="DdlItemsAdv" CssClass="custom-select" runat="server" DataSourceID="dsDdlItemsAdv" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" AutoPostBack="true" >
                    <asp:ListItem Value="-1" >-- Select --</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsDdlItemsAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [AdvertItem] WHERE ([AdvertisementId] = @AdvertisementId) ORDER BY [OrderCode], [Name]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hdfAdverId" Name="AdvertisementId" PropertyName="Value" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
 
          </div>

          <hr class="my-4">

          <fieldset >

              <legend>Add New Photo</legend>

              <div class="form-group">
                  <div class="input-group mb-3">
                    <input type="checkbox" class="custom-control custom-checkbox" id="chkMainPhoto" runat="server" checked="" />
                    <label class="custom-control" for="chkMainPhoto">Main Photo</label>
                  </div>
              </div>

              <div class="form-group">
                  <div class="input-group mb-3">
                    <asp:FileUpload ID="fuAlbum" runat="server" />
                    <asp:Button ID="btnUploadPhoto" runat="server" Text="Upload" class="input-group-text" OnClick="btnUploadPhoto_Click" />
                  </div>
              </div>

          </fieldset>

          <hr class="my-4">

          <fieldset>
              <legend>Gallery</legend>

              <asp:DataList ID="DlPhotos" runat="server" DataSourceID="dsDlPhotos" DataKeyField="Id" RepeatColumns="3">
                  <ItemTemplate>
                      <asp:HiddenField ID="hdfPhotoId" runat="server" Value='<%# Eval("PhotoId") %>' />
                      <asp:HiddenField ID="hdfAdverItemPhotoId" runat="server" Value='<%# Eval("Id") %>' />
                      
                      <div class="card mb-3" >
                          <div class="photoItemContainer" >
                              <asp:Image ID="itemImage" runat="server" CssClass="rounded mx-auto d-block" ImageUrl='<%# Eval("PhotoId", "CommonResources/ShowImage.ashx?photoId={0}") %>' Style="max-width: 100%; height: auto;" />
                          </div>
                          <div class="card-body">
                              <asp:LinkButton ID="LnkDelAdvItemPhoto" runat="server" CssClass="card-link" onclick="lnkDelAdvItemPhoto_Click">Delete</asp:LinkButton>
                              <asp:LinkButton ID="lnkSetMainPhoto" runat="server" CssClass="card-link" onclick="lnkSetMainPhoto_Click">Set Main</asp:LinkButton>
                          </div>
                      </div>
                      <%-- Id:
                      <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" /><br />
                      AdvertItemId:
                      <asp:Label Text='<%# Eval("AdvertItemId") %>' runat="server" ID="AdvertItemIdLabel" /><br />
                      PhotoId:
                      <asp:Label Text='<%# Eval("PhotoId") %>' runat="server" ID="PhotoIdLabel" /><br />
                      Location:
                      <asp:Label Text='<%# Eval("Location") %>' runat="server" ID="LocationLabel" /><br />
                      Extension:
                      <asp:Label Text='<%# Eval("Extension") %>' runat="server" ID="ExtensionLabel" /><br />
                      Image:
                      <asp:Label Text='<%# Eval("Image") %>' runat="server" ID="ImageLabel" /><br />
                      Name:
                      <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /><br />
                      Active:
                      <asp:Label Text='<%# Eval("Active") %>' runat="server" ID="ActiveLabel" /><br />
                      <br />--%>
                  </ItemTemplate>
              </asp:DataList>

              <asp:SqlDataSource runat="server" ID="dsDlPhotos" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' 
                  SelectCommand="SELECT AdvertItemPhoto.Id, AdvertItemPhoto.AdvertItemId, AdvertItemPhoto.PhotoId, 
                    Photo.Location, Photo.Extension, Photo.[Image], Photo.Name, Photo.Active
                    FROM AdvertItem
                    INNER JOIN AdvertItemPhoto ON AdvertItemPhoto.AdvertItemId = AdvertItem.Id
                    INNER JOIN Photo ON AdvertItemPhoto.PhotoId = Photo.Id WHERE (AdvertItemPhoto.AdvertItemId = @AdvertItemId)">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="DdlItemsAdv" PropertyName="SelectedValue" Name="AdvertItemId"></asp:ControlParameter>
                  </SelectParameters>
              </asp:SqlDataSource>
          </fieldset>
      </div>

      <div class="tab-pane fade" id="schedule" style="padding:10px" >
        
      </div>

    </div>

</asp:Content>
