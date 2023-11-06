<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="travel.UserDao"%>
<%@ page import="travel.User"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add user</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
<%
String uid=request.getParameter("id");
User u=UserDao.getRecordById(Integer.parseInt(uid));
System.out.print("Hari"+uid);
%>
<form method="post" action="user_formeditpro.jsp">
<input class="input-field" type="hidden" placeholder="Id" name="id" id="id" value="<%= u.getId()%>">
<table border="0" width="400px" height="300px" align="center" class="tableshadow">
<tr><td colspan="2" class="toptd">Update User</td></tr>
<tr><td class="lefttxt">User Name</td><td><input type="text" name="username" required pattern="[a-zA-z1 _]{3,50}" title"Please Enter Only Characters and numbers between 3 to 50 for User name"  value="<%= u.getUsername()%>"/></td></tr>
<tr><td class="lefttxt">Password</td><td><input type="password" name="password" required pattern="[a-zA-z0-9]{1,10}" title"Please Enter Only Characters and numbers between 1 to 10 for Company name" value="<%= u.getPassword()%>"/></td></tr>
<tr><td class="lefttxt">Confirm Password</td><td><input type="password" name="password" required pattern="[a-zA-z0-9]{1,10}" title"Please Enter Only Characters and numbers between 1 to 10 for Company name" value="<%= u.getPassword()%>"/></td></tr>
<tr><td class="lefttxt">Type of User</td><td><select name="user_type" required><option value="">Select User</option><option value="Admin">Admin</option><option value="General">General</option></select></td></tr>
<tr><td>&nbsp;</td><td ><input type="submit" value="SAVE" name="sbmt" /></td></tr>




</table>
</form>
</body>
</html>