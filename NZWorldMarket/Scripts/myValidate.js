// Build a regular expression from the different variables to validate a Password
// to contain at least oner of the following options: 1 upperCase, 1 lowcase, 
// 1 special character, 1 number and a specific minimun length
function validatePassword(uppCase, lowCase, specialChar, number, minLength)
{
	/*
	/^ (?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$ /g
	*/
	
	var pattern = "";
	
	
	if (uppCase === "true")
	{
		pattern += "(?=.*[A-Z])";
	}
	
	if (lowCase === "true")
	{
		pattern += "(?=.*[a-z])";
	}
	
	if (specialChar === "true")
	{
		pattern += "(?=.*[^\da-zA-Z])";
	}
	
	if (number === "true")
	{
		pattern += "(?=.*\d)";
	}
	
	if (minLength != "0" || minLength != "")
	{
		pattern += ".{" + minLength + ",15}";
	}

	return pattern;
}

function passwordValidationMsg(uppCase, lowCase, specialChar, number, minLength)
{
	/*
	/^ (?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$ /g
	*/
	
	var pattern = "The password that you provide must contain at least ";
	
	
	if (uppCase === "true")
	{
		pattern += " 1 uppercase letter";
	}
	
	if (lowCase === "true")
	{
		pattern += " 1 lowercase letter";
	}
	
	if (specialChar === "true")
	{
		pattern += " 1 special character";
	}
	
	if (number === "true")
	{
		pattern += " 1 number";
	}
	
	if (minLength != "0" || minLength != "")
	{
		pattern += " minimun " + minLength + " characters";
	}

	return pattern;
}

function ValidateExtraRules() {
    console.log('Hola');
    if ($("#dvMessage").html().trim() != '')
        return false;
    console.log('bye');
    return true;
}