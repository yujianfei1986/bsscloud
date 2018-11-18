package com.init;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Created by yujianfei on 2017/10/8.
 * 获取spring对象
 */
public class ApplicationContextHelper implements ApplicationContextAware {
    private static ApplicationContext ctx;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        ctx = applicationContext;
    }

    public static Object getBean (String beanName) {
        return ctx.getBean(beanName);
    }
}
