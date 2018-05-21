<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Request Main Page</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
<script>
function autoResizeDiv()
{
    document.getElementById('main').style.height = window.innerHeight +'px';
}
window.onresize = autoResizeDiv;
autoResizeDiv();


</script>
<style>

ul
{
list-style-type:none;
margin:0;
padding:0;

}
li
{
float:left;
}
a:link,a:visited
{
display:block;
width:220px;
font-weight:bold;
color:#FFFFFF;
background-color:#98bf21;
text-align:center;
padding:4px;
text-decoration:none;
text-transform:sentence;
}
a:hover,a:active
{
background-color:#7A991A;
}
a
{
display:block;
width:60px;
}
body
{
background-color:#a1bad1;;
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


<body style="overflow:hidden; margin:0">
<div id="watermark">
<img  src='Coll_Logo.png' class='center' alt='My image' />
</div>
<hr>
<h1> Test Request System</h1>

<div id = "buttonmenu">
<ul> 
<li><a href="paramPage_DB.jsp">Submit Parametric</a></li>
<li> </li>
<li><a href="funcPage_DB.jsp" target=_blank>Submit Functional</a></li>
<li> </li>
<li> </li>
<li><a href="assign_page_p_db.jsp">Parametric Status/Assignee update</a></li>
<li> </li>
<li><a href="assign_page_f_db.jsp">Functional Status/Assignee update</a></li>
<li> </li>
<li> </li>
<li><a href="reportPage_param.jsp"> Parametric Report List</a></li>
<li> </li>
<li><a href="reportPage_func.jsp"> Functional Report List</a></li>
<li> </li>
<li> </li>
</ul>
</div>


</body>
</html>
</body>
</html>