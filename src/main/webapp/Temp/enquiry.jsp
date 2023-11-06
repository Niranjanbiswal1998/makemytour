<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="travel.DBConnection,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
<div style="height:50px"></div>
<div style="width:1000px; margin:auto"  >

<div style="width:200px; font-size:18px; color:#09F; float:left">

<table cellpadding="0" cellspacing="0" width="1000px">
<tr><td style="font-family:Lucida Calligraphy; font-size:20px; color:#09F;font-weight:bold">Category</td></tr>
<%
Connection con=new DBConnection().Connect();
PreparedStatement ps=con.prepareStatement("select * from tbl_category");
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<tr><td style="padding:7px;font-weight:bold"><a href="subcategory.jsp?cat_id=<% out.print(rs.getInt(1)); %>" style="text-decoration:none"><% out.print(rs.getString(2)); %></a></td></tr>
<%
}
%>
</table>

</div>

<div style="width:800px; float:left">
<table cellpadding="0px" cellspacing="0" width="1000px">
<tr><td class="headingText">Enquiry</td></tr>
<tr><td class="paraText" width="900px">
<table cellpadding="0" cellspacing="0" width="900px">
<td>

<%
//int pack_id=Integer.parseInt(request.getParameter("pack_id"));
int pack_id=1;
Connection con1=new DBConnection().Connect();
PreparedStatement ps1=con1.prepareStatement("select * from tbl_package where pack_id="+pack_id+"");
ResultSet rs1=ps1.executeQuery();
while(rs1.next()){
%>
<table border="0"; width="600px" height="400px" align="center" >
<tr><td colspan="3" class="middletext">Package Id:&nbsp;&nbsp;&nbsp;<%out.print(rs1.getInt(1)); %></td></tr>
<tr><td colspan="3" class="middletext">Pack Name:&nbsp;&nbsp;&nbsp;<%out.print(rs1.getString(4));; %></td></tr>
<form  action="EnquiryProcess" method="post">
<input type="hidden" name="pack_id" value="<%out.print(rs1.getInt(1));%>">
<tr><td class="lefttxt">Name:</td><td><input type="text" name="txtName" required pattern="[a-zA-z1 _]{3,50}" title"Please Enter Only Characters and numbers between 1 to 50 for Name"/></td></tr><br/>
<tr><td class="lefttxt">Gender:</td><td><input type="radio" name="gender" value="Male" checked="checked" />Male<input type="radio" name="gender"  value="Female"/>Female</td></tr><br/>
<tr><td class="lefttxt">Mobile No.</td><td><input type="text" name="textMobile" required pattern="[0-9]{10,12}" title"Please Enter Only numbers between 10 to 12 for Mobile No"/></td></tr><br/>
<tr><td class="lefttxt">Email:</td><td><input type="email" name="textEmail" required /></td><td><br/>
<tr><td class="lefttxt">No.of Days:</td><td><input type="number" name="textDays" required pattern="[1 _]{1,20}" title"Please Enter Only numbers between 1 to 20 for No. oF Days"/></td><td><br/>
<tr><td class="lefttxt">No.of Children:</td><td><input type="number" name="textChild" required pattern="[1 _]{1,10}" title"Please Enter Only numbers between 1 to 10 for Children"/></td><td><br/>
<tr><td class="lefttxt">No.of Adults:</td><td><input type="number" name="textAdult" required pattern="[1 _]{1,20}" title"Please Enter Only numbers between 1 to 20 for No.Of Adults"/></td><td><br/>
<tr><td class="lefttxt">Enquiry Message:</td><td><textarea name="textMsg" required="required"/></textarea></td><td><br/>
<tr><td>&nbsp;</td><td ><input type="submit" value="Submit" name="sbmt" class="btn btn-primary"/></td></tr>

</form></td></tr>
<%} %>
</table>
</td>
</table>
</td></tr>
</table>

</div>

</div>

<div style="clear:both"></div>
</body>
</html>