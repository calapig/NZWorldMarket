<%@ Page Title="" Language="C#" MasterPageFile="~/ContentManager.Master" AutoEventWireup="true" CodeBehind="CMCustomerManagSystem.aspx.cs" Inherits="NZWorldMarket.CMCustomerManagSystem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="meContainer" >
        <h1>Customer Management System</h1>
    </div>

    <asp:HiddenField ID="hdfAdverId" runat="server" />
    <asp:Panel id="dvAdverts" runat="server" CssClass="visible">
        <div class="form-group">

            <div class="input-group mb-3">
                
                <div class="input-group-prepend">
                    <label class="input-group-text" for="TxtDate">Membership Start From:</label>
                </div>
                <asp:TextBox ID="TxtDateIRange" runat="server" ></asp:TextBox>
                <ajaxToolkit:CalendarExtender runat="server" TargetControlID="TxtDateIRange" Format="dd/MM/yyyy" />
                <div class="input-group-prepend">
                    <label class="input-group-text" for="TxtDateFRange">To:</label>
                </div>
                <asp:TextBox ID="TxtDateFRange" runat="server" ></asp:TextBox>
                <ajaxToolkit:CalendarExtender runat="server" TargetControlID="TxtDateFRange" Format="dd/MM/yyyy" />

                <div class="input-group-prepend">
                    <label class="input-group-text" for="TxtDate">Key word:</label>
                </div>
                <asp:TextBox ID="TxtKeyWord" runat="server" ></asp:TextBox>

                <asp:Button ID="BtnSearch" runat="server" CssClass="btn btn-warning" Text="Search" Width="150px" OnClick="BtnSearch_Click" />

            </div>

        </div>                    
    </asp:Panel>
    <%--DataSourceID="dsGvCustomerAdvert" --%>
    <asp:GridView ID="gvCustomerAdvert" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowSorting="true" 
        OnRowCommand="gvCustomerAdvert_RowCommand" CssClass="table table-bordered table-striped table-condensed">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" Visible="False" SortExpression="Id"></asp:BoundField>

            <asp:TemplateField HeaderText="Customer" SortExpression="Email" ItemStyle-CssClass="col-xs-6" >
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvtxtEmail" runat="server" CssClass="text-danger" ValidationGroup="Edit" ControlToValidate="txtEmail" ErrorMessage="(!)"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Membership start" SortExpression="MembershipStart" ItemStyle-CssClass="col-xs-6" >
                <EditItemTemplate>
                    <asp:Label ID="lblMembershipStartE" runat="server" Text='<%# Bind("MembershipStart") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblMembershipStart" runat="server" Text='<%# Bind("MembershipStart") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Visits" SortExpression="Visits" ItemStyle-CssClass="col-xs-6" >
                <EditItemTemplate>
                    <asp:Label ID="lblVisitsE" runat="server" Text='<%# Bind("Visits") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblVisits" runat="server" Text='<%# Bind("Visits") %>'></asp:Label>
                </ItemTemplate>
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
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" CssClass="btn btn-primary" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Button ID="btnNewUser" runat="server" CssClass="btn btn-warning" Text="New Customer" OnClick="btnNewUser_Click" />

    <%--<asp:SqlDataSource runat="server" ID="dsGvCustomerAdvert"
        ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>'
        DeleteCommand="UPDATE U SET U.Active = 0  FROM [Person] P INNER JOIN [User] U ON P.Id = U.PersonId WHERE P.[Id] = @Id"
        InsertCommand="INSERT INTO [Person] ([FirstName], [LastName], [Email], [CountryId]) 
        VALUES (@FirstName, @LastName, @Email, @CountryId)"
        SelectCommand="spNZWM_userExtensiveSearch"
        UpdateCommand="UPDATE [Person] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, 
        [CountryId] = @CountryId WHERE [Id] = @Id; UPDATE U SET U.Active = @State FROM [Person] P INNER JOIN [User] U ON P.Id = U.PersonId WHERE P.[Id] = @Id;"
        SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int64"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="CountryId" Type="Byte"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TxtDateIRange" PropertyName="Text" Name="initRangeDate" Type="String" DefaultValue="" ></asp:ControlParameter>
            <asp:ControlParameter ControlID="TxtDateFRange" PropertyName="Text" Name="EndRangeDate" Type="String" DefaultValue="" ></asp:ControlParameter>
            <asp:ControlParameter ControlID="TxtKeyWord" PropertyName="Text" Name="KeyWord" Type="String" DefaultValue="" ></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="CountryId" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="Id" Type="Int64"></asp:Parameter>
            <asp:Parameter Name="State" Type="Byte"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>--%>

</asp:Content>
