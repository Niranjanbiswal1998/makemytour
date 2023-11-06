package travel;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.*;
import java.util.*;
import java.util.Date;
import travel.Category;
import travel.CategoryDao;

import org.apache.commons.io.IOUtils;

//import sun.security.util.IOUtils;

import java.sql.*;
import java.io.InputStream;

/**
 * Servlet implementation class SubCategoryProcess
 */
@WebServlet("/SubCategoryProcess")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class SubCategoryProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubCategoryProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
		
		
		try{
			int fk_cat_id=Integer.parseInt(request.getParameter("fk_cat_id"));
			String subcat_name=request.getParameter("subcat_name");
			Part p=request.getPart("subcat_pic");
			String subcat_details=request.getParameter("subcat_details");
	        // Getting Application Path
	        //String appPath = request.getServletContext().getContextPath();
			 String Path=DBConnection.Path();
		        String appPath =Path+"/SubcatImages";
	        // File path where all files will be stored
	        String imagePath = appPath + "";
	 
	        // Creates the file directory if it does not exists
	        File fileDir = new File(imagePath);
	        if (!fileDir.exists()) {
	            fileDir.mkdirs();
	        }
	         
	        //Get Image Name
	        String imageName = p.getSubmittedFileName();
	        String fileExt = imageName.substring(imageName.length()-3);
	        String imgname=new Date().getTime() +"."+fileExt;
	        //System.out.println(imagePath);
	        //System.out.println(imageName);
	        //System.out.println(imagePath + "/"+ imgname);
	        String finalImgPath=imagePath + "/"+ imgname;
	        if(validateImage(imageName)){
	            try{
	                p.write(imagePath + "/" + imgname);
	                //out.print("<img src=\"images/"+imageName+"\" >");
	            }catch (Exception ex) {
	                //out.print("<h1>"+ex.getMessage()+"</h1>");
	            }
	        }else{
	            out.print("<h1>Invalid Image Format</h1>");
	        }
	    
			/*
			 * Connection con= new DBConnection().Connect(); PreparedStatement ps=con.
			 * prepareStatement("insert into tbl_subcategory(fk_cat_id,subcat_name,subcat_pic,subcat_details) values(?,?,?,?)"
			 * ); ps.setInt(1, 1); ps.setString(2,subcat_name);
			 * ps.setString(3,finalImgPath); ps.setString(4,subcat_details);
			 * status=ps.executeUpdate();
			 */
			  Subcategory u=new Subcategory();
			  u.setFk_cat_id(fk_cat_id);
			  u.setSubcat_details(subcat_details);
			  u.setSubcat_name(subcat_name);
			  u.setSubcat_pic(finalImgPath);
			  
			  int i=SubcategoryDao.save(u);
			  response.sendRedirect("subcategory_view.jsp");
		}
	catch(Exception e){
			e.printStackTrace();
			}  
		
	
	}
	private boolean validateImage(String imageName){
        String fileExt = imageName.substring(imageName.length()-3);
        if("jpg".equals(fileExt) || "png".equals(fileExt) || "gif".equals(fileExt))
            return true;
         
        return false;
    }
	
	
	

}
