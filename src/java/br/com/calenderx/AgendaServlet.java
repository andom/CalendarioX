package br.com.calenderx;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AgendaServlet extends HttpServlet {
    
    private AgendaDAO dao;
    private IDBConnector connector;
    private String message;

    @Override
    public void init(ServletConfig config) {
        try {
            super.init(config);
            connector = new MySqlConnector();
            dao = new AgendaDAO(connector.getConnection());
            this.message = "";
        } 
        catch (ServletException e) {
            message = e.getMessage();
        } 
        catch (SQLException e) {
            message = e.getMessage();
        }
    }
    
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            List<Agenda> Agendamentos;
            
            FormatData objFormat = new FormatData();
            
            if (request.getParameter("id") == null){
                Agendamentos = dao.selecionar();
                
                out.println("[");

                for(Agenda objAgenda: Agendamentos){ 
                    String strJSON = new String();
                    strJSON += String.format("'id':%s,", objAgenda.getIdAgenda());
                    strJSON += String.format("'start':'%s',", objFormat.formatJSON(objAgenda.getDtInicio()));
                    strJSON += String.format("'end':'%s',", objFormat.formatJSON(objAgenda.getDtFim()));
                    strJSON += String.format("'title':'%s'", objAgenda.getDsAssunto());

                    out.println("{");
                    out.println(strJSON);
                    out.println("},");
                }
                
                out.println("]");

            }
            else{
                Agendamentos = dao.selecionar(Integer.parseInt(request.getParameter("id")));
                
                if (Agendamentos != null){
                    Agenda objAgenda = Agendamentos.get(0);
                    String strJSON = new String();
                    strJSON += String.format("%s|%s|%s|%s|%s|%s|%s", 
                            objAgenda.getIdAgenda(), 
                            objAgenda.getIdTpCompromisso(), 
                            objFormat.returnDate(objAgenda.getDtInicio()),
                            objFormat.returnTime(objAgenda.getDtInicio()),
                            objFormat.returnTime(objAgenda.getDtFim()),
                            objAgenda.getDsAssunto(),
                            objAgenda.getDsObservacao());
                    out.println(strJSON);
                }
            }
        }
        catch (SQLException e) {
            out.println("<script> alert(" + e.getMessage() + ");</script>");
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
