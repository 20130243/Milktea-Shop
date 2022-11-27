package vn.edu.hcmuaf.fit.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;
import java.util.List;

public class JDBIConnector {
    private static Jdbi jdbi;

    private static void makeConnect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL("jdbc:mysql://" + DBProperties.getDbHost() + ":" + DBProperties.getDbPort() + "/" + DBProperties.getDbName());
        dataSource.setUser(DBProperties.getDbUsername());
        dataSource.setPassword(DBProperties.getDbPassword());
        try {
            dataSource.setUseCompression(true);
            dataSource.setAutoReconnect(true);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        jdbi = Jdbi.create(dataSource);

    }

    private JDBIConnector() {
    }

    public static Jdbi get() {
        if (jdbi == null) makeConnect();
        return jdbi;
    }

    public static void main(String[] args) {
        List<String> as = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select name from user").mapTo(String.class).list();
        });
        System.out.println(as);
    }
}
