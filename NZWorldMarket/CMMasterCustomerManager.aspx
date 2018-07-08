<%@ Page Title="" Language="C#" MasterPageFile="~/ContentManager.Master" AutoEventWireup="true" CodeBehind="CMMasterCustomerManager.aspx.cs" Inherits="NZWorldMarket.CMMasterCustomerManager" %>
<asp:Content ID="MasterCustomerMg" ContentPlaceHolderID="MainContent" runat="server">

    <div class="meContainer" >
        <h1>User Advertisement Manager</h1>
    </div>

    <asp:GridView ID="gvCustomerAdvert" runat="server" AutoGenerateColumns="False" DataKeyNames="Id,UserId" AllowSorting="true"
        DataSourceID="dsGvCustomerAdvert" ShowFooter="true" OnRowCommand="gvCustomerAdvert_RowCommand"
        CssClass="table table-bordered table-striped table-condensed">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" Visible="False" SortExpression="Id"></asp:BoundField>
            <asp:TemplateField HeaderText="First Name" SortExpression="FirstName" ItemStyle-CssClass="col-xs-4">
                    <EditItemTemplate>
                        <asp:HiddenField ID="hdfId" runat="server" value='<%# Eval("Id") %>' />
                        <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" CssClass="text-danger" ValidationGroup="Edit" ControlToValidate="txtFirstName" ErrorMessage="(!)"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddFirstName" runat="server" CssClass="text-danger" ValidationGroup="Add" ControlToValidate="txtAddFirstName" ErrorMessage="(!)"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

            <asp:TemplateField HeaderText="Last Name" SortExpression="LastName" ItemStyle-CssClass="col-xs-4" >
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" CssClass="text-danger" ValidationGroup="Edit" ControlToValidate="txtLastName" ErrorMessage="(!)"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" CssClass="text-danger" ValidationGroup="Add" ControlToValidate="txtAddLastName" ErrorMessage="(!)"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

            <asp:TemplateField HeaderText="Email" SortExpression="Email" ItemStyle-CssClass="col-xs-6" >
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtEmail" runat="server" CssClass="text-danger" ValidationGroup="Edit" ControlToValidate="txtEmail" ErrorMessage="(!)"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddEmail" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddEmail" runat="server" CssClass="text-danger" ValidationGroup="Add" ControlToValidate="txtAddEmail" ErrorMessage="(!)"></asp:RequiredFieldValidator>

                    </FooterTemplate>
                </asp:TemplateField>

            <asp:TemplateField HeaderText="Nationality" SortExpression="Nationality" ItemStyle-CssClass="col-xs-4" >
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="dsDdlCountry" SelectedValue='<%# Bind("CountryId") %>' DataTextField="Nationality" DataValueField="Id" >
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="dsDdlCountry" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' SelectCommand="SELECT [Id], [Name], [Nationality], [ContinentId] FROM [Country] ORDER BY [Name]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNationality" runat="server" Text='<%# Bind("Nationality") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlAddCountry" runat="server" DataSourceID="dsDdlCountry" DataTextField="Nationality" DataValueField="Id" AppendDataBoundItems="true" >
                            <asp:ListItem Value="-1" >-- Select --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvAddCountry" runat="server" CssClass="text-danger" ValidationGroup="Add" ErrorMessage="(!)" ControlToValidate="ddlAddCountry" InitialValue="-1" ></asp:RequiredFieldValidator>
                        <asp:SqlDataSource runat="server" ID="dsDdlCountry" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' SelectCommand="SELECT [Id], [Name], [Nationality], [ContinentId] FROM [Country] ORDER BY [Name]"></asp:SqlDataSource>
                    </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State" SortExpression="Active" >
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlState" runat="server" SelectedValue='<%# Bind("Active") %>'  >
                        <asp:ListItem Value="1">ACTIVE</asp:ListItem>
                        <asp:ListItem Value="0">INACTIVE</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblState" runat="server" Text='<%# Bind("ActiveText") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" ItemStyle-CssClass="col-xs-6" >
                <EditItemTemplate>
                    <asp:LinkButton ID="lnkUpdate" CssClass="btn btn-success" ValidationGroup="Edit" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="lnkCancel" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" CssClass="btn btn-primary" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CommandArgument='<%# Eval("Id") %>' ></asp:LinkButton>
                    <asp:LinkButton ID="lnkDetail" CssClass="btn btn-info" runat="server" CausesValidation="False" CommandName="Detail" Text="Detail" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' ></asp:LinkButton>
                    <%--<asp:LinkButton ID="lnkDelete" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Delete" Text="Deactivate" CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('Are you sure about inactivate the selected user?')" ></asp:LinkButton>--%>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button OnClick="btnAddCustomer_OnClick" ID="btnAddCustomer" CssClass="btn btn-warning" runat="server" ValidationGroup="Add" Text="Add" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="dsGvCustomerAdvert" 
        ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>'
        DeleteCommand="UPDATE U SET U.Active = 0  FROM [Person] P INNER JOIN [User] U ON P.Id = U.PersonId WHERE P.[Id] = @Id"
        InsertCommand="INSERT INTO [Person] ([FirstName], [LastName], [Email], [CountryId]) 
        VALUES (@FirstName, @LastName, @Email, @CountryId)" 
        SelectCommand="SELECT Person.[Id], Person.[FirstName], Person.[LastName], Person.[Email], Person.[CountryId], Country.Nationality, 
        [User].Id UserId, CASE WHEN ISNULL([User].Active, 0) = 0 THEN 'INACTIVE' ELSE 'ACTIVE' END ActiveText, 
        CASE WHEN ISNULL([User].Active, 0) = 0 THEN 0 ELSE 1 END Active
        FROM [Person] INNER JOIN 
        Country ON Person.CountryId = Country.Id LEFT JOIN 
        [User] ON  Person.Id = [User].PersonId
        ORDER BY [FirstName], [LastName]" 
        UpdateCommand="UPDATE [Person] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, 
        [CountryId] = @CountryId WHERE [Id] = @Id; UPDATE U SET U.Active = @State FROM [Person] P INNER JOIN [User] U ON P.Id = U.PersonId WHERE P.[Id] = @Id;">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int64"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="CountryId" Type="Byte"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="CountryId" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="State" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="Id" Type="Int64"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
