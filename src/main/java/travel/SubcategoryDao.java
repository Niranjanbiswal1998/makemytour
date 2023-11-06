package travel;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;

public class SubcategoryDao {

	
	  public static int save(Subcategory u){
	  int status=0; 
	  try{
	  Connection con= new DBConnection().Connect(); PreparedStatement
	  ps=con.prepareStatement("insert into tbl_subcategory(fk_cat_id,subcat_name,subcat_pic,subcat_details) values(?,?,?,?)");
	  ps.setInt(1, u.getFk_cat_id());
	  ps.setString(2,u.getSubcat_name());
	  ps.setString(3,u.getSubcat_pic());
	  //ps.setBlob(3,(Blob)u.getSubcat_pic());
	  ps.setString(4,u.getSubcat_details()); 
	  status=ps.executeUpdate();
	  }catch(Exception e){System.out.println(e);}
	  
	  return status; 
	  
	  }
	 
public static int update(Subcategory u){  
    int status=0;  
    try{  
    	Connection con= new DBConnection().Connect();
        PreparedStatement ps=con.prepareStatement(  
"update tbl_subcategory set fk_cat_id=?,subcat_pic=?,subcat_details=? where subcat_id=?"); 
        //System.out.println(u.);
        
        ps.setInt(1,u.getFk_cat_id()); 
        ps.setString(2,u.getSubcat_pic());
        ps.setString(3,u.getSubcat_details());
        ps.setInt(4,u.getSubcat_id());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  
public static int delete(Subcategory u){  
    int status=0;  
    try{  
    	Connection con= new DBConnection().Connect(); 
        PreparedStatement ps=con.prepareStatement("delete from tbl_subcategory where id=?");  
        ps.setInt(1,u.getSubcat_id());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
  
    return status;  
}  
public static List<Subcategory> getAllRecords(){  
    List<Subcategory>list=new ArrayList<Subcategory>();  
      
    try{  
    	Connection con= new DBConnection().Connect(); 
        PreparedStatement ps=con.prepareStatement("select * from tbl_subcategory");  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            Subcategory u=new Subcategory();  
            u.setSubcat_id(rs.getInt("subcat_id"));
            u.setFk_cat_id(rs.getInt("fk_cat_id"));
            u.setSubcat_name(rs.getString("subcat_name"));
            String pic =rs.getString("subcat_pic");
            //SubcatImages/
  		  pic=pic.substring(pic.lastIndexOf("/")-12);
            System.out.println(pic);
            u.setSubcat_pic(pic); 
            u.setSubcat_details(rs.getString("subcat_details")); 
            list.add(u);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;  
}  
public static Subcategory getRecordById(int subcat_id){  
	Subcategory u=null;  
    try{  
    	Connection con= new DBConnection().Connect();  
        PreparedStatement ps=con.prepareStatement("select * from tbl_subcategory where subcat_id=?");  
        ps.setInt(1,subcat_id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            u=new Subcategory();  
            u.setSubcat_id(rs.getInt("subcat_id"));  
            u.setFk_cat_id(rs.getInt("fk_cat_id"));
            u.setSubcat_name(rs.getString("subcat_name"));  
            u.setSubcat_pic(rs.getString("subcat_pic")); 
            u.setSubcat_details(rs.getString("subcat_details")); 
          }      
}
    catch(Exception e){System.out.println(e);}  
    return u;  

}
}
