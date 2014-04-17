<%
session.setAttribute("loginStatus", null);
session.setAttribute("loginPermission", null);
session.setAttribute("loginUserId", null);
session.invalidate();
response.sendRedirect("login.jsp");
%>