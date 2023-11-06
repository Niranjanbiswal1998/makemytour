<%@page import="travel.UserDao"%>
<jsp:useBean id="u" class="travel.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
UserDao.delete(u);
response.sendRedirect("user_view.jsp");
%>