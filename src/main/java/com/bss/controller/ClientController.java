package com.bss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yujianfei on 2017/10/7.
 * 客户功能相关控制层方法
 */
@Controller
public class ClientController {

    @RequestMapping("/toClient")
    public String toClient() {
        return "/client/client_mgmt";
    }
}
