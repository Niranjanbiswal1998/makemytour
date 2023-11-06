<%@page import="travel.CategoryDao"%>
<jsp:useBean id="u" class="travel.Category"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
   int i=CategoryDao.save(u);
   if(i>0){
	   //<jsp:include page="adm-user-view.jsp"></jsp:include>
   response.sendRedirect("category_view.jsp");
 
   }else
	   System.out.println("Failed ");
   //response.sendRedirect("adm-user-error.jsp");
   //out.print(u.getFname());
 %>

