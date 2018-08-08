<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="NZWorldMarket.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />

    <script src="Scripts/myValidate.js" ></script>
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>

    <style>
        body  {
            background-image: url("Images/bck_NewMember.jpeg");
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
    <script>

        $(document).ready(function()
        {
	        $("#dvMessage").hide();
	        $("#dvConfigValPassw").hide();
	
	
            $("#isCreate").click(function () {
		        console.log('aaaaa');
	        });
	
	        $("#itUserPassword").blur(function() {
		        // Extract configuration for the validator
		        var uppCase = $("#slUppCase").val();
		        var lowCase = $("#slLowercase").val();
		        var specialChar = $("#slSpecialChar").val();
		        var number = $("#slNumber").val();
		        var minLength = $("#slMinLength").val();
		
		        // Configurate the regular expression 
		        var dynamicEx = validatePassword(uppCase, lowCase, specialChar, number, minLength);
		        var expression = "^" + dynamicEx + "$";
		        var rx = new RegExp(expression, 'g');
		
		        console.log(rx, 'reg expression');
		        console.log($(this).val().match(rx), "match if is != null");
		
		        // Evaluate if the password string accomplish the requirements of the regex
		        if ($(this).val().match(rx) === null) 
		        {
			        $("#dvMessage").html(passwordValidationMsg(uppCase, lowCase, specialChar, number, minLength));
			        $("#dvMessage").show();
		        } else
		        {
			        $("#dvMessage").html('');
			        $("#dvMessage").hide();
		        }
		
	        });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="container-fluid">
            
            <asp:HiddenField ID="hdfTp" runat="server" />
            
            <br />
            <div class="row">
                <div class="col">
                    <!-- Nest Lv 1 -->
                    <div class="row">

                        <div class="px-3 py-3" >
                        </div>

                        <div class="px-4 py-3" style="background-color:darkslategrey; color: whitesmoke">

                            <asp:Image ID="mainLogo" runat="server" ImageUrl="~/Images/Logo/Logo2.JPG" />

                        </div>

                        <div class="px-4 py-3" style="background-color:darkslategrey; color: whitesmoke">

                            <fieldset>
                            <legend><asp:Label ID="lbLegend" runat="server" ></asp:Label></legend>

                            <div class="form-group">
                                <label for="itCustomerName">Email address<asp:RegularExpressionValidator ID="rfvItCustomerName" runat="server" ErrorMessage=" (Incorrect format)" CssClass="text-danger" ControlToValidate="itUserName" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="val" ></asp:RegularExpressionValidator></label>
                                <asp:TextBox ID="itUserName" runat="server" class="form-control" placeholder="your_email@example.com" ValidationGroup="val" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="itUserName" class="text-danger" ErrorMessage="User name required" ValidationGroup="val" ></asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <div class="form-group">
                                <label for="itCustomerPassw">Password</label>
                                <asp:TextBox ID="itUserPassword" runat="server" class="form-control" TextMode="Password" placeholder="Password" ValidationGroup="val" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUserPassword" runat="server" ControlToValidate="itUserPassword" class="text-danger" ErrorMessage="Password required" ValidationGroup="val" ></asp:RequiredFieldValidator>
                                <br />
                            </div>

                            <div id="dvMessage" class="text-danger" role="alert" style="max-width:300px">
					
				            </div>

                            <div class="form-group">
                                <label for="itCustomerPassw">Confirm Password</label>
                                <asp:TextBox ID="itConfirmPassword" runat="server" class="form-control" TextMode="Password" placeholder="Confirm Password" ValidationGroup="val" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="itConfirmPassword" class="text-danger" ErrorMessage="Confirm Password required" ValidationGroup="val" ></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToCompare="itUserPassword" ControlToValidate="itConfirmPassword" class="text-danger" ErrorMessage="Confirm Password does not match" ValidationGroup="val" ></asp:CompareValidator>
                                <br />
                            </div>
                            
                            <asp:Button ID="btnReset" runat="server" CssClass="btn btn-outline-success" Text="Reset" OnClick="btnReset_Click" ValidationGroup="val"  />
                            <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-outline-danger" Text="Cancel" OnClick="btnCancel_Click"/>

                            </fieldset>

                        </div>

                    </div>

                </div>
            </div>

        </div>

        <div id="dvConfigValPassw" >
			
			<div class="form-group row" >
			
				<label for="slUppCase" class="col-sm-2 col-form-label">Uppercase</label>
				<div class="col-sm-2">
					<select class="form-control" id="slUppCase" name="slUppCase" >
						<option value="true">true</option>
						<option value="false">false</option>
					</select>
				</div>
			
			</div>
				
			<div class="form-group row" >
			
				<label for="slLowercase" class="col-sm-2 col-form-label">Lowercase</label>
				<div class="col-sm-2">
					<select class="form-control" id="slLowercase" name="slLowercase" >
						<option value="true">true</option>
						<option value="false">false</option>
					</select>
				</div>
			
			</div>
				
			<div class="form-group row" >
			
				<label for="slSpecialChar" class="col-sm-2 col-form-label">Special Character</label>
				<div class="col-sm-2">
					<select class="form-control" id="slSpecialChar" name="slSpecialChar" >
						<option value="true">true</option>
						<option value="false">false</option>
					</select>
				</div>
			
			</div>
				
			<div class="form-group row" >
			
				<label for="slNumber" class="col-sm-2 col-form-label">Number</label>
				<div class="col-sm-2">
					<select class="form-control" id="slNumber" name="slNumber" >
						<option value="true">true</option>
						<option value="false">false</option>
					</select>
				</div>
			
			</div>
				
			<div class="form-group row" >
			
				<label for="slMinLength" class="col-sm-2 col-form-label">Lenght</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="slMinLength" name="slMinLength" value="8" />
				</div>
			
			</div>
								
        </div>

    </form>
</body>
</html>
