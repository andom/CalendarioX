package br.com.calenderx;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AgendaResponse extends HttpServlet {

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
    private AgendaDAO dao;
    private IDBConnector connector;
    private String message;
    private GenericRet ret;

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
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            if (request.getParameter("acao").equals("deletar")){
                Integer intID = Integer.parseInt(request.getParameter("id"));
                dao.deletar(intID); //deletar
                
                out.println("<script> alert('Compromisso deletado!'); window.location='calendar.jsp';</script>");
            }
            else{ 

                Integer intID = request.getParameter("ID").equals("") ? 0 : Integer.parseInt(request.getParameter("ID"));
                Integer intTipo = request.getParameter("Tipo").equals("") ? 1 : Integer.parseInt(request.getParameter("Tipo"));
                String strDataInicio = FormatData.formatDateTime(request.getParameter("DataCompromisso"), request.getParameter("HoraInicio"));
                String strDataFim = FormatData.formatDateTime(request.getParameter("DataCompromisso"), request.getParameter("HoraFim"));

                Agenda objAgenda = new Agenda();
                objAgenda.setIdAgenda(intID);
                objAgenda.setIdTpCompromisso(intTipo);
                objAgenda.setDtInicio(strDataInicio);
                objAgenda.setDtFim(strDataFim);
                objAgenda.setDsAssunto(request.getParameter("Assunto"));
                objAgenda.setDsObservacao(request.getParameter("Observacao"));

                if (objAgenda.getIdAgenda() == 0){ //inserir
                    dao.inserir(objAgenda);
                }
                else{ //editar
                    dao.atualizar(objAgenda);
                }
                
                out.println("<script> alert('Informações atualizadas!'); window.location='calendar.jsp';</script>");
            }            

            
        } 
        catch(SQLException e){
            out.println("<script> alert(" + e.getMessage() + ");</script>");
        }
        catch(Exception e){
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
