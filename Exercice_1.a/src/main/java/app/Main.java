package app;

import java.sql.Connection;

import connection.PostgreSQLJDBCConnection;

public class Main {
    public static void main(String[] args) {

        Connection conn = PostgreSQLJDBCConnection.getConnection();

        if (conn != null) {
            PostgreSQLJDBCConnection.closeConnection(conn);
        }

    }

}
