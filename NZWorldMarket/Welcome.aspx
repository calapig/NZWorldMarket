<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="NZWorldMarket.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to NZ World Market</title>
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous" />--%>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <style>
        body  {
            background-image: url("Images/bck_Market.jpeg");
            background-color: #cccccc;
        }

        .vertical-center {
          min-height: 50%;  
          min-height: 50vh; 

          display: flex;
          align-items: center;
        }

        .vertical-centerButton {
          min-height: 20%;  
          min-height: 20vh; 

          display: flex;
          align-items: center;
        }

        a:hover {
            color: black;
            font-size:larger;
        }

        a:active, a:link {
            color: white;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server" >

        <div class="container-fluid">
            
            <br />
            <div class="row">
                <div class="px-2 py-3" >
                        </div>
                <div class="col">
                    <asp:Image ID="mainLogo" runat="server" ImageUrl="~/Images/Logo/Logo2.JPG" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col">
                    <!-- Nest Lv 1 -->
                    <div class="row">

                        <div class="px-3 py-3" >
                        </div>


                        <div class="px-4 py-3" style="background-color:darkslategrey; color: whitesmoke">

                            <fieldset>
                            <legend><asp:Label ID="lbLegendC" runat="server" >Customers</asp:Label></legend>

                            <div class="form-group">
                                <label for="itCustomerName">Email address<asp:RegularExpressionValidator ID="rex" runat="server" ErrorMessage=" (incorrect format)" CssClass="text-danger" ControlToValidate="itCustomerName" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="WA" ></asp:RegularExpressionValidator></label>
                                <asp:TextBox ID="itCustomerName" runat="server" class="form-control" placeholder="customer_email@example.com" ValidationGroup="WA" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvItCustomerName" runat="server" CssClass="text-danger" ControlToValidate="itCustomerName" ErrorMessage="Please provide you username." ValidationGroup="WA" ></asp:RequiredFieldValidator><br />
                            </div>
                            <div class="form-group">
                                <label for="itCustomerPassw">Password</label>
                                <asp:TextBox ID="itCustomerPassw" runat="server" class="form-control" TextMode="Password" placeholder="Password" ValidationGroup="WA" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvItCustomerPassw" runat="server" CssClass="text-danger" ControlToValidate="itCustomerPassw" ErrorMessage="Please provide you password." ValidationGroup="WA" ></asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <asp:Label ID="lbMessCust" runat="server" CssClass="text-danger" Visible="false" Text="Oops! Check your login information" ></asp:Label>

                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="dropdownCheckCustomer" />
                                <label class="form-check-label" for="dropdownCheck">
                                Remember me
                                </label>
                            </div>
                            
                            <asp:LinkButton ID="btnWebApp" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Go to Customer Services System" OnClick="btnWebApp_Click" ValidationGroup="WA" />

                            <div class="dropdown-divider"></div>
                            <asp:LinkButton CssClass="dropdown-item" runat="server" Text="New around here? Sign up" PostBackUrl="CreateUser.aspx?tp=WA" ></asp:LinkButton>
                            <asp:LinkButton CssClass="dropdown-item" runat="server" Text="Forgot password?" PostBackUrl="ResetPassword.aspx?tp=WA" ></asp:LinkButton>

                            </fieldset>

                        </div>

                        <div class="px-5 py-3" >
                        </div>

                        <div class="px-4 py-3" style="background-color:darkslategrey; color: whitesmoke">
                            
                            <fieldset>
                            <legend><asp:Label ID="lbLegendS" runat="server" >Staff</asp:Label></legend>

                            <div class="form-group">
                                <label for="itUserName">Email address<asp:RegularExpressionValidator ID="rfvItStaffPassw" runat="server" ErrorMessage=" (Incorrect format)" CssClass="text-danger" ControlToValidate="itUserName" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="CM" ></asp:RegularExpressionValidator></label>
                                <asp:TextBox ID="itUserName" runat="server" class="form-control" placeholder="staff_email@example.com" ValidationGroup="CM" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" CssClass="text-danger" ControlToValidate="itUserName" ErrorMessage="Please provide you username." ValidationGroup="CM" ></asp:RequiredFieldValidator><br />
                            </div>
                            <div class="form-group">
                                <label for="exampleDropdownFormPassword1">Password</label>
                                <asp:TextBox ID="itUserPassword" runat="server" class="form-control" TextMode="Password" placeholder="Password" ValidationGroup="CM" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUserPassword" runat="server" CssClass="text-danger" ControlToValidate="itUserPassword" ErrorMessage="Please provide you password." ValidationGroup="CM" ></asp:RequiredFieldValidator>
                            </div>
                            <asp:Label ID="lbMessStaff" runat="server" CssClass="text-danger" Visible="false" Text="Oops! Check your login information" ></asp:Label>

                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="dropdownCheckStaff" />
                                <label class="form-check-label" for="dropdownCheck">
                                Remember me
                                </label>
                            </div>
                            
                            <asp:LinkButton ID="btnContentMg" runat="server" CssClass="btn btn-warning btn-lg btn-block" Text="Go to Content Manager System" OnClick="btnContentMg_Click" ValidationGroup="CM" />

                            <div class="dropdown-divider"></div>
                            <asp:LinkButton CssClass="dropdown-item" runat="server" Text="New around here? Sign up" PostBackUrl="CreateUser.aspx?tp=CM" ></asp:LinkButton>
                            <asp:LinkButton CssClass="dropdown-item" runat="server" Text="Forgot password?" PostBackUrl="ResetPassword.aspx?tp=CM" ></asp:LinkButton>

                            </fieldset>

                        </div>

                        <div class="px-5 py-3" >
                        </div>

                    </div>

                </div>
            </div>

        </div>
    </form>
</body>
</html>
