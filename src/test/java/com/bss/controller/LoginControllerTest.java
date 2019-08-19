package com.bss.controller;

import com.bss.entity.User;
import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.ui.ModelMap;

/**
 * Created by Admin on 2019/8/19.
 * 登陆测试
 */
public class LoginControllerTest {

    @Test
    public void testLogin() {
        User user = new User();
        user.setUser_name("");
        user.setUser_passwd("yjf1986");
        LoginController loginController = new LoginController();
        String res = loginController.loginAction(user, new ModelMap());
        assertEquals("../../login", res);
    }
}
