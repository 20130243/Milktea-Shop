package vn.edu.hcmuaf.fit.dao;

import java.util.List;
import java.util.Map;

public abstract class RD {
    public abstract List<Map<String, Object>> getAll();

    public abstract Map<String, Object> getById(int id);

    public abstract void delete(int id);
}
