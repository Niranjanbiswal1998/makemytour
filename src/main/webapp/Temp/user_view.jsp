<!DOCTYPE html>  
  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>View Users</title>  
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
</head>  
<body>    
<%@page import="travel.UserDao,travel.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  
<%  
List<User> list=UserDao.getAllRecords();  
request.setAttribute("list",list);  
%>  
  
<!-- <br/><a href="adduserform.jsp">Add New User</a>   -->
 
 
 
 
<table border="0" width="90%" height="300px" align="center" class="tableshadow" style="padding-top:0px;">
<tr><td class="toptd">View Users</td></tr>
<tr><td align="center" valign="top" >
<table border="0" align="center" width="95%" >
<tr><td style="font-size:15px; padding:5px; font-weight:bold;">ID</td>
<td style="font-size:15px; padding:5px; font-weight:bold;">User Name</td>
<td style="font-size:15px; padding:5px; font-weight:bold;">Password</td>
<td style="font-size:15px; padding:5px; font-weight:bold;">User Type</td>
<td style="font-size:15px; padding:5px; font-weight:bold;">Edit</td>
<td style="font-size:15px; padding:5px; font-weight:bold;">Delete</td>
<c:forEach items="${list}" var="u">  
<tr><td>${u.getId()}</td><td>${u.getUsername()}</td><td>${u.getPassword()}</td><td>${u.getUser_type()}</td>   
<td><a href="user_formedit.jsp?id=${u.getId()}">Edit</a></td>  
<td><a href="user_delete.jsp?id=${u.getId()}">Delete</a></td></tr>  
</c:forEach>  

</table>
</td></tr></table> 
</body>  
</html>  
