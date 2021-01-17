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
String enable=request.getParameter("v");
if(!(EasyUtil.isNotEmpty(name)&&EasyUtil.isNotEmpty(type))){
	response.sendRedirect(basePath+"easybackup/configuraions.jsp");
	return;
}


type=type.toLowerCase();

String key="easybackup."+type+"."+name+".enable";

Map<String,String> map=new HashMap<String,String>();
map.put(key, enable);

EasyPropertiesUtils.modify(BackupRuntime.getPropertiesFile(), map);


response.sendRedirect(basePath+"easybackup/configuraions.jsp");

%>