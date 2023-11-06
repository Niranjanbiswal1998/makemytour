<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="travel.DBConnection,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int enq_id=Integer.parseInt(request.getParameter("enq_id"));
Connection con=new DBConnection().Connect();
PreparedStatement ps=con.prepareStatement("update tbl_enquiry set status='Confirmed' where enq_id="+enq_id+" ");
int i=ps.executeUpdate();
if(i>0){
	response.sendRedirect("viewinquiry.jsp");
}


 %>
</body>
</html>