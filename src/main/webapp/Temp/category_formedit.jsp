<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="travel.CategoryDao"%>
<%@ page import="travel.Category"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Category</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">

</head>
<body>
<%
String cat_id=request.getParameter("cat_id");
Category u=CategoryDao.getRecordById(Integer.parseInt(cat_id));

%>
<form method="post" action="category_formeditpro.jsp">
<input class="input-field" type="hidden"  name="cat_id" id="cat_id" value="<%= u.getCat_id()%>">
<table border="0" width="400px" height="200px" align="center" class="tableshadow">
<tr><td colspan="2" class="toptd">Update Category</td></tr>
<tr><td class="lefttxt">Category Name</td><td><input type="text" name="cat_name" required pattern="[a-zA-z _]{3,20}" title"Please Enter Only Characters between 3 to 10 for Category Name" value="<%= u.getCat_name()%>"/></td></tr>
<tr><td>&nbsp;</td><td ><input type="submit" value="SAVE" name="sbmt" /></td></tr>




</table>
</form>

</body>
</html>