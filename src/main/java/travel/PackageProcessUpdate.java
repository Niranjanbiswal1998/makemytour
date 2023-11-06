package travel;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/PackageProcessUpdate")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class PackageProcessUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PackageProcessUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
		
		
		try{
			int pack_id=Integer.parseInt(request.getParameter("pack_id"));
			int fk_cat_id=Integer.parseInt(request.getParameter("fk_cat_id"));
			//System.out.println(fk_cat_id);
			int fk_subcat_id=Integer.parseInt(request.getParameter("fk_subcat_id"));
			//System.out.println(fk_subcat_id);
			String pack_name=request.getParameter("pack_name");
			String pack_details=request.getParameter("pack_details");
			float pack_price=Float.parseFloat(request.getParameter("pack_price"));
			Part p1=request.getPart("pic1Path");
			Part p2=request.getPart("pic2Path");
			Part p3=request.getPart("pic3Path");
			//String subcat_details=request.getParameter("subcat_details");
	        // Getting Application Path
	        //String appPath = request.getServletContext().getContextPath();
			String Path=DBConnection.Path();
	        String appPath =Path+"/PackageImages";

	       
	        // File path where all files will be stored
	        String imagePath = appPath + "";
	 
	        // Creates the file directory if it does not exists
	        File fileDir = new File(imagePath);
	        if (!fileDir.exists()) {
	            fileDir.mkdirs();
	        }
	         
	        //Get Image Name
	        String imageName1 = p1.getSubmittedFileName();
	        System.out.println(imageName1);
	        String fileExt1 = imageName1.substring(imageName1.length()-3);
	        String imgname1=new Date().getTime() +"1"+"."+fileExt1;
	        
	        String imageName2 = p2.getSubmittedFileName();
	        String fileExt2 = imageName2.substring(imageName2.length()-3);
	        String imgname2=new Date().getTime() +"2"+"."+fileExt2;
	        
	        String imageName3 = p3.getSubmittedFileName();
	        String fileExt3 = imageName3.substring(imageName3.length()-3);
	        String imgname3=new Date().getTime() +"3"+"."+fileExt3;
	        //System.out.println(imagePath);
	        //System.out.println(imageName);
	        //System.out.println(imagePath + "/"+ imgname);
	        String finalImgPath1=imagePath + "/"+ imgname1;
	        String finalImgPath2=imagePath + "/"+ imgname2;
	        String finalImgPath3=imagePath + "/"+ imgname3;
	        if(validateImage1(imageName1)&& validateImage2(imageName2) && validateImage3(imageName3)){
	            try{
	                p1.write(imagePath + "/" + imgname1);
	                p2.write(imagePath + "/" + imgname2);
	                p3.write(imagePath + "/" + imgname3);
	                //out.print("<img src=\"images/"+imageName+"\" >");
	            }catch (Exception ex) {
	                //out.print("<h1>"+ex.getMessage()+"</h1>");
	            }
	        }else{
	        	
	            out.print("<script> alert('Invalid Image Format')</script>");
	        }
	    
			/*
			 * Connection con= new DBConnection().Connect(); PreparedStatement ps=con.
			 * prepareStatement("insert into tbl_subcategory(fk_cat_id,subcat_name,subcat_pic,subcat_details) values(?,?,?,?)"
			 * ); ps.setInt(1, 1); ps.setString(2,subcat_name);
			 * ps.setString(3,finalImgPath); ps.setString(4,subcat_details);
			 * status=ps.executeUpdate();
			 */
			  Package u=new Package();
			    u.setPack_id(pack_id);
			    u.setFk_cat_id(fk_cat_id);  
	            u.setFk_subcat_id(fk_subcat_id);   
	            u.setPack_name(pack_name);
	            u.setPack_price(pack_price);
	            u.setPic1Path(finalImgPath1);
	            u.setPic2Path(finalImgPath2);
	            u.setPic3Path(finalImgPath3);
	            u.setPack_details(pack_details);
			  
			  int i=PackageDao.update(u);
			  response.sendRedirect("package_view.jsp");
		}
	catch(Exception e){
			e.printStackTrace();
			}  
		
	
	}
	private boolean validateImage1(String imageName1){
        String fileExt1 = imageName1.substring(imageName1.length()-3);
        if("jpg".equals(fileExt1) || "png".equals(fileExt1) || "gif".equals(fileExt1))
            return true;
         
        return false;
    }
	
	private boolean validateImage2(String imageName2){
        String fileExt2 = imageName2.substring(imageName2.length()-3);
        if("jpg".equals(fileExt2) || "png".equals(fileExt2) || "gif".equals(fileExt2))
            return true;
         
        return false;
    }
	private boolean validateImage3(String imageName3){
        String fileExt3 = imageName3.substring(imageName3.length()-3);
        if("jpg".equals(fileExt3) || "png".equals(fileExt3) || "gif".equals(fileExt3))
            return true;
         
        return false;
    }
	
	

}