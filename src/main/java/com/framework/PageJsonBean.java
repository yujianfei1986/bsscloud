package com.framework;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yujianfei on 2017/11/10.
 * 分页
 */
public class PageJsonBean<T> {
    private long total;// 总数
    private List<T> rows;// 数据
    private Map<String, Object> properties;// 其它属性

    public PageJsonBean(long total, List<T> rows) {
        this.total = total;
        this.rows = rows;
    }

    public Map<String, Object> getProperties() {
        return properties;
    }

    public void setProperties(Map<String, Object> properties) {
        this.properties = properties;
    }

    public void addProperty(String propName, Object propValue) {
        if (properties == null) {
            properties = new HashMap<String, Object>();
        }
        properties.put(propName, propValue);
    }

    public void addProperties(Map<String, Object> props) {
        if (properties == null) {
            properties = new HashMap<String, Object>();
        }
        getProperties().putAll(props);
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
