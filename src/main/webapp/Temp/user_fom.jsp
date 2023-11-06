<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add user</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
<form method="post" action="user_formpro.jsp">
<table border="0" width="400px" height="300px"  align="center" class="tableshadow" style="padding-top:20px;">
<tr><td colspan="2" class="toptd">Add User</td></tr>
<tr><td class="lefttxt">User Name</td><td><input type="text" name="username" required pattern="[a-zA-z1 _]{3,50}" title"Please Enter Only Characters and numbers between 3 to 50 for User name" /></td></tr>
<tr><td class="lefttxt">Password</td><td><input type="password" name="password" required pattern="[a-zA-z0-9]{1,10}" title"Please Enter Only Characters and numbers between 1 to 10 for Company name"/></td></tr>
<tr><td class="lefttxt">Confirm Password</td><td><input type="password" name="password" required pattern="[a-zA-z0-9]{1,10}" title"Please Enter Only Characters and numbers between 1 to 10 for Company name"/></td></tr>
<tr><td class="lefttxt">Type of User</td><td><select name="user_type" required><option value="">Select User</option><option value="Admin">Admin</option><option value="General">General</option></select></td></tr>
<tr><td>&nbsp;</td><td ><input type="submit" value="SAVE" name="sbmt" /></td></tr>




</table>
</form>
</body>
</html>