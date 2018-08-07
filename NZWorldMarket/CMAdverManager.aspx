<%@ Page Title="" Language="C#" MasterPageFile="~/ContentManager.Master" AutoEventWireup="true" CodeBehind="CMAdverManager.aspx.cs" Inherits="NZWorldMarket.CMAdverManager" %>
<asp:Content ID="cManagerAdver" ContentPlaceHolderID="MainContent" runat="server">

    <div class="meContainer" >
        <h1>Advertisement Management System</h1>
    </div>

    <asp:HiddenField ID="hdfAdverId" runat="server" />
    <asp:Panel id="dvAdverts" runat="server" CssClass="visible">
        <div class="form-group">

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="DdlItemsAdv">Type:</label>
                </div>
                <asp:DropDownList ID="DdlTypeAdver" runat="server" AutoPostBack="true" DataSourceID="dsDdlTypeAdver" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="DdlTypeAdver_SelectedIndexChanged" >
                    <asp:ListItem Value="-1">-- Select --</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="dsDdlTypeAdver" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' SelectCommand="SELECT DISTINCT at.Id, at.Name, at.OrderCode FROM [Advertisement] a INNER JOIN [AdvertType] at ON a.AdvertTypeId = at.Id ORDER BY at.OrderCode"></asp:SqlDataSource>

                <div class="input-group-prepend">
                    <label class="input-group-text" for="TxtDate">Date Creation:</label>
                </div>
                <asp:TextBox ID="TxtDate" runat="server" ></asp:TextBox>

                <div class="input-group-prepend">
                    <label class="input-group-text" for="TxtDate">Key word:</label>
                </div>
                <asp:TextBox ID="TxtKeyWord" runat="server" ></asp:TextBox>

                <asp:Button ID="BtnSearch" runat="server" CssClass="btn btn-warning" Text="Search" Width="150px" />

            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="DdlItemsAdv">Advertisements:</label>
                </div>
                <asp:DropDownList ID="DdlAdverts" runat="server" AutoPostBack="true" DataSourceID="dsDdlAdverts" DataTextField="Title" DataValueField="Id" AppendDataBoundItems="true" OnSelectedIndexChanged="DdlAdverts_SelectedIndexChanged" >
                    <asp:ListItem Value="-1">-- Select --</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="dsDdlAdverts" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' SelectCommand="SELECT [Id], [Title] FROM [Advertisement] ORDER BY [Title]"></asp:SqlDataSource>
            </div>

        </div>                    
    </asp:Panel>
   

    <asp:Panel id="dvConfigAdver" runat="server" class="visible" >

        <ul class="nav nav-tabs">
          <li class="nav-item">
            <a class="nav-link active show" data-toggle="tab" href="#infoCard">Info Card</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " data-toggle="tab" href="#detail">Items</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " data-toggle="tab" href="#photos">Photos</a>
          </li>
        <%--  <li class="nav-item">
            <a class="nav-link " data-toggle="tab" href="#schedule">Schedule</a>
          </li>--%>
        </ul>

        <div id="myTabContent" class="tab-content">

          <div class="tab-pane fade active show" id="infoCard" style="padding:10px" >

               <div class="row row justify-content-start">
                <div class="col-4">
              
                    <asp:DetailsView ID="dvInfoCardAdv" runat="server" Height="50px" Width="355px" DefaultMode="Edit" 
                      AutoGenerateRows="False" DataKeyNames="Id,UserId" DataSourceID="dsDvInfoCardAdv"
                        CssClass="table table-bordered table-condensed" >
                      <Fields>
                          <asp:BoundField DataField="Id" HeaderText="Id" Visible="false" InsertVisible="False" ReadOnly="True" />
                          <asp:BoundField DataField="UserId" HeaderText="UserId" Visible="false" ReadOnly="True" />
                          <asp:TemplateField HeaderText="Region" >
                              <EditItemTemplate>
                                <asp:DropDownList ID="DdlRegionId" runat="server" Width="100%" CssClass="custom-select-sm" DataSourceID="dsDdlRegion" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("RegionId") %>' ></asp:DropDownList>
                                <asp:SqlDataSource ID="dsDdlRegion" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Code], [Name] FROM [Region] WHERE ([Active] = @Active) ORDER BY [OrderCode]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                              </EditItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Type" >
                              <EditItemTemplate>
                                <asp:DropDownList ID="DdlAdvertTypeId" runat="server" Width="100%" CssClass="custom-select-sm" DataSourceID="dsDdlTypeAdv" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("AdvertTypeId") %>' ></asp:DropDownList>
                                <asp:SqlDataSource ID="dsDdlTypeAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [AdvertType] WHERE ([Active] = @Active) ORDER BY [OrderCode]">
                                    <SelectParameters>
                                         <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                              </EditItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Title" >
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtTitleE" runat="server" CssClass="form-control form-control-sm mr-sm-2" Text='<%# Bind("Title") %>' ></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="rfvTitleE" runat="server" CssClass="text-danger" ControlToValidate="txtTitleE" ErrorMessage="Please provide a title."></asp:RequiredFieldValidator>
                              </EditItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Overview" >
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtOverviewE" runat="server" CssClass="form-control form-control-sm mr-sm-2" Text='<%# Bind("Overview") %>' TextMode="MultiLine" Rows="4" ></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="rfvOverviewE" runat="server" CssClass="text-danger" ControlToValidate="txtOverviewE" ErrorMessage="Please provide an overview."></asp:RequiredFieldValidator>
                              </EditItemTemplate>
                          </asp:TemplateField>
                          <asp:BoundField DataField="URL" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="URL" SortExpression="URL" Visible="false" />
                          <asp:BoundField DataField="StyleSheet" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="StyleSheet" SortExpression="StyleSheet" Visible="false" />
                          <asp:BoundField DataField="PostDeadLine" HeaderText="PostDeadLine" SortExpression="PostDeadLine" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" DataFormatString="{0:MM-dd-yyyy}" ApplyFormatInEditMode="true" />
                          <asp:BoundField DataField="SearchTags" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="SearchTags" SortExpression="SearchTags" Visible="false" />
                          <asp:BoundField DataField="PhotoId" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="PhotoId" SortExpression="PhotoId" Visible="false" />
                          <asp:CheckBoxField DataField="Promotion" HeaderText="In Promo" SortExpression="Active" />
                          <asp:TemplateField HeaderText="Discount Value (%)" >
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtDiscountE" runat="server" CssClass="form-control form-control-sm mr-sm-2" Text='<%# Bind("Discount") %>' ></asp:TextBox>
                              </EditItemTemplate>
                          </asp:TemplateField>
                          <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                          <asp:BoundField DataField="Creation"   HeaderText="Creation" SortExpression="Creation" ReadOnly="true" DataFormatString="{0:MM-dd-yyyy HH:mm}" />
                          <asp:BoundField DataField="Modified"   HeaderText="Modified" SortExpression="Modified" ReadOnly="true" DataFormatString="{0:MM-dd-yyyy HH:mm}" />
                          <asp:CommandField ShowEditButton="True" ButtonType="Button"  ControlStyle-CssClass="btn btn-primary" />
                      </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="dsDvInfoCardAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" 
                        DeleteCommand="DELETE FROM [Advertisement] WHERE [Id] = @Id" 
                        InsertCommand="INSERT INTO [Advertisement] ([UserId], [RegionId], [AdvertTypeId], [Title], [Overview], [URL], [StyleSheet], [PostDeadLine], [SearchTags], [PhotoId], [Promotion], [Discount], [Active], [Creation], [Modified]) VALUES (@UserId, @RegionId, @AdvertTypeId, @Title, @Overview, @URL, @StyleSheet, @PostDeadLine, @SearchTags, @PhotoId, @Promotion, @Discount, @Active, @Creation, @Modified)" 
                        SelectCommand="SELECT * FROM [Advertisement] WHERE ([Id] = @Id)" 
                        UpdateCommand="UPDATE [Advertisement] SET [UserId] = @UserId, [RegionId] = @RegionId, [AdvertTypeId] = @AdvertTypeId, [Title] = @Title, [Overview] = @Overview, [PostDeadLine] = @PostDeadLine, [Promotion] = @Promotion, [Discount] = @Discount, [Active] = @Active WHERE [Id] = @Id">
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
                            <asp:Parameter Name="Promotion" Type="Boolean" />
                            <asp:Parameter Name="Discount" Type="Int32" />
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
                            <asp:Parameter DbType="Date" Name="PostDeadLine" />
                            <asp:Parameter Name="Promotion" Type="Boolean" />
                            <asp:Parameter Name="Discount" Type="Int32" />
                            <asp:Parameter Name="Active" Type="Boolean" />
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

          <div class="tab-pane fade " id="detail" style="padding:10px" >
              <asp:DetailsView ID="dvItemsAdv" runat="server" Height="50px" Width="355px" AllowPaging="True" PagerSettings-Mode="Numeric"  
                  PagerStyle-Font-Size="XX-Large" PagerStyle-Font-Bold="true" CssClass="table table-bordered table-condensed"
                  AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="dsDvItemsAdv" BorderStyle="None" OnDataBound="dvItemsAdv_DataBound" 
                  OnItemCommand="dvItemsAdv_ItemCommand" OnItemInserted="dvItemsAdv_ItemInserted">
                  <Fields>
                      <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                      <asp:BoundField DataField="AdvertisementId" Visible="false" HeaderText="AdvertisementId" InsertVisible="False" ReadOnly="True" SortExpression="AdvertisementId" />
                      <asp:BoundField DataField="OrderCode" HeaderText="Priority" SortExpression="OrderCode" />
                      <asp:TemplateField HeaderText="Name" >
                          <ItemTemplate>
                              <asp:Label ID="LblName" runat="server" Text='<%# Bind("Name") %>' ></asp:Label>
                          </ItemTemplate>
                          <InsertItemTemplate>
                              <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-sm mr-sm-2" ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvName" runat="server" CssClass="text-danger" ControlToValidate="txtName" ErrorMessage="Please provide a name."></asp:RequiredFieldValidator>
                          </InsertItemTemplate>
                          <EditItemTemplate>
                              <asp:TextBox ID="txtNameE" runat="server" CssClass="form-control form-control-sm mr-sm-2" Text='<%# Bind("Name") %>' ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvNameE" runat="server" CssClass="text-danger" ControlToValidate="txtNameE" ErrorMessage="Please provide a name."></asp:RequiredFieldValidator>
                          </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Type">
                          <ItemTemplate>
                              <asp:Label ID="lbType" runat="server" Text='<%# Bind("TypeName") %>' ></asp:Label>
                          </ItemTemplate>
                          <InsertItemTemplate>
                              <asp:DropDownList ID="DdlItemType" runat="server" Width="100%" CssClass="custom-select-sm" SelectedValue='<%# Bind("ItemType") %>' AppendDataBoundItems="true" DataSourceID="dsDdlItemType" DataTextField="Name" DataValueField="Id">
                                  <asp:ListItem Value="NA">-- Select --</asp:ListItem>
                              </asp:DropDownList>
                              <asp:RequiredFieldValidator ID="rfvItemType" runat="server" CssClass="text-danger" ErrorMessage="Select a type of advertisement" ControlToValidate="DdlItemType" InitialValue="NA" ></asp:RequiredFieldValidator>
                              <asp:SqlDataSource runat="server" ID="dsDdlItemType" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' SelectCommand="SELECT * FROM [ItemType] ORDER BY [Name]"></asp:SqlDataSource>
                          </InsertItemTemplate>
                          <EditItemTemplate>
                              <asp:DropDownList ID="DdlItemTypeE" runat="server" Width="100%" CssClass="custom-select-sm" SelectedValue='<%# Bind("ItemType") %>' DataSourceID="dsDdlItemTypeE" DataTextField="Name" DataValueField="Id">
                              </asp:DropDownList>
                              <asp:SqlDataSource runat="server" ID="dsDdlItemTypeE" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' SelectCommand="SELECT * FROM [ItemType] ORDER BY [Name]"></asp:SqlDataSource>
                          </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Category" >
                          <ItemTemplate>
                              <asp:Label ID="lbCategory" runat="server" Text='<%# Bind("CategoryName") %>' ></asp:Label>
                          </ItemTemplate>
                          <InsertItemTemplate>
                              <asp:DropDownList ID="DdlAdvertItemCategoryId" runat="server" Width="100%" CssClass="custom-select-sm" DataSourceID="dsDdlAdvertItemCategoryId" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("AdvertItemCategoryId") %>' AppendDataBoundItems="True" >
                                  <asp:ListItem Value="-1" >-- Select --</asp:ListItem>
                              </asp:DropDownList>
                              <asp:RequiredFieldValidator ID="rfvAdvertItemCategory" runat="server" CssClass="text-danger" ErrorMessage="Select a category" ControlToValidate="DdlAdvertItemCategoryId" InitialValue="-1" ></asp:RequiredFieldValidator>
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
                      <asp:TemplateField HeaderText="Country" >
                          <ItemTemplate>
                              <asp:Label ID="lbCountry" runat="server" Text='<%# Bind("CountryName") %>' ></asp:Label>
                          </ItemTemplate>
                          <InsertItemTemplate>
                            <asp:DropDownList ID="DdlCountry" runat="server" Width="100%" class="custom-select-sm" DataSourceID="dsDdlCountry" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("CountryId") %>' AppendDataBoundItems="True" >
                                <asp:ListItem Selected="True" Value="-1" >-- Select --</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCountry" runat="server" CssClass="text-danger" ErrorMessage="Select a country" ControlToValidate="DdlCountry" InitialValue="-1" ></asp:RequiredFieldValidator>
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
                      <asp:TemplateField HeaderText="Continent" >
                          <ItemTemplate>
                              <asp:Label ID="lbContinent" runat="server" Text='<%# Bind("ContinentName") %>' ></asp:Label>
                          </ItemTemplate>
                          <InsertItemTemplate>
                              <asp:DropDownList ID="ddlContinent" runat="server" Width="100%" class="custom-select-sm" DataSourceID="dsDdlContinent" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("ContinentId") %>' AppendDataBoundItems="True" >
                                <asp:ListItem Selected="True" Value="-1" >-- Select --</asp:ListItem>
                              </asp:DropDownList>
                              <asp:RequiredFieldValidator ID="rfvContinent" runat="server" CssClass="text-danger" ErrorMessage="Select a continent" ControlToValidate="ddlContinent" InitialValue="-1" ></asp:RequiredFieldValidator>
                              <asp:SqlDataSource ID="dsDdlContinent" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT Id, Name, OrderCode, Active FROM Continent WHERE (Active = 1) ORDER BY OrderCode"></asp:SqlDataSource>
                          </InsertItemTemplate>
                          <EditItemTemplate>
                              <asp:DropDownList ID="ddlContinent" runat="server" Width="100%" class="custom-select-sm" DataSourceID="dsDdlContinent" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("ContinentId") %>' >
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="dsDdlContinent" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT Id, Name, OrderCode, Active FROM Continent WHERE (Active = 1) ORDER BY OrderCode"></asp:SqlDataSource>
                          </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Price" >
                          <ItemTemplate>
                              <asp:Label ID="LblPrice" runat="server" Text='<%# Bind("Price") %>' ></asp:Label>
                          </ItemTemplate>
                          <InsertItemTemplate>
                              <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control form-control-sm mr-sm-2" ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvPrice" runat="server" CssClass="text-danger" ControlToValidate="txtPrice" ErrorMessage="Please provide a price."></asp:RequiredFieldValidator>
                          </InsertItemTemplate>
                          <EditItemTemplate>
                              <asp:TextBox ID="txtPriceE" runat="server" CssClass="form-control form-control-sm mr-sm-2" Text='<%# Bind("Price") %>' ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvPriceE" runat="server" CssClass="text-danger" ControlToValidate="txtPriceE" ErrorMessage="Please provide a price."></asp:RequiredFieldValidator>
                          </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Initial Stock" >
                          <ItemTemplate>
                              <asp:Label ID="LblIStock" runat="server" Text='<%# Bind("InitialStock") %>' ></asp:Label>
                          </ItemTemplate>
                          <InsertItemTemplate>
                              <asp:TextBox ID="txtIStock" runat="server" CssClass="form-control form-control-sm mr-sm-2" ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvIStock" runat="server" CssClass="text-danger" ControlToValidate="txtIStock" ErrorMessage="Please provide a initial stock."></asp:RequiredFieldValidator>
                          </InsertItemTemplate>
                          <EditItemTemplate>
                              <asp:TextBox ID="txtIStockE" runat="server" CssClass="form-control form-control-sm mr-sm-2" Text='<%# Bind("InitialStock") %>' ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvIStockE" runat="server" CssClass="text-danger" ControlToValidate="txtIStockE" ErrorMessage="Please provide initial stock."></asp:RequiredFieldValidator>
                          </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Stock" >
                          <ItemTemplate>
                              <asp:Label ID="LblStock" runat="server" Text='<%# Bind("Stock") %>' ></asp:Label>
                          </ItemTemplate>
                          <InsertItemTemplate>
                              <asp:TextBox ID="txtStock" runat="server" CssClass="form-control form-control-sm mr-sm-2" ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvStock" runat="server" CssClass="text-danger" ControlToValidate="txtStock" ErrorMessage="Please provide the actual stock."></asp:RequiredFieldValidator>
                          </InsertItemTemplate>
                          <EditItemTemplate>
                              <asp:TextBox ID="txtStockE" runat="server" CssClass="form-control form-control-sm mr-sm-2" Text='<%# Bind("Stock") %>' ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvStockE" runat="server" CssClass="text-danger" ControlToValidate="txtStockE" ErrorMessage="Please provide the actual stock."></asp:RequiredFieldValidator>
                          </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Description" >
                          <ItemTemplate>
                              <asp:Label ID="LblDescription" runat="server" Text='<%# Bind("Description") %>' ></asp:Label>
                          </ItemTemplate>
                          <InsertItemTemplate>
                              <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control form-control-sm mr-sm-2" ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvDescription" runat="server" CssClass="text-danger" ControlToValidate="txtDescription" ErrorMessage="Please provide the description."></asp:RequiredFieldValidator>
                          </InsertItemTemplate>
                          <EditItemTemplate>
                              <asp:TextBox ID="txtDescriptionE" runat="server" CssClass="form-control form-control-sm mr-sm-2" Text='<%# Bind("Description") %>' ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvDescriptionE" runat="server" CssClass="text-danger" ControlToValidate="txtDescriptionE" ErrorMessage="Please provide the description."></asp:RequiredFieldValidator>
                          </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="SearchTags" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="SearchTags" SortExpression="SearchTags"  Visible="false" />
                      <asp:BoundField DataField="PhotoId" ControlStyle-CssClass="form-control form-control-sm mr-sm-2" HeaderStyle-CssClass="input-group-text" HeaderText="PhotoId" SortExpression="PhotoId" Visible="false" />
                      <asp:CheckBoxField DataField="Promotion" HeaderText="In Promo" SortExpression="Active" />
                      <asp:TemplateField HeaderText="Discount Value (%)" >
                          <ItemTemplate>
                              <asp:Label ID="LblDiscount" runat="server" Text='<%# Bind("Discount") %>' ></asp:Label>
                          </ItemTemplate>
                          <InsertItemTemplate>
                              <asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control form-control-sm mr-sm-2" ></asp:TextBox>
                          </InsertItemTemplate>
                          <EditItemTemplate>
                              <asp:TextBox ID="txtDiscountE" runat="server" CssClass="form-control form-control-sm mr-sm-2" Text='<%# Bind("Discount") %>' ></asp:TextBox>
                          </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                      <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ButtonType="Button"  ControlStyle-CssClass="btn btn-primary" />

                  </Fields>
                  <EmptyDataTemplate>
                       <asp:LinkButton ID="lnkNewItem" runat="server" CssClass="btn btn-outline-info" onclick="lnkNewItem_Click">No records found click here to insert one</asp:LinkButton>
                  </EmptyDataTemplate>
              </asp:DetailsView>
              <asp:SqlDataSource ID="dsDvItemsAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" 
                  DeleteCommand="DELETE FROM [AdvertItem] WHERE [Id] = @Id" 
                  InsertCommand="INSERT INTO [AdvertItem] ([OrderCode], [Name], [AdvertisementId], [ItemType], [AdvertItemCategoryId], [CountryId], 
                  [ContinentId], [Price], [InitialStock], [Stock], [Description], [Promotion], [Discount], [Active]) 
                  VALUES (@OrderCode, @Name, @AdvertisementId, @ItemType, @AdvertItemCategoryId, @CountryId, @ContinentId, @Price, @InitialStock, 
                  @Stock, @Description, @Promotion, @Discount, @Active)" 
                  SelectCommand="SELECT [AdvertItem].[Id],[AdvertItem].[OrderCode],[AdvertItem].[Name],[AdvertisementId],[ItemType],[AdvertItemCategoryId],
                  [AdvertItem].[CountryId],[AdvertItem].[ContinentId],[Price],[InitialStock],[Stock],[Description],[SearchTags],[PhotoId],
                  [AdvertItem].[Active],[ItemType].[Name] TypeName, [AdvertItemCategory].Name CategoryName,[Country].Name CountryName,
                  [Continent].Name ContinentName, [AdvertItem].[Promotion], [AdvertItem].[Discount]
                  FROM [AdvertItem] INNER JOIN [ItemType] ON [AdvertItem].[ItemType] = [ItemType].[Id] 
                  INNER JOIN [AdvertItemCategory] ON [AdvertItem].AdvertItemCategoryId = [AdvertItemCategory].Id
                  INNER JOIN [Country] ON [AdvertItem].[CountryId] = [Country].Id
			      INNER JOIN [Continent] ON [AdvertItem].[ContinentId] = [Continent].Id
                  WHERE ([AdvertisementId] = @AdvertisementId) 
                  ORDER BY [OrderCode]" 
                  UpdateCommand="UPDATE [AdvertItem] SET [OrderCode] = @OrderCode, [Name] = @Name, [AdvertisementId] = @AdvertisementId, 
                  [ItemType] = @ItemType, [AdvertItemCategoryId] = @AdvertItemCategoryId, [CountryId] = @CountryId, [ContinentId] = @ContinentId, 
                  [Price] = @Price, [InitialStock] = @InitialStock, [Stock] = @Stock, [Description] = @Description, [SearchTags] = @SearchTags, 
                  [PhotoId] = @PhotoId, [Promotion] = @Promotion, [Discount] = @Discount, [Active] = @Active WHERE [Id] = @Id">
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
                      <asp:Parameter Name="Promotion" Type="Boolean" />
                      <asp:Parameter Name="Discount" Type="Int32" />
                      <asp:Parameter Name="Active" Type="Boolean" />
                  </InsertParameters>
                  <SelectParameters>
                      <asp:ControlParameter ControlID="hdfAdverId" Name="AdvertisementId" PropertyName="Value" Type="Int64" />
                  </SelectParameters>
                  <UpdateParameters>
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
                      <asp:Parameter Name="Promotion" Type="Boolean" />
                      <asp:Parameter Name="Discount" Type="Int32" />
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

        </div>

    </asp:Panel>


</asp:Content>
