<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Request Main Page</title>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="jquery.fittext.js"></script>
<body>





<style>

body {
font: 100% Verdana, Arial, Helvetica, sans-serif;
background: #666666;
margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
text-align: center; /* this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector */
color: #000000;
}


p { font-size:150%; }

.oneColLiqCtr #cssmenu {
width: 100%; /* this will create a container 80% of the browser width */
background: #FFFFFF;
margin: 0 auto; /* the auto margins (in conjunction with a width) center the page */
border: 1px solid #000000;
text-align: left; /* this overrides the text-align: center on the body element. */
}
.oneColLiqCtr #mainContent {
padding: 0 20px; /* remember that padding is the space inside the div box and margin is the space outside the div box */
}


/* GT stylesheet */
#cssmenu > ul {
	list-style: none;
	margin: 0;
	padding: 0;
	vertical-align: baseline;
	line-height: 1;
}

/* The container */
#cssmenu > ul {
	display: block;
	position: relative;
	width: 150px;
}

	/* The list elements which contain the links */
	#cssmenu > ul li {
		display: block;
		position: relative;
		margin: 0;
		padding: 0;
		width: 150px;	
	}

		/* General link styling */
		#cssmenu > ul li a {
			/* Layout */
			display: block;
			position: relative;
			margin: 0;
			border-top: 1px dotted #3a3a3a;
			border-bottom: 1px dotted #1b1b1b;
			padding: 11px 20px;
			width: 500px;

			/* Typography */
			font-family: Helvetica, Arial, sans-serif;
			color: #d8d8d8;
			text-decoration: none;
			text-transform: uppercase;
			text-shadow: 0 1px 1px #000;
			font-size: 13px;
			font-weight: 300;
			

			/* Background & effects */
			background: #282828;
		}

		/* Rounded corners for the first link of the menu/submenus */
		#cssmenu > ul li:first-child>a {
			border-top-left-radius: 4px;
			border-top-right-radius: 4px;
			border-top: 0;
		}

		/* Rounded corners for the last link of the menu/submenus */
		#cssmenu > ul li:last-child>a {
			border-bottom-left-radius: 4px;
			border-bottom-right-radius: 4px;
			border-bottom: 0;
		}


		/* The hover state of the menu/submenu links */
		#cssmenu > ul li>a:hover, #cssmenu > ul li:hover>a {
			color: #fff;
			text-shadow: 0 1px 0 rgba(0, 0, 0, .3);
			background: #f06343;
			background: -webkit-linear-gradient(bottom, #f06343, #f27d63);
			background: -ms-linear-gradient(bottom, #f06343, #f27d63); 
			background: -moz-linear-gradient(bottom, #f06343, #f27d63);
			background: -o-linear-gradient(bottom, #f06343, #f27d63);
			border-color: transparent;
		}

		/* The arrow indicating a submenu */
		#cssmenu > ul .has-sub>a::after {
			content: '';
			position: absolute;
			top: 16px;
			right: 10px;
			width: 0px;
			height: 0px;

			/* Creating the arrow using borders */
			border: 4px solid transparent;
			border-left: 4px solid #d8d8d8; 
		}

		/* The same arrow, but with a darker color, to create the shadow effect */
		#cssmenu > ul .has-sub>a::before {
			content: '';
			position: absolute;
			top: 17px;
			right: 10px;
			width: 0px;
			height: 0px;

			/* Creating the arrow using borders */
			border: 4px solid transparent;
			border-left: 4px solid #000;
		}

		/* Changing the color of the arrow on hover */
		#cssmenu > ul li>a:hover::after, #cssmenu > ul li:hover>a::after {
			border-left: 4px solid #fff;
		}

		#cssmenu > ul li>a:hover::before, #cssmenu > ul li:hover>a::before {
			border-left: 4px solid rgba(0, 0, 0, .3);
		}

	
		/* THE SUBMENUS */
		#cssmenu > ul ul {
			position: absolute;
			left: 150px;
			top: -9999px;
			padding-left: 5px;
			opacity: 0;
			/* The fade effect, created using an opacity transition */
			-webkit-transition: opacity .3s ease-in;
			-moz-transition: opacity .3s ease-in;
			-o-transition: opacity .3s ease-in;
			-ms-transition: opacity .3s ease-in;
		}

		/* Showing the submenu when the user is hovering the parent link */
		#cssmenu > ul li:hover>ul {
			top: 0px;
			opacity: 1;
		}

#watermark {
  /*background-image: url('watermark.png');*/
  background-color:white;
  repeat: no-repeat;
  opacity: 100;
  position: relative;
  bottom: 0;
  background-size: cover;
}

</style>
</head>

<script>

$( document ).ready( function() {
	
	var password = "admin";
	msg = ""
    var x = prompt("Enter in the password");
	
	if (!(x)){
		window.location='mainPage.jsp';
	} else if (x.toLowerCase() == password) {
      // alert("Come right in \n \n You've entered in the right password");
       $("#main").removeAttr('disabled');
       $('#main').show()
       $("#tt").tablesorter();
   }
else {
	 alert(" You've entered in the wrong password");
	 window.location='mainPage.jsp';
}
	
});
	
jQuery("#responsive_headline").fitText();
jQuery("#responsive_headline").fitText(1.2, { minFontSize: '20px', maxFontSize: '40px' })


</script>

<body class = "oneColLiqCtr" style="overflow:hidden; margin:0">
<div id = "cssmenu">
<div id="watermark">
<img src='Coll_Logo.png' class='center' alt='My image' />
</div>
<hr>


<h1>Test Request System </h1>
<h2>Admin</h2>
<ul>
<li><a href="assign_page_p_db.jsp">Parametric Status/Assignee update </a></li> 
<li><a href="assign_page_f_db.jsp">Functional Status/Assignee update</a></li>
<!--  <li><a href="reportPage_param.jsp"> Parametric Report List</a></li>
<li><a href="reportPage_func.jsp"> Functional Report List</a></li>-->
<li><a href="reportPage_param_2_tabs.jsp"> New Parametric Report &#42;&#42;(new)</a></li>
<li><a href="reportPage_func_2_tabs.jsp"> New Functional Report List &#42;&#42;(new)</a></li>
<li><a href="ParametricReportCount_tabs.jsp"> Statistics &#42;&#42;(new)</a></li>
<li><a href="ParametricReport.jsp"> Parametric Report Filter &#42;&#42;(new)</a></li>
<li><a href="mainPage.jsp">Main Page for Requestor</a></li>
</ul>
</div>


 <h4>Welcome :<%=request.getAttribute("hello") %></h4>
</body>
</html>
