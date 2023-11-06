<%@page import="travel.CategoryDao"%>
<jsp:useBean id="u" class="travel.Category"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
CategoryDao.delete(u);
response.sendRedirect("category_view.jsp");
%>