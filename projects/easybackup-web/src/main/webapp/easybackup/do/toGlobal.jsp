<%@page import="cn.easyproject.easybackup.configuration.GlobalConfiguration"%>
<%@page import="cn.easyproject.easybackup.BackupRuntime"%>
<%@page import="cn.easyproject.easybackup.configuration.BackupConfiguration"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String name=request.getParameter("name");
GlobalConfiguration conf=BackupRuntime.getGlobalBackupsConfiguration();


request.setAttribute("conf", conf);
request.getRequestDispatcher("/easybackup/globalConfiguraion.jsp").forward(request, response);
%>