<script type = "text/javascript">

// Note: Like all Javascript password scripts, this is hopelessly insecure as the user can see 
//the valid usernames/passwords and the redirect url simply with View Source.  
// And the user can obtain another three tries simply by refreshing the page.  
//So do not use for anything serious!

var count = 2;
function validate() {
var un = document.myform.username.value;
var pw = document.myform.pword.value;
var valid = false;

//var unArray = ["vneeli", "sbharadw", "abc", "def"];  // as many as you like - no comma after final entry
//var pwArray = ["vneeli", "sbharadw", "abc", "def"];  // the corresponding passwords;


var unArray = ["adminp", "adminf"];  // as many as you like - no comma after final entry
var pwArray = ["admin123", "admin123"];  // the corresponding passwords;

for (var i=0; i <unArray.length; i++) {
if ((un == unArray[i]) && (pw == pwArray[i])) {
valid = true;
break;
}
}

if (valid) {
	if ( un == "adminf") {
       alert ("Login was successful --" + un);
       window.location = "assign_page_f_db.jsp";
}
	if ( un == "adminp") {
	       alert ("Login was successful --" + un);
	       window.location = "assign_page_p_db.jsp";
	}

return false;
}

var t = " tries";
if (count == 1) {t = " try"}

if (count >= 1) {
alert ("Invalid username and/or password.  You have " + count + t + " left.");
document.myform.username.value = "";
document.myform.pword.value = "";
setTimeout("document.myform.username.focus()", 25);
setTimeout("document.myform.username.select()", 25);
count --;
}

else {
alert ("Still incorrect! You have no more tries left!");
document.myform.username.value = "No more tries allowed!";
document.myform.pword.value = "";
document.myform.username.disabled = true;
document.myform.pword.disabled = true;
return false;
}

}

</script>
<p><h2>Test reqeuest System - Login page</h2> <hr><br>
<form name = "myform">
<p>ENTER USER NAME <input type="text" name="username"><br><br> ENTER PASSWORD <input type="password" name="pword"> <br> <br>
<input type="button" value="Check In" name="Submit" onclick= "validate()">
</p>

</form>