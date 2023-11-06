package travel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import travel.Category;
import travel.DBConnection;

public class CategoryDao {
	
	public static int save(Category u){  
	    int status=0;  
	    try{  
	        Connection con= new DBConnection().Connect();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into tbl_category(cat_name,cat_img_path) values(?,?)");  
	        ps.setString(1,u.getCat_name());
	        ps.setString(2,u.getCat_img_path());
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	public static int update(Category u){  
	    int status=0;  
	    try{  
	    	Connection con= new DBConnection().Connect();
	        PreparedStatement ps=con.prepareStatement(  
	"update tbl_category set cat_name=?,cat_img_path=? where cat_id=?"); 
	        System.out.println(u.getCat_name());
	        
	        ps.setString(1,u.getCat_name());
	        ps.setString(2,u.getCat_img_path());
	        ps.setInt(3,u.getCat_id());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	public static int delete(Category u){  
	    int status=0;  
	    try{  
	    	Connection con= new DBConnection().Connect(); 
	        PreparedStatement ps=con.prepareStatement("delete from tbl_category where id=?");  
	        ps.setInt(1,u.getCat_id());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  
	public static List<Category> getAllRecords(){  
	    List<Category> list=new ArrayList<Category>();  
	      
	    try{  
	    	Connection con= new DBConnection().Connect(); 
	        PreparedStatement ps=con.prepareStatement("select * from tbl_category");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            Category u=new Category();  
	            u.setCat_id(rs.getInt("cat_id"));  
	            u.setCat_name(rs.getString("cat_name")); 
	            String pic1=rs.getString("cat_img_path");
	            pic1=pic1.substring(pic1.lastIndexOf("/")-14);
	            System.out.println(pic1);
	            u.setCat_img_path(pic1);
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	public static Category getRecordById(int cat_id){  
		Category u=null;  
	    try{  
	    	Connection con= new DBConnection().Connect();  
	        PreparedStatement ps=con.prepareStatement("select * from tbl_category where cat_id=?");  
	        ps.setInt(1,cat_id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new Category();  
	            u.setCat_id(rs.getInt("cat_id"));  
	            u.setCat_name(rs.getString("cat_name"));
	            u.setCat_img_path(rs.getString("cat_img_path"));
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  
}
