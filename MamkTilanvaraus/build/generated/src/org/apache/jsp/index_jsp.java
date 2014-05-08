package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/includes/header.jsp");
    _jspx_dependants.add("/includes/tilanavigaatio.jsp");
    _jspx_dependants.add("/includes/footer.jsp");
  }

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

      out.write('\r');
      out.write('\n');
      tilanvaraus.oliot.Tila tila = null;
      synchronized (_jspx_page_context) {
        tila = (tilanvaraus.oliot.Tila) _jspx_page_context.getAttribute("tila", PageContext.PAGE_SCOPE);
        if (tila == null){
          tila = new tilanvaraus.oliot.Tila();
          _jspx_page_context.setAttribute("tila", tila, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      tilanvaraus.oliot.Sivu sivu = null;
      synchronized (_jspx_page_context) {
        sivu = (tilanvaraus.oliot.Sivu) _jspx_page_context.getAttribute("sivu", PageContext.PAGE_SCOPE);
        if (sivu == null){
          sivu = new tilanvaraus.oliot.Sivu();
          _jspx_page_context.setAttribute("sivu", sivu, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"kuvat/ulkoasu/favicon.ico\">\r\n");
      out.write("        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Etusivu</title>\r\n");
      out.write("        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/main.css\"/>\r\n");
      out.write("        <script src=\"js/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"js/jquery-ui.min.js\"></script>\r\n");
      out.write("        <script src=\"js/sly.min.js\"></script>\r\n");
      out.write("        <script src=\"js/main.js\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div id=\"wrapper\">\r\n");
      out.write("            <div id=\"container\">\r\n");
      out.write("                ");
      tilanvaraus.oliot.Asiakas loginasiakas = null;
      synchronized (_jspx_page_context) {
        loginasiakas = (tilanvaraus.oliot.Asiakas) _jspx_page_context.getAttribute("loginasiakas", PageContext.PAGE_SCOPE);
        if (loginasiakas == null){
          loginasiakas = new tilanvaraus.oliot.Asiakas();
          _jspx_page_context.setAttribute("loginasiakas", loginasiakas, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("<div id=\"header\">\r\n");
      out.write("    <a href=\"index.jsp\"><img src=\"kuvat/ulkoasu/MAMK_logo_400.png\" alt=\"logo\" id=\"logo\"/></a>\r\n");
      out.write("    <ul id=\"navi\">\r\n");
      out.write("        <li id=\"eka\"><a href=\"index.jsp\">Etusivu</a></li>\r\n");
      out.write("        <li><a href=\"tilat.jsp\">Tilat</a></li>\r\n");
      out.write("        <li><a href=\"yhteys.jsp\">Yhteys</a></li>\r\n");
      out.write("        ");

        if (session.getAttribute("loginStatus") == "logged") {
        
      out.write("\r\n");
      out.write("        <li><a href=\"omatili.jsp\">Oma tili</a></li>\r\n");
      out.write("        ");

        }
        
      out.write("\r\n");
      out.write("    </ul>\r\n");
      out.write("    <div id=\"headerlogin\">\r\n");
      out.write("    ");

    if (session.getAttribute("loginStatus") != null && session.getAttribute("loginStatus") == "logged") {
    int userId = (Integer) session.getAttribute("loginUserId");
    loginasiakas.setAsiakasId(userId);
    if(loginasiakas.haeAsiakas()){
        while (loginasiakas.getVastaus().next()){
            out.print("Hei, "+loginasiakas.getVastaus().getString("etunimi")+" "+loginasiakas.getVastaus().getString("sukunimi")+"<br/>");
        }
    }
    
      out.write("\r\n");
      out.write("    <a href=\"logout.jsp\" id=\"logoutlink\">Kirjaudu ulos <img src=\"kuvat/ulkoasu/logout.png\" alt=\"Kirjaudu ulos\"/></a>\r\n");
      out.write("    ");

    } else {
    
      out.write("\r\n");
      out.write("    <a href=\"#\" id=\"loginlink\">Kirjaudu sisään <img src=\"kuvat/ulkoasu/login.png\" alt=\"Kirjaudu\"/></a>\r\n");
      out.write("    <div id=\"kirjautuminen\">\r\n");
      out.write("        <a title=\"Sulje\" id=\"loginsulje\" href=\"javascript:;\"></a>\r\n");
      out.write("        <h2>Kirjaudu sisään</h2>\r\n");
      out.write("        <form method=\"post\" action=\"login.jsp\">\r\n");
      out.write("            <table id=\"logintable\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"vasen\">Tunnus</td>\r\n");
      out.write("                    <td class=\"oikea\"><input type=\"text\" name=\"tunnus\" /></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"vasen\">Salasana</td>\r\n");
      out.write("                    <td class=\"oikea\"><input type=\"password\" name=\"salasana\" /></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"vasen\"><input type=\"submit\" name=\"nappi\" value=\"Kirjaudu\"/></td>\r\n");
      out.write("                    <td class=\"oikea\"><a href=\"login.jsp\">Unohtuiko salasana?</a></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </form>\r\n");
      out.write("        <h2>Ei tunnuksia?</h2>\r\n");
      out.write("        <a href=\"rekisteroityminen.jsp\">Rekisteröidy</a>\r\n");
      out.write("        \r\n");
      out.write("    </div>\r\n");
      out.write("    ");

    }
    
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("</div>");
      out.write("\r\n");
      out.write("                <div id=\"banneri\"></div>\r\n");
      out.write("                <div id=\"palsta\">\r\n");
      out.write("                    ");

                    sivu.setSivuNimi("etusivu");
                    if(sivu.haeSivuNimi()){
                        while (sivu.getVastaus().next()) {
                            out.print(sivu.getVastaus().getString("sisalto"));
                        }
                    }
                    
      out.write("\r\n");
      out.write("                    <h2>Tilat</h2>\r\n");
      out.write("                    ");
      tilanvaraus.oliot.Tila tilanavi = null;
      synchronized (_jspx_page_context) {
        tilanavi = (tilanvaraus.oliot.Tila) _jspx_page_context.getAttribute("tilanavi", PageContext.PAGE_SCOPE);
        if (tilanavi == null){
          tilanavi = new tilanvaraus.oliot.Tila();
          _jspx_page_context.setAttribute("tilanavi", tilanavi, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("<div id=\"valikko_container\">\n");
      out.write("    <ul class=\"clearfix\">\n");
      out.write("        ");

        if(tilanavi.listaaTilat()){
            while (tilanavi.getVastaus().next()) {
                out.print("<li><a href='tila.jsp?id="+tilanavi.getVastaus().getString("id")+"'>"+tilanavi.getVastaus().getString("nimi")+"</a></li>");
            }
        }
        
      out.write("\n");
      out.write("    </ul>\n");
      out.write("</div>\n");
      out.write("<div class=\"scrollbar\">\n");
      out.write("    <div class=\"handle\">\n");
      out.write("        <div class=\"mousearea\"></div>\n");
      out.write("    </div>\n");
      out.write("</div>");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            ");
      out.write("<div id=\"footer\">\r\n");
      out.write("    <strong class=\"logo\"><a href=\"#\"><img src=\"kuvat/ulkoasu/MAMK_logo_400.png\" width=\"174\" height=\"46\" alt=\"MAMK University of Applied Sciences\"></a></strong>\r\n");
      out.write("    <div class=\"columns\">\r\n");
      out.write("        <div class=\"column\">\r\n");
      out.write("            <strong class=\"title\">Koulutus</strong><ul class=\"list\"><li><a href=\"http://www.mamk.fi/koulutus/amk-tutkinnot_nuoret_ja_aikuiset\">AMK-tutkinnot</a></li><li><a href=\"http://www.mamk.fi/koulutus/ylemmat_amk-tutkinnot\">Ylemmät AMK-tutkinnot</a></li><li><a href=\"http://www.mamk.fi/koulutus/avoin_amk\">Avoin AMK</a></li><li><a href=\"http://www.mamk.fi/koulutus/koulutuskalenteri\">Koulutuskalenteri</a></li><li><a href=\"http://www.mamk.fi/koulutus/taydennyskoulutus-_ja_asiantuntijapalvelut\">Täydennyskoulutus- ja asiantuntijapalvelut</a></li><li><a href=\"http://www.mamk.fi/koulutus/kesalukukausi\">Kesälukukausi</a></li></ul>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"column\">\r\n");
      out.write("            <strong class=\"title\">Hakeminen</strong><ul class=\"list\"><li><a href=\"http://www.mamk.fi/hakeminen/amk-tutkinnot_nuoret\">AMK-tutkinnot, nuoret</a></li><li><a href=\"http://www.mamk.fi/hakeminen/amk-tutkinnot_aikuiset\">AMK-tutkinnot, aikuiset</a></li><li><a href=\"http://www.mamk.fi/hakeminen/amk-tutkinnot_englanninkieliset\">AMK-tutkinnot, englanninkieliset</a></li><li><a href=\"http://www.mamk.fi/hakeminen/ylemmat_amk-tutkinnot\">Ylemmät AMK-tutkinnot</a></li><li><a href=\"http://www.mamk.fi/ULKOISET/digipapers/DIGIPAPER-HAKIJAN-OPAS-KEVAT-2013/\">Hakijanopas</a></li><li><a href=\"http://www.mamk.fi/hakeminen\">Hakutoimisto</a></li></ul>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"column\">\r\n");
      out.write("            <strong class=\"title\">Palvelut</strong><ul class=\"list\"><li><a href=\"http://www.mamk.fi/palvelut/asiantuntijapalvelut\">Täydennyskoulutus- ja asiantuntijapalvelut</a></li><li><a href=\"http://www.mamk.fi/palvelut/digitointi-_ja_arkistointipalvelut\">Digitointi- ja arkistointipalvelut</a></li><li><a href=\"http://www.mamk.fi/palvelut/hyvinvointipalvelut\">Hyvinvointipalvelut</a></li><li><a href=\"http://www.mamk.fi/kirjasto\">Kirjasto- ja tietopalvelut</a></li><li><a href=\"http://www.mamk.fi/palvelut/kokous-_ja_ravintolapalvelut\">Kokous- ja ravintolapalvelut</a></li><li><a href=\"http://www.mamk.fi/tutkimus_ja_kehitys\">Tutkimus- ja kehittämispalvelut</a></li></ul>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"column\">\r\n");
      out.write("            <strong class=\"title\">MAMK</strong><ul class=\"list\"><li><a href=\"http://www.mamk.fi/mamk_\">MAMK lyhyesti</a></li><li><a href=\"http://www.mamk.fi/yhteystiedot_ja_kartat\">Toimipisteet</a></li><li><a href=\"http://www.mamk.fi/yhteystiedot_ja_kartat/kartat\">Kartat</a></li><li><a href=\"http://www.mamk.fi/personsearch\">Henkilöhaku</a></li><li><a href=\"http://www.mamk.fi/mamk_/toihin_mamkiin\">Töihin MAMKiin</a></li><li><a href=\"http://www.mamk.fi/kirjasto/julkaisutoiminta\">Julkaisut</a></li><li><a href=\"http://www.mamk.fi/mamk_/medialle\">Medialle</a></li><li><a href=\"http://www.mamk.fi/mamk_/opoille\">Opoille</a></li><li><a href=\"http://www.mamk.fi/ajankohtaista\">Ajankohtaista</a></li><li><a href=\"http://www.mamk.fi/palaute?showrefererurl=true\">Palaute</a></li></ul>                    \r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
