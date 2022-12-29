package vn.edu.hcmuaf.fit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public abstract class RD {
    public abstract List<Map<String, Object>> getAll() throws SQLException;

    public abstract Map<String, Object> getById(int id) throws SQLException;

    public abstract void delete(int id);
}
