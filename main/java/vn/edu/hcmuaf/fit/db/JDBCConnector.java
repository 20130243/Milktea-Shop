package vn.edu.hcmuaf.fit.db;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JDBCConnector {
    public static void main(String args[]) throws SQLException {
        System.out.println(query("select * from coupon"));
    }

    public static List<Map<String, Object>> query(String sql) throws SQLException {
        ResultSet rs = null;
        List<Map<String, Object>> results = new ArrayList<Map<String, Object>>();
        Connection conn = getConnection();
        try {
            // crate statement
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            rs = stmt.executeQuery(sql);
            results = rsToList(rs);
            rs.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return results;
    }

    public static List<Map<String, Object>> rsToList(ResultSet rs)
            throws SQLException {
        ResultSetMetaData md = rs.getMetaData();
        int columns = md.getColumnCount();
        List<Map<String, Object>> results = new ArrayList<Map<String, Object>>();
        while (rs.next()) {
            Map<String, Object> row = new HashMap<String, Object>();
            for (int i = 1; i <= columns; i++) {
                row.put(md.getColumnLabel(i), rs.getObject(i));
            }
            results.add(row);
        }
        return results;
    }

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://" + DBProperties.getDbHost() + ":" + DBProperties.getDbPort() + "/" + DBProperties.getDbName()
                    , DBProperties.getDbUsername(), DBProperties.getDbPassword());
            System.out.println("connect successfully!");
        } catch (Exception ex) {
            System.out.println("connect failure!");
            ex.printStackTrace();
        }
        return conn;
    }
}
