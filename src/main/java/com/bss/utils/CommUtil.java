package com.bss.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.*;

/**
 * Created by yujianfei on 2017/8/30.
 * 处理字符串相关方法，object<->String
 */
public class CommUtil {
    /**
     * Map<String, Object> ==> Map key to lowerCase
     */
    public static Map<String, Object> mapKeyToLower(Map<String, Object> map) {
        Map<String, Object> retMap = new HashMap<String, Object>();
        if (map != null) {
            Iterator iter = map.entrySet().iterator();
            while (iter.hasNext()) {
                Map.Entry entry = (Map.Entry) iter.next();
                Object key = entry.getKey();
                if (CommUtil.nvl(key).equals(""))
                    continue;
                retMap.put(key.toString().toLowerCase(), entry.getValue());
            }
        }
        return retMap;
    }

    public static List<Map<String, Object>> listMapKeyToLower(List<Map<String, Object>> list) {
        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        if (CommUtil.isNotEmpty(list)) {
            for (Map<String, Object> map : list) {
                map = CommUtil.mapKeyToLower(map);
                retList.add(map);
            }
        }
        return retList;
    }

    /**
     * Map<String, Object> ==> Map<String, String> map
     */
    public static Map<String, String> mapFormat2Str(Map<String, Object> map) {
        Map<String, String> retMap = new HashMap<String, String>();

        if (map != null) {
            Iterator iter = map.entrySet().iterator();
            while (iter.hasNext()) {
                Map.Entry entry = (Map.Entry) iter.next();
                Object key = entry.getKey();
                retMap.put(key.toString(), CommUtil.nvl(entry.getValue()));
            }
        }
        return retMap;
    }

    public static String lowerCase(String str) {
        if (str == null)
            return null;
        else
            return str.toLowerCase();
    }

    /**
     * Object转String ,空字符串返回"", 非空返回自己
     */
    public static String nvl(Object obj) {
        String ifNull = "";
        String str = String.valueOf(obj);
        if (str == null)
            return ifNull;
        str = str.trim();
        if (str.equals("") || "null".equals(str)) {
            return ifNull;
        } else {
            return str;
        }
    }

    /**
     * Object转String ,空字符串返回ifNull, 非空返回自己
     */
    public static String nvl(String str, String ifNull) {
        if (str == null)
            return ifNull;
        str = str.trim();
        if (str.equals("") || "null".equals(str)) {
            return ifNull;
        } else {
            return str;
        }
    }

    public static boolean isEmpty(List list) {
        if (list == null || list.size() == 0)
            return true;

        return false;
    }

    public static boolean isNotEmpty(List list) {
        if (list == null)
            return false;
        if (list.size() == 0)
            return false;

        return true;
    }

    public static boolean isEmpty(Object obj) {
        if (obj == null) {
            return true;
        }
        return "".equals(obj.toString());
    }

    /**
     * 对数据进行大小排序、大-->小 mapKey 按照哪个字段排序 keyType排序字段的类型 sortType :ASC还是desc
     */
    public static List<Map<String, Object>> sortList(List<Map<String, Object>> list, final String mapKey,
                                                     final String keyType, final String sortType) {
        // System.out.println("对数据进行排序");
        if (list != null && list.size() > 0) {
            String key = mapKey;
            Comparator<Map<String, Object>> mapComprator = new Comparator<Map<String, Object>>() {
                @Override
                public int compare(Map<String, Object> o1, Map<String, Object> o2) {
                    // do compare.
                    int yesVal = 1;
                    int noVal = -1;
                    if ("desc".equals(CommUtil.lowerCase(sortType))) {
                        yesVal = 1;
                        noVal = -1;
                    } else {
                        yesVal = -1;
                        noVal = 1;
                    }

                    int retVal = noVal;
                    String o1_key = String.valueOf(o1.get(mapKey));
                    String o2_key = String.valueOf(o2.get(mapKey));
                    if ("int".equals(keyType)) {
                        o1_key = CommUtil.nvl(o1_key, "0");
                        o2_key = CommUtil.nvl(o2_key, "0");
                        if (Integer.valueOf(o1_key) < Integer.valueOf(o2_key)) {
                            retVal = yesVal;
                        }
                    } else if ("String".equals(keyType)) {
                        o1_key = CommUtil.nvl(o1_key, "");
                        o2_key = CommUtil.nvl(o2_key, "");
                        if (o1_key.compareTo(o2_key) < 0) {
                            retVal = yesVal;
                        }
                    } else if ("float".equals(keyType)) {
                        o1_key = CommUtil.nvl(o1_key, "0");
                        o2_key = CommUtil.nvl(o2_key, "0");
                        if (Float.valueOf(o1_key) < Float.valueOf(o2_key)) {
                            retVal = yesVal;
                        }
                    } else if ("long".equals(keyType)) {
                        o1_key = CommUtil.nvl(o1_key, "0");
                        o2_key = CommUtil.nvl(o2_key, "0");
                        if (Long.valueOf(o1_key) < Long.valueOf(o2_key)) {
                            retVal = yesVal;
                        }
                    }
                    return retVal;
                }
            };
            Collections.sort(list, mapComprator);
        } else {
            new Exception("排序没有取到数据");
        }
        return list;
    }

    /**
     * 通过key值获取国际化字符串
     *
     * @return result
     */
    public static String getI18NStringByKey(String key, HttpServletRequest request) {
        ResourceBundle resourcesBundle = ResourceBundle.getBundle("i18n" + ".display_language", request.getLocale());
        return resourcesBundle.getString(key);
    }

    /**
     * json推送回前端显示
     * @param response http响应
     * @param content 返回前端内容
     */
    public static void sendMsgToFrontEnd(HttpServletResponse response, String content) {
        response.setCharacterEncoding("utf8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(content);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(out != null)
                out.close();
        }
    }
}
