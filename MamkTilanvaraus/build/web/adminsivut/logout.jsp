<%
session.setAttribute("loginStatus", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>