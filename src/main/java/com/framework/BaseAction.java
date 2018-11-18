package com.framework;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Yujianfei on 2017/4/8.
 * 控制层基类
 */
public class BaseAction {

    /**
     * Convenience method to get the request
     *
     * @return current request
     */
    protected HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

    /**
     * Convenience method to get the response
     *
     * @return current response
     */
    protected HttpServletResponse getResponse() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
    }

    /**
     * Convenience method to get the session
     *
     * @return current session
     */
    protected HttpSession getHttpSession() {
        return getRequest().getSession();
    }
}
