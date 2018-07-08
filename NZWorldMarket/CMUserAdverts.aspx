<%@ Page Title="" Language="C#" MasterPageFile="~/ContentManager.Master" AutoEventWireup="true" CodeBehind="CMUserAdverts.aspx.cs" Inherits="NZWorldMarket.CMUserAdverts" %>
<asp:Content ID="UserAdvertsMg" ContentPlaceHolderID="MainContent" runat="server">

    <div class="meContainer" >
        <h1>User Advertisement Manager</h1>
    </div>

    <h2>Advertisements by User: '<%# Session["UserId"].ToString() %>'</h2>

    <asp:HiddenField ID="hdfId" runat="server" />
    <asp:GridView ID="gvAdvertisements" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsGvAdvertisements"
        OnRowCommand="gvAdvertisements_RowCommand"  AllowSorting="true"
        CssClass="table table-bordered table-striped table-condensed" >
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" Visible="False" SortExpression="Id"></asp:BoundField>
            <asp:BoundField DataField="UserId" HeaderText="UserId" Visible="false" SortExpression="UserId"></asp:BoundField>
            <asp:BoundField DataField="RegionId" HeaderText="RegionId" Visible="false" SortExpression="RegionId"></asp:BoundField>
            <asp:BoundField DataField="AdvertTypeId" HeaderText="AdvertTypeId" Visible="false" SortExpression="AdvertTypeId"></asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
            <asp:BoundField DataField="URL" HeaderText="URL" Visible="false" SortExpression="URL"></asp:BoundField>
            <asp:BoundField DataField="PostDeadLine" HeaderText="PostDeadLine" SortExpression="PostDeadLine"></asp:BoundField>
            <asp:BoundField DataField="SearchTags" HeaderText="SearchTags" SortExpression="SearchTags"></asp:BoundField>
            <%--<asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active"></asp:CheckBoxField>--%>
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
            <asp:BoundField DataField="Creation" HeaderText="Creation" ReadOnly="true" SortExpression="Creation" DataFormatString="{0:MM-dd-yyyy HH:mm}" ></asp:BoundField>
            <asp:BoundField DataField="Modified" HeaderText="Modified" ReadOnly="true" SortExpression="Modified" DataFormatString="{0:MM-dd-yyyy HH:mm}" ></asp:BoundField>
            <asp:TemplateField ShowHeader="true" >
                <EditItemTemplate>
                    <asp:LinkButton ID="lnkUpdate" CssClass="btn btn-success" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="lnkCancel" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CssClass="btn btn-primary" CommandName="Edit" Text="Edit" CommandArgument='<%# Eval("Id") %>' ></asp:LinkButton>
                    <asp:LinkButton ID="lnkDetail" runat="server" CausesValidation="False" CssClass="btn btn-info" CommandName="Detail" Text="Detail" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' ></asp:LinkButton>
                    <asp:LinkButton ID="lnkSendEmail" runat="server" CausesValidation="False" CssClass="btn btn-warning" CommandName="SendEmail" Text="Send URL" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="dsGvAdvertisements" ConnectionString='<%$ ConnectionStrings:NZWorldMarketConnectionString %>' 
        DeleteCommand="DELETE FROM [Advertisement] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Advertisement] ([UserId], [RegionId], [AdvertTypeId], [Title], [URL], [PostDeadLine], [SearchTags], [Active], [Creation], [Modified]) 
        VALUES (@UserId, @RegionId, @AdvertTypeId, @Title, @URL, @PostDeadLine, @SearchTags, @Active, @Creation, @Modified)" 
        SelectCommand="SELECT [Id], [UserId], [RegionId], [AdvertTypeId], [Title], [URL], 
        [PostDeadLine], [SearchTags], CASE WHEN ISNULL([Advertisement].Active, 0) = 0 THEN 0 ELSE 1 END Active, 
        CASE WHEN ISNULL([Advertisement].Active, 0) = 0 THEN 'INACTIVE' ELSE 'ACTIVE' END ActiveText, [Creation], [Modified]
        FROM [Advertisement] WHERE ([UserId] = @UserId)" 
        UpdateCommand="UPDATE [Advertisement] 
        SET [RegionId] = @RegionId, [AdvertTypeId] = @AdvertTypeId, [Title] = @Title, [PostDeadLine] = @PostDeadLine, 
        [SearchTags] = @SearchTags, [Active] = @Active WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int64"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserId" Type="Int64"></asp:Parameter>
            <asp:Parameter Name="RegionId" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="AdvertTypeId" Type="String"></asp:Parameter>
            <asp:Parameter Name="Title" Type="String"></asp:Parameter>
            <asp:Parameter Name="URL" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="PostDeadLine"></asp:Parameter>
            <asp:Parameter Name="SearchTags" Type="String"></asp:Parameter>
            <asp:Parameter Name="Active" Type="Boolean"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Creation"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Modified"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter SessionField="UserId" Name="UserId" Type="Int64"></asp:SessionParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="RegionId" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="AdvertTypeId" Type="String"></asp:Parameter>
            <asp:Parameter Name="Title" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="PostDeadLine"></asp:Parameter>
            <asp:Parameter Name="SearchTags" Type="String"></asp:Parameter>
            <asp:Parameter Name="Active" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Id" Type="Int64"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
