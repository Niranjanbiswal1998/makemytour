<%@page import="travel.UserDao"%>
<jsp:useBean id="u" class="travel.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=UserDao.update(u);
//out.print("Updated Successful");
response.sendRedirect("user_view.jsp");
%>