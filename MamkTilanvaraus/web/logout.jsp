<%
session.setAttribute("loginStatus", null);
session.invalidate();
response.sendRedirect("login.jsp");
%>