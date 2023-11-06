package travel;  
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
import travel.User; 
import travel.DBConnection;
public class UserDao {  
  

public static int save(User u){  
    int status=0;  
    try{  
    	 Connection con= new DBConnection().Connect();
        PreparedStatement ps=con.prepareStatement(  
"insert into tbl_users(	Username,Pwd,Typeofuser) values(?,?,?)");  
        ps.setString(1,u.getUsername());  
        ps.setString(2,u.getPassword());  
        ps.setString(3,u.getUser_type());  
        
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  
public static int update(User u){  
    int status=0;  
    try{  
    	 Connection con= new DBConnection().Connect();
        PreparedStatement ps=con.prepareStatement(  
"update tbl_users set Username=?,Pwd=?,Typeofuser=? where id=?"); 
        System.out.println(u.getUsername());
        System.out.println(u.getPassword());
        System.out.println(ps);
        ps.setString(1,u.getUsername());  
        ps.setString(2,u.getPassword());  
        ps.setString(3,u.getUser_type());  
        ps.setInt(4,u.getId());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  
public static int delete(User u){  
    int status=0;  
    try{  
    	 Connection con= new DBConnection().Connect(); 
        PreparedStatement ps=con.prepareStatement("delete from tbl_users where id=?");  
        ps.setInt(1,u.getId());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
  
    return status;  
}  
public static List<User> getAllRecords(){  
    List<User> list=new ArrayList<User>();  
      
    try{  
    	 Connection con= new DBConnection().Connect(); 
        PreparedStatement ps=con.prepareStatement("select * from tbl_users");  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            User u=new User();  
            u.setId(rs.getInt("id"));  
            u.setUsername(rs.getString("Username"));  
            u.setPassword(rs.getString("Pwd"));  
            u.setUser_type(rs.getString("Typeofuser"));  
            list.add(u);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;  
}  
public static User getRecordById(int id){  
    User u=null;  
    try{  
    	 Connection con= new DBConnection().Connect(); 
        PreparedStatement ps=con.prepareStatement("select * from tbl_users where id=?");  
        ps.setInt(1,id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            u=new User();  
            u.setId(rs.getInt("id"));  
            u.setUsername(rs.getString("Username"));  
            u.setPassword(rs.getString("Pwd"));  
            u.setUser_type(rs.getString("Typeofuser"));   
        }  
    }catch(Exception e){System.out.println(e);}  
    return u;  
}  
}  