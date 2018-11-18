<%--<%@page import="com.busi.utils.ApplicationProperties"%>--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<%@page import="com.busi.system.utils.UserUtil"%>--%>
<%@page import="java.util.ResourceBundle" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="bss_ver" value="V1.0"/>
<%
    // Load Internationalization Resource package
    ResourceBundle rb = ResourceBundle.getBundle("i18n" + ".display_language", request.getLocale());
%>

<%
    if (request.getLocale().toString().indexOf("zh") != -1) {
%>
<c:set var="i18n_type" value="zh"/>
<%
} else {
%>
<c:set var="i18n_type" value="en"/>
<%
    }
%>