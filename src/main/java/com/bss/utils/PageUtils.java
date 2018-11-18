package com.bss.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by yujianfei on 2017/11/10.
 * 计算分页相关数据
 */
public class PageUtils {
    public static Map<String, Object> getpageParams(int pageSize, int pageNo, String sort, String order) {
        Map<String, Object> map = new HashMap<String, Object>();
        int offset = (pageNo - 1) * pageSize;
        int size = pageSize;
        map.put("offset", offset);
        map.put("size", size);
        map.put("sort", sort);
        map.put("order", order);
        return map;
    }
}
