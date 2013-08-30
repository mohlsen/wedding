// JavaScript Document
<script language="JavaScript">
<!--

function formCheck(formobj){
	//1) Enter name of mandatory fields
	var fieldRequired = Array("FirstName", "LastName", "attending");
	//2) Enter field description to appear in the dialog box
	var fieldDescription = Array("First Name", "Last Name", "People Attending");
	//3) Enter dialog message
	var alertMsg = "Please complete the following fields:\n";
	
	var l_Msg = alertMsg.length;
	alert(alertMsg);
	for (var i = 0; i < fieldRequired.length; i++){
		var obj = formobj.elements[fieldRequired[i]];
		if (obj){
			//alert(obj.type);
			switch(obj.type){
			case "select-one":
				if (obj.selectedIndex == -1 || obj.options[obj.selectedIndex].text == ""){
					alertMsg += " - " + fieldDescription[i] + "\n";
				}
				break;

			case "select":
				//if (obj.options[obj.selectedIndex].text == ""){
					//alertMsg += " - " + fieldDescription[i] + "\n";
				//}
				break;
			case "text":
			case "textarea":
				if (obj.value == "" || obj.value == null){
					alertMsg += " - " + fieldDescription[i] + "\n";
				}
				break;
			default:
				if (obj.value == "" || obj.value == null){
					alertMsg += " - " + fieldDescription[i] + "\n";
				}
			}
		}
	}

	if (alertMsg.length == l_Msg){
		//if ((formobj.elements["ReceiveMail"].value == "yes")) //& ((formobj.elements["email"] == "") || (formobj.elements["email"] == null))){
			//alert("If you would like to receive information about the wedding, you must enter your email address.");
			//return false;
		//}
	//alert("hello");
		//return true;
				return false;
	}else{
		alert(alertMsg);
		return false;
	}
		//alert("hello");
		//return true;
				return false;
}
//-->
</script>