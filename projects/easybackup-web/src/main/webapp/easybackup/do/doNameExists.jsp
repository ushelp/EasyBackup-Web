<%@page import="cn.easyproject.easybackup.BackupRuntime"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String name=request.getParameter("name").replace(" ", "");
Set<String> names=BackupRuntime.getBackupNames();
if(names.contains(name)){out.print("{\"res\":true}");}else{out.print("{\"res\":false}");}
%>