package com.init;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.io.Reader;

/**
 * Created by yujianfei on 2017/10/7.
 * tomcat启动执行方法
 */
public class InitServlet extends HttpServlet {
    private Logger logger = Logger.getLogger(InitServlet.class);

    public void init(ServletConfig config) throws ServletException {
        //initMybatisProcedure();
        initC3p0procedure();
    }

    private void initMybatisProcedure() {
        String source = "/mybatis/MyBatisForInit.xml";
        Reader reader = null;
        SqlSession session;
        try {
            reader = Resources.getResourceAsReader(source);
        } catch (Exception e) {
            logger.error("", e);
        }
        SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
        session = sqlMapper.openSession();

        try {
            String version = session.selectOne("getMysqlVersion");
            logger.info("Mysql version is: " + version);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            session.close();
        }
    }

    private void initC3p0procedure() {
        InitC3p0Method initC3p0Method = (InitC3p0Method) ApplicationContextHelper.getBean("initC3p0Method");
        String version = initC3p0Method.getMysqlVersion();
        logger.info("Mysql version is: " + version);
    }
}
