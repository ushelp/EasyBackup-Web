<%@page import="cn.easyproject.easybackup.BackupRuntime"%>
<%@page import="cn.easyproject.easybackup.EasyBackup"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

try{
BackupRuntime.start();
}catch(Exception e){
	
}

response.sendRedirect(basePath+"easybackup/dashboard.jsp");
%>
