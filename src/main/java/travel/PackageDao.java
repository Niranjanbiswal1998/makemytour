package travel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PackageDao {

	public static int save(Package u){  
	    int status=0;  
	    try{  
	        Connection con= new DBConnection().Connect();  
	        PreparedStatement ps=con.prepareStatement("insert into tbl_package(fk_cat_id,fk_subcat_id,pack_name,pack_price,pic1Path,pic2Path,pic3Path,pack_details,status) values(?,?,?,?,?,?,?,?,?)");  
	        ps.setInt(1,u.getFk_cat_id());
	        ps.setInt(2,u.getFk_subcat_id());
	        ps.setString(3,u.getPack_name());
	        ps.setFloat(4,u.getPack_price());
	        ps.setString(5,u.getPic1Path());  
	        ps.setString(6,u.getPic2Path());  
	        ps.setString(7,u.getPic3Path());
	        ps.setString(8,u.getPack_details());
	        ps.setBoolean(9,true);
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	public static int update(Package  u){  
	    int status=0;  
	    try{  
	    	Connection con= new DBConnection().Connect();
	    	String sql="update tbl_package set fk_cat_id=?,fk_subcat_id=?,pack_name=?,pack_price=?,pic1Path=?,pic2Path=?,pic3Path=?,pack_details=?,status=? where pack_id=?";
	        PreparedStatement ps=con.prepareStatement(sql); 
	        ps.setInt(1,u.getFk_cat_id());
	        ps.setInt(2,u.getFk_subcat_id());
	        ps.setString(3,u.getPack_name());
	        ps.setFloat(4,u.getPack_price());
	        ps.setString(5,u.getPic1Path());  
	        ps.setString(6,u.getPic2Path());  
	        ps.setString(7,u.getPic3Path());
	        ps.setString(8,u.getPack_details());
	        ps.setBoolean(9,true);
	        ps.setInt(10,u.getPack_id());
	        status=ps.executeUpdate();  
	        //System.out.print(u);
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	public static int delete(Package u){  
	    int status=0;  
	    try{  
	    	Connection con= new DBConnection().Connect(); 
	        PreparedStatement ps=con.prepareStatement("delete from tbl_package where pack_id=?");  
	        ps.setInt(1,u.getPack_id());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  
	public static List<Package> getAllRecords(){  
	    List<Package>list= new ArrayList<Package >();  
	      
	    try{  
	    	Connection con= new DBConnection().Connect(); 
	        PreparedStatement ps=con.prepareStatement("SELECT p.pack_id,p.fk_cat_id,p.fk_subcat_id,c.cat_name,s.subcat_name ,p.pack_name,p.pack_price,p.pic1Path,p.pic2Path,p.pic3Path,p.pack_details,p.status from tbl_package p INNER JOIN tbl_category c INNER JOIN tbl_subcategory s on p.fk_cat_id=c.cat_id and p.fk_subcat_id=s.subcat_id;");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	Package  u = new Package();
	        	u.setPack_id(rs.getInt("pack_id"));
	            u.setFk_cat_id(rs.getInt("fk_cat_id"));  
	            u.setFk_subcat_id(rs.getInt("fk_subcat_id"));
	            u.setCat(rs.getString("cat_name"));
	            u.setSubcat(rs.getString("subcat_name"));
	            u.setPack_name(rs.getString("pack_name"));
	            u.setPack_price(rs.getFloat("pack_price"));
	            
	            String pic1=rs.getString("pic1Path");
	            pic1=pic1.substring(pic1.lastIndexOf("/")-13);
	            System.out.println(pic1);
	            String pic2=rs.getString("pic2Path");
	            pic2=pic2.substring(pic2.lastIndexOf("/")-13);
	            String pic3=rs.getString("pic3Path");
	            pic3=pic3.substring(pic3.lastIndexOf("/")-13);
	            
	            u.setPic1Path(pic1);
	            u.setPic2Path(pic2);
	            u.setPic3Path(pic3);
	            u.setPack_details(rs.getString("pack_details"));
	            u.setStatus(rs.getBoolean("status"));
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	public static Package  getRecordById(int pack_id){  
		Package  u=null;  
	    try{  
	    	Connection con= new DBConnection().Connect();  
	        PreparedStatement ps=con.prepareStatement("select * from tbl_package where pack_id=?");  
	        ps.setInt(1,pack_id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new Package(); 
	            u.setPack_id(rs.getInt("pack_id"));
	            u.setFk_cat_id(rs.getInt("fk_cat_id"));  
	            u.setFk_subcat_id(rs.getInt("fk_subcat_id"));   
	            u.setPack_name(rs.getString("pack_name"));
	            u.setPack_price(rs.getFloat("pack_price"));
	            u.setPic1Path(rs.getString("pic1Path"));
	            u.setPic2Path(rs.getString("pic2Path"));
	            u.setPic3Path(rs.getString("pic3Path"));
	            u.setPack_details(rs.getString("pack_details"));
	            u.setStatus(rs.getBoolean("status"));    
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  
	
	
}
