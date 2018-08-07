<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp.Master" AutoEventWireup="true" CodeBehind="WANewAdver.aspx.cs" Inherits="NZWorldMarket.WANewAdver" %>
<asp:Content ID="cNewAdver" ContentPlaceHolderID="MainContent" runat="server" >

    <div class="meContainer" >

        <div class="container">

          <div class="row">

            <div class="col-sm">
            
                <fieldset>
                    <legend>Personal Info</legend>
    
                    <div class="form-group">
                        <label for="txtFirstName">First name</label>
                        <asp:TextBox ID="txtFirstName" runat="server" class="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" CssClass="text-danger" ControlToValidate="txtFirstName" ErrorMessage="Please provide your first name."></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtLastName">Last name</label>
                        <asp:TextBox ID="txtLastName" runat="server" class="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" CssClass="text-danger" ControlToValidate="txtLastName" ErrorMessage="Please provide your last name."></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" CssClass="text-danger" ControlToValidate="txtEmail" ErrorMessage="Please provide your email."></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="ddlCountry">Nationality</label>
                        <asp:DropDownList ID="DdlCountry" runat="server" class="form-control" DataSourceID="dsDdlCountry" DataTextField="Nationality" DataValueField="Id" AppendDataBoundItems="true" >
                            <asp:ListItem Value="-1" >-- Select --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCountry" runat="server" CssClass="text-danger" ErrorMessage="Select a nationality" ControlToValidate="DdlCountry" InitialValue="-1" ></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="dsDdlCountry" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Nationality], [Name] FROM [Country] WHERE ([Active] = @Active) ORDER BY [Nationality], [Name]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                </fieldset>

            </div>

            <div class="col-sm">
              
                <fieldset>
                    <legend>Advertisement Info</legend>

                    <div class="form-group">
                        <label for="ddlRegion">Region</label>
                        <asp:DropDownList ID="ddlRegion" runat="server" class="form-control" DataSourceID="dsDdlRegion" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" >
                            <asp:ListItem Value="-1" >-- Select --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDdlRegion" runat="server" ErrorMessage="Select a region" ControlToValidate="ddlRegion" InitialValue="-1"  CssClass="text-danger" ></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="dsDdlRegion" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Code], [Name] FROM [Region] WHERE ([Active] = @Active) ORDER BY [OrderCode]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <div class="form-group">
                        <label for="ddlTypeAdv">Type</label>
                        <asp:DropDownList ID="ddlTypeAdv" runat="server" class="form-control" DataSourceID="dsDdlTypeAdv" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" >
                            <asp:ListItem Value="-1" >-- Select --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDdlTypeAdv" runat="server" ErrorMessage="Select a type of advertisement" ControlToValidate="ddlTypeAdv" InitialValue="-1"  CssClass="text-danger" ></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="dsDdlTypeAdv" runat="server" ConnectionString="<%$ ConnectionStrings:NZWorldMarketConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [AdvertType] WHERE ([Active] = @Active) ORDER BY [OrderCode]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <div class="form-group">
                        <label for="txtTitle">Title</label>
                        <asp:TextBox ID="txtTitle" runat="server" class="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" CssClass="text-danger" ControlToValidate="txtTitle" ErrorMessage="Please provide a main title for your advertisement."></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtTitle">Overview</label>
                        <asp:TextBox ID="txtOverview" runat="server" class="form-control" TextMode="MultiLine" Rows="4" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOverview" runat="server" CssClass="text-danger" ControlToValidate="txtOverview" ErrorMessage="Please provide a general overview for your advertisement."></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtDeadLine">Post Deadline (Optional)</label>
                        <asp:TextBox ID="txtDeadLine" runat="server" class="form-control" ></asp:TextBox>
                    </div>

                </fieldset>

            </div>
          </div>

        </div>

        <asp:Button ID="btnCreate" runat="server" class="btn btn-primary" Text="Create!" OnClick="btnCreate_Click" />
        

    </div>

    <%--<script>
        $( function() {
            $( "#txtDeadLine" ).datepicker();
        } );
    </script>--%>

</asp:Content>
