
package br.com.calenderx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnector implements IDBConnector {

    @Override
    public Connection getConnection() throws SQLException {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        String serverName = "servidor"; //"servidor"; 
        String mydatabase = "calenderx";
        String username = "root";
        String password = "master@2012";
        String url = "jdbc:mysql://" + serverName + "/" + mydatabase;

        Connection conn = DriverManager.getConnection(url, username, password);
        conn.setAutoCommit(true);
        return conn;
    }
}
