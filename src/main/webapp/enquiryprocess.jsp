<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*,java.util.*,javax.mail.*,javax.mail.internet.*" %>
<%@ page import="travel.DBConnection,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
try{
int fk_pack_id=Integer.parseInt(request.getParameter("inq_pack_id"));
String ref_id=String.valueOf((new java.util.Date()).getTime());
String name=request.getParameter("txtFullName");
//String gender=request.getParameter("gender");
String mobile=request.getParameter("txtMobileNumber");
String email=request.getParameter("txtEmailID");
String doj=request.getParameter("textDoj");
String city=request.getParameter("txtCityName");
int days=Integer.parseInt(request.getParameter("txtDuration"));
//int days=Integer.parseInt(request.getParameter("textDays"));textDoj
//int child=Integer.parseInt(request.getParameter("textChild"));
//int adult=Integer.parseInt(request.getParameter("textAdult"));
String message=request.getParameter("txtMessage");
String status="pending";
//String status=request.getParameter("status");
Connection con=new DBConnection().Connect();
String sql="insert into tbl_enquiry(fk_pack_id,ref_id,name,mobile,email,doj,city,duration,message,status) values(?,?,?,?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1,fk_pack_id);
ps.setString(2,ref_id);
ps.setString(3,name);
ps.setString(4, mobile);
ps.setString(5, email);
ps.setString(6,doj);
ps.setString(7,city);
ps.setInt(8,days);
ps.setString(9,message);
ps.setString(10,status);
int i=ps.executeUpdate();
if(i>0){
	String from=DBConnection.Email();
	
		String to=email;
		String subject="Inquiry Received Successful";
		String msg="Inquiry Received Successfully";
		String s1=" <html><body><div style='width:300px;width:370px;border:3px solid green;align:center;background-color:#dfdee3;'><table ><p style='background-color:cyan;text-align:center;color:red;'>Make My Tour</p><p>Hi  <b>"+name +"</b>your inquiry received successfully.<br> Details given below.</p><p><b>Make My Tour </b>never share confidential data to other.</p><p>Please keep this reference id for future.</p><tr ></tr><tr><td>Your Name:"+name+"</td><td></td></tr><tr><td>Reference Id:"+ref_id+"</td><td> </td></tr><table><p><b>Note:</b>Never share this user name and password with anyone otherwise it will create problem.</p><p style='background-color:pink;text-align:center'><a href='www.opentechz.com'>www.makemytour.com</a></p></div></body></html>";
		String body=s1;
		String password=DBConnection.Email_Pass();
	     //response.setContentType("text/html");
      //PrintWriter out = response.getWriter();
    
		 //Get properties object    
     Properties props = new Properties();    
     props.put("mail.smtp.host", "smtp.gmail.com");    
     props.put("mail.smtp.socketFactory.port", "465");    
     props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
     props.put("mail.smtp.auth", "true");    
     props.put("mail.smtp.port", "465");   
     //get Session  
     // Session mailSession = Session.getDefaultInstance(props,
      Session mailSession = Session.getInstance(props,    
      new javax.mail.Authenticator() {    
      protected PasswordAuthentication getPasswordAuthentication() {    
      return new PasswordAuthentication(from,password);  
      }    
     }); 
     
      MimeMessage mime_message = new MimeMessage(mailSession);    
       mime_message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
       mime_message.setSubject(subject);    
       mime_message.setContent(body,"text/html");    
       //send message  
       Transport.send(mime_message);    
       
     
	
}else
	   System.out.println("Failed ");
//response.sendRedirect("adm-user-error.jsp");
}
catch(Exception e){e.printStackTrace();}
%>
</body>
</html>