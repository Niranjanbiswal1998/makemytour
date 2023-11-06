<%@page import="travel.DBConnection" %>
<%@page import="java.sql.*"%>
<%
String category=request.getParameter("count"); 
int c=Integer.parseInt(category);
 String buffer="<td ><select name='fk_subcat_id'><option value='-1'>Select </option></td>";  
 try{
 Connection con = new DBConnection().Connect();  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from tbl_subcategory where fk_cat_id="+ c +"");  
   while(rs.next()){
   buffer=buffer+"<option value="+rs.getInt(1)+">"+rs.getString(3)+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>