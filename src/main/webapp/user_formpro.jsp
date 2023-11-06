<%@page import="travel.UserDao"%>
<jsp:useBean id="u" class="travel.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
   int i=UserDao.save(u);
   if(i>0){
	   //<jsp:include page="adm-user-view.jsp"></jsp:include>
   response.sendRedirect("user_view.jsp");
 
   }else
	   System.out.println("Failed ");
   //response.sendRedirect("adm-user-error.jsp");
   //out.print(u.getFname());
 %>

