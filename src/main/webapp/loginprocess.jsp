<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,travel.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String un;
String psd;
//String s1=request.getParameter("username");
//session.setAttribute("username",s1);
//String s2=request.getParameter("password");
int k=0;
try{
	un=request.getParameter("user");
	psd=request.getParameter("password");
	//Select user_type from tbl_login where user_name = 'admin' and password = 'admin'
	 Connection con=new DBConnection().Connect();
PreparedStatement ps=con.prepareStatement("select * from tbl_users where Username=? and Pwd=? ");
ps.setString(1, un);
ps.setString(2, psd);
ResultSet rs=ps.executeQuery();
//retrive the record
 if(rs.next())
 {
	 String type=rs.getString("Typeofuser"); 
	 int id=rs.getInt("id");
	 String password=rs.getString("Pwd");
	 
	 //int fk_ac_id=rs.getInt("fk_ac_id");
	 if("Admin".equals(type)) 
	 { 
		 /* set timelimit for session  */
		 session = request.getSession(true); 
		 session.setAttribute("user", un);
		 session.setAttribute("id", id);
		 session.setAttribute("password", password);
		 String s1=(String) session.getAttribute("user");
		 System.out.println("string user1"+s1);
		 session.setMaxInactiveInterval(1200); 
	     response.sendRedirect("index.html"); 
	 }


 }
 else{
     RequestDispatcher rd=request.getRequestDispatcher("login.html");  
	  rd.include(request, response);
	%>
	<script type="text/javascript">
	alert("Password Or Username incorrect");
	</script>
	<% 		
    }
con.close();
}
catch(Exception e){
	out.println(e);
}

%>
</body>
</html>