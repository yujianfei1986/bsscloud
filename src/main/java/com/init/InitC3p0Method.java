package com.init;

import com.bss.dao.IUserDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by yujianfei on 2017/10/8.
 * tomcat启动时初始化c3p0
 */
@Service("initC3p0Method")
public class InitC3p0Method {
    @Resource
    IUserDao iUserDao;

    public String getMysqlVersion() {
        return iUserDao.getMysqlVersion();
    }
}
