<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="cn.easyproject.easybackup.util.EasyUtil"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="cn.easyproject.easycommons.propertiesutils.EasyPropertiesUtils"%>
<%@page import="cn.easyproject.easybackup.BackupRuntime"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String name=request.getParameter("name");
String type=request.getParameter("t");
if(!(EasyUtil.isNotEmpty(name)&&EasyUtil.isNotEmpty(type))){
	response.sendRedirect(basePath+"easybackup/configuraions.jsp");
	return;
}


type=type.toLowerCase();

String del="easybackup\\."+type+"\\."+name;

//删除行
EasyPropertiesUtils.removeLinesToFile(BackupRuntime.getPropertiesFile(), ".*"+del+".*");
//删除注释
EasyPropertiesUtils.removeMatchesToFile(BackupRuntime.getPropertiesFile(), "("+System.getProperty("line.separator")+"){1,3}#===="+name+":"+type+" backup.*");

response.sendRedirect(basePath+"easybackup/configuraions.jsp");

%>