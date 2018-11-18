package com.bss.dao;

import com.bss.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by yujianfei on 2017/8/16.
 * 用户操作
 */
@Repository
public interface IUserDao {
    String getMysqlVersion();

    List<Map<String, Object>> getMenuList();

    Map<String, Object> loginSelect(User user);

    void updateUserLockStatus(Map<String, String> map);
}
