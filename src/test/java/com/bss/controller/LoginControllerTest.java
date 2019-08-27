package com.bss.controller;

import com.bss.base.BaseTest;
import com.bss.entity.User;
import org.junit.Test;
import static org.junit.Assert.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

/**
 * Created by Admin on 2019/8/19.
 * 登陆测试
 */
public class LoginControllerTest extends BaseTest {

    @Autowired
    private LoginController loginController;

    @Test
    public void testLogin() {
        User user = new User();
        user.setUser_name("");
        user.setUser_passwd("yjf1986");
        String res = loginController.loginAction(user, new ModelMap());
        assertEquals("../../login", res);
    }
}
