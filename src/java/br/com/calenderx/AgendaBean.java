package br.com.calenderx;

import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class AgendaBean extends Agenda{
    private String message;
    private Context env;
    private IDBConnector connector;
    private AgendaDAO dao;
    
    public AgendaBean() {
        try {
            env = (Context) new InitialContext().lookup("java:comp/env");
            connector = new MySqlConnector();
            dao = new AgendaDAO(connector.getConnection());
            this.message = "";
        } 
        catch (NamingException e) {
            message = e.getMessage();
        } 
        catch (SQLException e) {
            message = e.getMessage();
        }
    }

    public String getMessage() {
        return this.message;
    }
}
