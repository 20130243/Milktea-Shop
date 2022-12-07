package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Size;
import vn.edu.hcmuaf.fit.dao.SizeDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SizeService {
    private final SizeDAO dao = new SizeDAO();

    public List<Size> getAll(){
        List<Size> list = new ArrayList<Size>();
        List<Map<String, Object>> sizeList = dao.getAll();
        for (Map<String, Object> map: sizeList) {
            list.add(new Size((Integer) map.get("id"),
                    (int) map.get("product_id"),
                    (String) map.get("name"),
                    (float) map.get("price")));
        }
        return list;
    }

    public static void main(String[] args) {
        System.out.println(new SizeService().getAll());
    }
}
