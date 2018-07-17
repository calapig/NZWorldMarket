<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CMCreateManager.aspx.cs" Inherits="NZWorldMarket.CMCreateManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <webopt:bundlereference runat="server" path="~/Content/css" />

    <script src="Scripts/myValidate.js" ></script>
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
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
        <table> 
			<tr>
				<td>
					<span>User</span>
				</td> 
				<td> 
					<asp:TextBox ID="itUserName" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="itUserName" class="alert alert-danger col-sm-6" ErrorMessage="User name required"></asp:RequiredFieldValidator>
                </td>
			</tr>
			<tr>
				<td>
					<span>Password</span>
				</td> 
				<td>
                    <asp:TextBox ID="itUserPassword" runat="server" TextMode="Password" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="itUserPassword" class="alert alert-danger col-sm-6" ErrorMessage="Password required"></asp:RequiredFieldValidator>
                    <div id="dvMessage" class="alert alert-danger col-sm-6" role="alert">
					
				    </div>
                </td>
			</tr>
			<tr>
				<td colspan="2" >
					<asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" OnClientClick="return ValidateExtraRules();" />
				</td>
			</tr>
        </table>

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
