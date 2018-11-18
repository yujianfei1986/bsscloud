package com.bss.controller;

import com.bss.entity.User;
import com.bss.service.LoginService;
import com.bss.utils.CommUtil;
import com.bss.utils.JsonStringUtils;
import com.framework.BaseAction;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by yujianfei on 2017/8/30.
 * 登录跳转
 */
@Controller
@RequestMapping("bss/login")
public class LoginController extends BaseAction {
    private Logger logger = Logger.getLogger(LoginController.class);

    @Resource
    private LoginService loginService;

    @RequestMapping("/getMenuTree")
    public void getMenuTree(HttpServletResponse response) {
        String json = "";
        try {

            String root_id = getRequest().getParameter("top_id");
            List<Map<String, Object>> treeList = loginService.getMenuTree(root_id, getRequest());
            treeList = CommUtil.listMapKeyToLower(treeList);
            json = JsonStringUtils.listToJsonString(treeList);

        } catch (Exception e) {
            logger.error("", e);
        }

        CommUtil.sendMsgToFrontEnd(response, json);
    }

    @RequestMapping("/loginAction")
    public String loginAction(User user, ModelMap modelMap) {
        try {

            if (CommUtil.isEmpty(user.getUser_name())) {
                String tip = CommUtil.getI18NStringByKey("DengLuShiBaiZhangHaoBuNengWeiKong", getRequest());
                modelMap.put("tip", tip);
                return "../../login";
            }
            if (CommUtil.isEmpty(user.getUser_passwd())) {
                String tip = CommUtil.getI18NStringByKey("DengLuShiBaiMiMaBuNengWeiKong", getRequest());
                modelMap.put("tip", tip);
                return "../../login";
            }

            if (loginService.checkUserLogin(user, getRequest())) {
                getHttpSession().setAttribute("userInfo", user);
                return "bss_main";
            }

            String tip = CommUtil.getI18NStringByKey("DengLuShiBai", getRequest()) + user.getErrInfo();
            modelMap.put("tip", tip);

        } catch (Exception e) {
            logger.error("", e);
        }
        return "../../login";
    }
}
