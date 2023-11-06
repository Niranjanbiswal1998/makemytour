package travel;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import travel.DBConnection;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.sql.*;

@WebServlet("/EnquiryProcess")
public class EnquiryProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EnquiryProcess() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		
		int fk_pack_id=Integer.parseInt(request.getParameter("pack_id"));
		String name=request.getParameter("txtName");
		String gender=request.getParameter("gender");
		String mobile=request.getParameter("textMobile");
		String email=request.getParameter("textEmail");
		int days=Integer.parseInt(request.getParameter("textDays"));
		int child=Integer.parseInt(request.getParameter("textChild"));
		int adult=Integer.parseInt(request.getParameter("textAdult"));
		String message=request.getParameter("textMsg");
		String status="pending";
		//String status=request.getParameter("status");
		Connection con=new DBConnection().Connect();
		String sql="insert into tbl_enquiry(fk_pack_id,name,gender,mobile,email,days,child,adult,message,status) values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1,fk_pack_id);
		ps.setString(2,name);
		ps.setString(3,gender);
		ps.setString(4, mobile);
		ps.setString(5, email);
		ps.setInt(6,days);
		ps.setInt(7,child);
		ps.setInt(8,adult);
		ps.setString(9,message);
		ps.setString(10,status);
		int i=ps.executeUpdate();
		
		//String from=request.getParameter("txtFrom");
		String from="jenaharipada@gmail.com";
		String to=email;;
		String subject="Inquiry Recieved Successful";
		//String msg=name;
		String body="<html><body><p >Dear<b style='color:blue'>"+name+"</b>inquiry received successful.</p><br><p>Our team will get touch with you as soon as possible</p><br><p>With regards <b style='color:red'>Make My Tour </b>Team</p></body></html>";
		String password="h7381584856";
	    response.setContentType("text/html");
        PrintWriter out = response.getWriter();
       
		 //Get properties object    
        Properties props = new Properties();    
        props.put("mail.smtp.host", "smtp.gmail.com");    
        props.put("mail.smtp.socketFactory.port", "465");    
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
        props.put("mail.smtp.auth", "true");    
        props.put("mail.smtp.port", "465");   
        //get Session   
         Session session = Session.getDefaultInstance(props,    
         new javax.mail.Authenticator() {    
         protected PasswordAuthentication getPasswordAuthentication() {    
         return new PasswordAuthentication(from,password);  
         }    
        }); 
         
         //compose message    
           
          MimeMessage email_message = new MimeMessage(session);    
          email_message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
          email_message.setSubject(subject);    
          email_message.setContent(body,"text/html");    
          //send message  
          Transport.send(email_message);    
          
        response.setContentType("text/html");
       
        
        //response.sendRedirect("EmailForm.html");
        //out.println("<script type='text/javascript'>alert('message sent successfully')</script>");
          
        
		
		if(i>0){
			   //<jsp:include page="adm-user-view.jsp"></jsp:include>
		//response.sendRedirect("category_view.jsp");
		System.out.print("<script>alert('Inquiry Send Successfuly')</script>");
		response.sendRedirect("category.jsp");
		}else
			   System.out.println("Failed ");
		//response.sendRedirect("adm-user-error.jsp");
		}
		catch(Exception e){e.printStackTrace();}
	}

}
