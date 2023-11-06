<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="travel.DBConnection,java.sql.*" %>
<%@ page import="java.sql.*,java.io.*,java.util.*,javax.mail.*,javax.mail.internet.*" %>
<%
int fk_pack_id=Integer.parseInt(request.getParameter("packid"));
String travel_date=request.getParameter("travel_date");
String cust_name=request.getParameter("cust_name");
String mobile=request.getParameter("mobile");
String alt_mobile=request.getParameter("alt_mobile");
String email=request.getParameter("email");
String address=request.getParameter("address");
String check_in="";
String check_out="";
String room_type="";
int room_no=Integer.parseInt(request.getParameter("room"));
int adult_no=Integer.parseInt(request.getParameter("adult"));
int children_no=Integer.parseInt(request.getParameter("child"));
float grand_total_price=Float.parseFloat(request.getParameter("grandtotal"));
String booking_date=String.valueOf((new java.util.Date()));
String status="Confirmed";
int status2=0; 
try{ 
	
    Connection con= new DBConnection().Connect();  
    PreparedStatement ps=con.prepareStatement(  
"insert into tbl_booking(fk_pack_id,travel_date,cust_name,mobile,email,address,check_in,check_out,room_type,room_no,adult_no,children_no,grand_total_price,booking_date,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
    ps.setInt(1,fk_pack_id);
    ps.setString(2,travel_date);
    ps.setString(3,cust_name);
    ps.setString(4,mobile);
    ps.setString(5,email);
    ps.setString(6,address);
    ps.setString(7,check_in);
    ps.setString(8,check_out);
    ps.setString(9,room_type);
    ps.setInt(10,room_no);
    ps.setInt(11,adult_no);
    ps.setInt(12,children_no);
    ps.setFloat(13,grand_total_price);
    ps.setString(14,booking_date);
    ps.setString(15,status);
    status2=ps.executeUpdate();
    
    if(status2>0){
    	String from=DBConnection.Email();
		String to=email;
		String subject="Package Booking Successfully done";
		String msg="Package Booking  Successfully";
		String s1=" <html><body><div style='width:300px;width:370px;border:3px solid green;align:center;background-color:#dfdee3;'><table ><p style='background-color:cyan;text-align:center;color:red;'>Make My Tour</p><p>Hi  <b>"+cust_name+"</b>your booking process 1st step is over .<br> Details given below.</p><p><b>Make My Tour </b>never share confidential data to other.</p><p>To do complete booking please go to payment section .</p><tr ></tr><tr><td>Customer Name:"+cust_name+"</td><td></td></tr><tr><td>Booking Date:"+booking_date+"</td><td> </td></tr><table><p><b>Note:</b>Never share this user name and password with anyone otherwise it will create problem.</p><p style='background-color:pink;text-align:center'><a href='www.opentechz.com'>www.makemytour.com</a></p></div></body></html>";
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
       	
}
else
	   System.out.println("Failed ");
//response.sendRedirect("adm-user-error.jsp");
}
catch(Exception e){System.out.println(e);}
%>