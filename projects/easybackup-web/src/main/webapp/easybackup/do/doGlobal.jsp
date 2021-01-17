<%@page import="java.io.File"%>
<%@page import="cn.easyproject.easybackup.BackupRuntime"%>
<%@page import="cn.easyproject.easycommons.propertiesutils.EasyPropertiesUtils"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String enable=request.getParameter("enable");
String cronExpression=request.getParameter("cronExpression");
String dir=request.getParameter("dir");
String file=request.getParameter("file");
String compress=request.getParameter("compress");
String compressType=request.getParameter("compressType");
String compressEncoding=request.getParameter("compressEncoding");
String deleteTargetFile=request.getParameter("deleteTargetFile");
String mailReceiver=request.getParameter("mailReceiver");
String mailSender=request.getParameter("mailSender");
String mailSenderPassword=request.getParameter("mailSenderPassword");
String mailSenderHost=request.getParameter("mailSenderHost");
String mailSenderPort=request.getParameter("mailSenderPort");
String mailSenderSsl=request.getParameter("mailSenderSsl");
String mailSenderTitle=request.getParameter("mailSenderTitle");
String mailSenderTemplate=request.getParameter("mailSenderTemplate");
String mailDeleteBackup=request.getParameter("mailDeleteBackup");
String cmdBefore=request.getParameter("cmdBefore");
String cmdAfter=request.getParameter("cmdAfter");
String beforeClass=request.getParameter("beforeClass");
String afterClass=request.getParameter("afterClass");


Map<String, String> map=new HashMap<String, String>();

map.put("easybackup.enable", enable);
map.put("easybackup.cronexpression", cronExpression);
map.put("easybackup.dir", dir);
map.put("easybackup.file", file);
map.put("easybackup.compress", compress);
map.put("easybackup.compressType", compressType);
map.put("easybackup.compressEncoding", compressEncoding);
map.put("easybackup.deleteTargetFile", deleteTargetFile);
map.put("easybackup.mail.receiver", mailReceiver);
map.put("easybackup.mail.sender", mailSender);
map.put("easybackup.mail.sender.passowrd", mailSenderPassword);
map.put("easybackup.mail.sender.host", mailSenderHost);
map.put("easybackup.mail.sender.port", mailSenderPort);
map.put("easybackup.mail.sender.ssl", mailSenderSsl);
map.put("easybackup.mail.sender.title", mailSenderTitle);
map.put("easybackup.mail.sender.template", mailSenderTemplate);
map.put("easybackup.mail.deleteBackup", mailDeleteBackup);
map.put("easybackup.cmd.before", cmdBefore);
map.put("easybackup.cmd.after", cmdAfter);
map.put("easybackup.beforeClass", beforeClass);
map.put("easybackup.afterClass", afterClass);

File propertieFile=BackupRuntime.getPropertiesFile();

if(propertieFile!=null){
	EasyPropertiesUtils.modify(propertieFile, map);
}else{
	session.setAttribute("MSG", "can not found easybackup.properties file!");
}
response.sendRedirect(basePath+"easybackup/do/toGlobal.jsp");
%>