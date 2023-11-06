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

@WebServlet("/CategoryProcessUpdate")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class CategoryProcessUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public CategoryProcessUpdate() {
        super();
        
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
try{
	  int cat_id=Integer.parseInt(request.getParameter("cat_id"));
	//String cat_id1=request.getParameter("cat_id");
	   //System.out.println("CategoryId"+cat_id1);
        String cat_name=request.getParameter("cat_name");
        Part p1=request.getPart("cat_img");

        String Path=DBConnection.Path();
		String appPath =Path+"/CategoryImages";
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
        String finalImgPath1=imagePath + "/"+ imgname1;
        if(validateImage1(imageName1)){
            try{
                p1.write(imagePath + "/" + imgname1);
               
                //out.print("<img src=\"images/"+imageName+"\" >");
            }catch (Exception ex) {
                //out.print("<h1>"+ex.getMessage()+"</h1>");
            }
        }else{
        	
            out.print("<script> alert('Invalid Image Format')</script>");
        }
        
        Category u=new Category(); 
       u.setCat_id(cat_id);
        u.setCat_name(cat_name);
        u.setCat_img_path(finalImgPath1);
	  
	  int i=CategoryDao.update(u);
	  response.sendRedirect("category_view.jsp");
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
}
