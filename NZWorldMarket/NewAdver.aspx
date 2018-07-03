<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewAdver.aspx.cs" Inherits="NZWorldMarket.WebForm1" %>
<asp:Content ID="cNewAdver" ContentPlaceHolderID="MainContent" runat="server" >

    <div class="meContainer" >

        <fieldset>
            <legend>Personal Info</legend>
    
            <div class="form-group">
                <label for="txtFirstName">First name</label>
                <asp:TextBox ID="txtFirstName" runat="server" class="form-control" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger" ControlToValidate="txtFirstName" ErrorMessage="Please provide your first name."></asp:RequiredFieldValidator>
               <%--<div class="invalid-feedback"> </div>--%>
            </div>

            <div class="form-group">
                <label for="txtLastName">Last name</label>
                <asp:TextBox ID="txtLastName" runat="server" class="form-control" ></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" class="form-control" ></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="ddlCountry">Nationality</label>
                <asp:DropDownList ID="DdlCountry" runat="server" class="form-control" DataSourceID="dsDdlCountry" DataTextField="Nationality" DataValueField="Id" ></asp:DropDownList>
                <asp:SqlDataSource ID="dsDdlCountry" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Nationality], [Name] FROM [Country] WHERE ([Active] = @Active) ORDER BY [Nationality], [Name]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

        </fieldset>


        <fieldset>
            <legend>Advertisement Info</legend>

            <div class="form-group">
                <label for="ddlRegion">Region</label>
                <asp:DropDownList ID="ddlRegion" runat="server" class="form-control" DataSourceID="dsDdlRegion" DataTextField="Name" DataValueField="Id" ></asp:DropDownList>
                <asp:SqlDataSource ID="dsDdlRegion" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Code], [Name] FROM [Region] WHERE ([Active] = @Active) ORDER BY [OrderCode]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div class="form-group">
                <label for="ddlTypeAdv">Type</label>
                <asp:DropDownList ID="ddlTypeAdv" runat="server" class="form-control" DataSourceID="dsDdlTypeAdv" DataTextField="Name" DataValueField="Id" ></asp:DropDownList>
                <asp:SqlDataSource ID="dsDdlTypeAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [AdvertType] WHERE ([Active] = @Active) ORDER BY [OrderCode]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div class="form-group">
                <label for="txtTitle">Title</label>
                <asp:TextBox ID="txtTitle" runat="server" class="form-control" ></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtTitle">Overview</label>
                <asp:TextBox ID="txtOverview" runat="server" class="form-control" TextMode="MultiLine" Rows="4" ></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtDeadLine">Post Deadline (Optional)</label>
                <asp:TextBox ID="txtDeadLine" runat="server" class="form-control" ></asp:TextBox>
            </div>

        </fieldset>

        <asp:Button ID="btnCreate" runat="server" class="btn btn-primary" Text="Create!" OnClick="btnCreate_Click" />
        <%--<button type="submit" class="btn btn-primary">Create!</button>--%>

    </div>

</asp:Content>
