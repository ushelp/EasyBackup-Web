<%@page import="cn.easyproject.easybackup.BackupRuntime"%>
<%@page import="cn.easyproject.easybackup.util.SpringUtil"%>
<%@page import="cn.easyproject.easybackup.job.JobManager"%>
<%@page import="cn.easyproject.easybackup.EasyBackup"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

BackupRuntime.stop();

response.sendRedirect(basePath+"easybackup/dashboard.jsp");
%>
