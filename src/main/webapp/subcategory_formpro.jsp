<%@page import="travel.SubcategoryDao,travel.*,java.sql.*,java.io.InputStream,javax.servlet.http.Part"%>
<jsp:useBean id="u" class="travel.Subcategory"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>'


<%
   //int fk_cat_id=Integer.parseInt(request.getParameter("fk_cat_id"));
String subcat_name=request.getParameter("subcat_name");
Part p=request.getPart("subcat_pic");
InputStream subcat_pic=p.getInputStream();
String subcat_details=request.getParameter("subcat_details");
int status=0;
try{  
	
    Connection con= new DBConnection().Connect();  
    PreparedStatement ps=con.prepareStatement(  
     "insert into tbl_subcategory(fk_cat_id,subcat_name,subcat_pic,subcat_details) values(?,?,?,?)");  
    ps.setInt(1, 1);
    ps.setString(2,subcat_name); 
    ps.setBlob(3,subcat_pic);
    ps.setString(4,subcat_details);  
    status=ps.executeUpdate();  
}catch(Exception e){System.out.println(e);}  
//return status;
   /* int i=SubcategoryDao.save(u);
   if(i>0){
	   //<jsp:include page="adm-user-view.jsp"></jsp:include>
   //response.sendRedirect("category_view.jsp");
	 System.out.println("Data added to sub category");
   }else
	   System.out.println("Failed ");
   //response.sendRedirect("adm-user-error.jsp");
   //out.print(u.getFname()); */
 %>

