<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="travel.DBConnection,java.sql.*" %>
<%@ page import="java.sql.*,java.io.*,java.util.*,javax.mail.*,javax.mail.internet.*" %>
<%
try{
String trans_id=request.getParameter("trans_id");
String payment_type=request.getParameter("payment_type");
//String payment_type="Debit";
String cardhld_name=request.getParameter("cardhld_name");

String card_no=request.getParameter("card_no");
String ext_crdno=card_no.substring(card_no.length() - 4);
String expiry_date=request.getParameter("expiry_date");
int cvv_no=Integer.parseInt(request.getParameter("cvv_no"));

	int status=0;
	Connection con1 = new DBConnection().Connect();
	String s1 = "SELECT cust_name, email ,MAX(booking_id)  FROM tbl_booking";
	PreparedStatement st = con1.prepareStatement(s1);
	ResultSet r = st.executeQuery();
	int booking_id = 0;
	// System.out.println(r.first());
	r.next();
	booking_id = r.getInt("MAX(booking_id)");
	String email=r.getString("email");
	String cust_name=r.getString("cust_name");
	String status1="Confirmed";
	// System.out.println(uid);
	PreparedStatement ps1 = con1.prepareStatement(
			"insert into tbl_payment(fk_booking_id,trans_id,payment_type,cardhld_name,card_no,expiry_date,cvv_no,status) values(?,?,?,?,?,?,?,?)");
	ps1.setInt(1,booking_id);
	ps1.setString(2,trans_id);
	ps1.setString(3,payment_type);
	ps1.setString(4,cardhld_name);
	ps1.setString(5,card_no);	
	ps1.setString(6,expiry_date);	
	ps1.setInt(7,cvv_no);
	ps1.setString(8,status1);
	status = ps1.executeUpdate();
	if(status>0){
		String from=DBConnection.Email();
		String to=email;
		String subject="Payment Successfully done";
		String msg="Payment  Successfully";
		String temp_body=" <html><body><div style='width:300px;width:370px;border:3px solid green;align:center;background-color:#dfdee3;'><table ><p style='background-color:cyan;text-align:center;color:red;'>Make My Tour</p><p>Hi  <b>"+cust_name+"</b>your booking process 2st step is over i:e payment section .<br> Details given below.</p><p><b>Make My Tour </b>never share confidential data to other.</p><p>Please download confirm ticket by transaction id .</p><tr ></tr><tr><td>Customer Name:"+cust_name+"</td><td></td></tr><tr><td>Transaction Id:"+trans_id+"</td><td></td></tr><tr><td>Card Number:xxxxxxx"+ext_crdno+" </td></tr><table><p><b>Note:</b>Never share this user name and password with anyone otherwise it will create problem.</p><p style='background-color:pink;text-align:center'><a href='www.opentechz.com'>www.makemytour.com</a></p></div></body></html>";
		String body=temp_body;
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
}
catch(Exception e){
	e.printStackTrace();
}
%>