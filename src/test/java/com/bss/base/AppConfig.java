package com.bss.base;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * Created by Admin on 2019/8/26.
 * 导入spring配置文件
 */
@Configuration
@ImportResource({"file:src/main/webapp/WEB-INF/config/spring-servlet.xml"})
public class AppConfig {

    public AppConfig() {}
}
