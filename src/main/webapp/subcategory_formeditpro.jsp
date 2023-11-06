<%@page import="travel.CategoryDao"%>
<jsp:useBean id="u" class="travel.Category"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=CategoryDao.update(u);
//out.print("Updated Successful");
response.sendRedirect("category_view.jsp");
%>