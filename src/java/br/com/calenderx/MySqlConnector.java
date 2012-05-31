
package br.com.calenderx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class MySqlConnector implements IDBConnector {

    @Override
    public Connection getConnection() throws SQLException {
        
        try {
            Context env = (Context) new InitialContext().lookup("java:comp/env");
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            String serverName = (String)env.lookup("server"); 
            String mydatabase = (String)env.lookup("db");
            String username = (String)env.lookup("user");
            String password = (String)env.lookup("password");
            String url = "jdbc:mysql://" + serverName + "/" + mydatabase;

            Connection conn = DriverManager.getConnection(url, username, password);
            conn.setAutoCommit(true);
            return conn;                            
        }
        catch (NamingException e) {
            //message = e.getMessage();
        } 
        catch (SQLException e) {
            //message = e.getMessage();
        }
        return null;

    }
}
