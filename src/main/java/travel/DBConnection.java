package travel;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public Connection Connect()
	   {
	        Connection con=null;
	        try
	        {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	        	//String connectionURL = jdbc:mysql://localhost:3306/Peoples?autoReconnect=true&useSSL=false
	    	    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/traveltour?autoReconnect=true&useSSL=false","root","mysql");
	            
	        }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	        }
	        return con;
	    }
	public static String Path() {
		String Path="C:\\Users\\NIRU\\eclipse\\Travel";
		return Path;
	}
	public static String Email() {
		String Email="examplepikun7@gmail.com";
		return Email;
	}
	public static String Email_Pass() {
		String Pass="Pikun@123";
		return Pass;
	}
	
}
