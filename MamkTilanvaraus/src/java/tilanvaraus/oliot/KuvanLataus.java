package tilanvaraus.oliot;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.RandomStringUtils;

public class KuvanLataus extends HttpServlet {
    private int tilaId = 0;
    private String latausPolku = "D:/Asennukset/wamp/www/MamkTilanvaraus/MamkTilanvaraus/web/kuvat/tilat/";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                    if(item.isFormField() && item.getFieldName().equals("tilaId")){
                        this.tilaId = Integer.parseInt(item.getString());
                        this.latausPolku += this.tilaId;
                    } else if (!item.isFormField()) {
                        final File kansio = new File(this.latausPolku);
                        if (null != kansio) {
                            kansio.mkdirs();
                        }
                        String nimi = RandomStringUtils.random(15,true,true);
                        String name = new File(item.getName()).getName(); 
                        item.write( new File(this.latausPolku + "/" + this.tilaId + "/" + name));
                    }
                }
               request.setAttribute("message", "Kuva ladattiin onnistuneesti");
            } catch (Exception ex) {
               request.setAttribute("message", "Kuvan lataaminen epäonnistui!");
            }          
         
        } else {
            
        }
    
        request.getRequestDispatcher("tilat.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
