package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");


    if (session.getAttribute("loginStatus") == "logged") {
        response.sendRedirect("adminsivut/index.jsp");
    } else {

      out.write("\r\n");
      out.write("\r\n");
      tilanvaraus.oliot.LoginPapu apu1 = null;
      synchronized (_jspx_page_context) {
        apu1 = (tilanvaraus.oliot.LoginPapu) _jspx_page_context.getAttribute("apu1", PageContext.PAGE_SCOPE);
        if (apu1 == null){
          apu1 = new tilanvaraus.oliot.LoginPapu();
          _jspx_page_context.setAttribute("apu1", apu1, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\"/>\r\n");
      out.write("        <title>Kirjaudu sisään</title>\r\n");
      out.write("        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400' rel='stylesheet' type='text/css' />\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div id=\"container\">\r\n");
      out.write("        ");

        if (request.getParameter("nappi") != null) {
            if(apu1.getYhteysAuki()){
                String tunnus = request.getParameter("tunnus");
                String salasana = apu1.salasanaMuunnos(request.getParameter("salasana"));
                if (apu1.kirjauduSisaan(tunnus, salasana)){
                    session.setAttribute("loginStatus", "logged");
                    response.sendRedirect("adminsivut/index.jsp");
                } else {
                    out.print("<p class='virhe'>Käyttäjätunnus ja salasana eivät täsmää</p>");
                }
            }
        }
        
      out.write("\r\n");
      out.write("        <h1>Kirjautuminen</h1>\r\n");
      out.write("        <form method=\"POST\" action=\"login.jsp\">\r\n");
      out.write("            <p>Käyttäjätunnus<br/>\r\n");
      out.write("            <input type=\"text\" name=\"tunnus\"/></p>\r\n");
      out.write("            <p>Salasana<br/>\r\n");
      out.write("            <input type=\"password\" name=\"salasana\"/></p>\r\n");
      out.write("            <input type=\"submit\" name=\"nappi\" value=\"Kirjaudu\"/>\r\n");
      out.write("        </form>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
 } 
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
