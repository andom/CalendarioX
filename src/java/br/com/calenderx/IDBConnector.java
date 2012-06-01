package br.com.calenderx;

import java.sql.Connection;
import java.sql.SQLException;

public interface IDBConnector {
    public Connection getConnection() throws SQLException;
}
