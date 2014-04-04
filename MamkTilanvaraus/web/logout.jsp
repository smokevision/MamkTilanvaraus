<%
session.setAttribute("loginStatus", null);
session.setAttribute("loginPermission", null);
session.invalidate();
response.sendRedirect("login.jsp");
%>