<%@page import="cn.easyproject.easybackup.util.EasyUtil"%>
<%@page import="java.io.File"%>
<%@page import="cn.easyproject.easybackup.BackupRuntime"%>
<%@page import="cn.easyproject.easycommons.propertiesutils.EasyPropertiesUtils"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/i18n.jsp" %>
 
 
<%!
	@SuppressWarnings("all")
	public void putValue(Map map,String key,String value){
		if(value!=null){
			map.put(key, value);
		}
	}
%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

// validator
if(
		!(EasyUtil.isNotEmpty(request.getParameter("name"))
		&& EasyUtil.isNotEmpty(request.getParameter("value"))
		&& EasyUtil.isNotEmpty(request.getParameter("cronExpression"))
		&& EasyUtil.isNotEmpty(request.getParameter("dir"))
		)
		){
	response.sendRedirect(basePath+"easybackup/configuraions.jsp");
	return;
}
String name=request.getParameter("name").replace(" ", "");
String type=request.getParameter("type");


String value=request.getParameter("value");
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
String senders=request.getParameter("senders");

type=type.toLowerCase();

Map<String, String> map=new LinkedHashMap<String, String>();

putValue(map,"easybackup."+type+"."+name, value);
putValue(map,"easybackup."+type+"."+name+".enable", enable);
putValue(map,"easybackup."+type+"."+name+".cronexpression", cronExpression);
putValue(map,"easybackup."+type+"."+name+".dir", dir);
putValue(map,"easybackup."+type+"."+name+".file", file);
putValue(map,"easybackup."+type+"."+name+".compress", compress);
putValue(map,"easybackup."+type+"."+name+".compressType", compressType);
putValue(map,"easybackup."+type+"."+name+".compressEncoding", compressEncoding);
putValue(map,"easybackup."+type+"."+name+".deleteTargetFile", deleteTargetFile);
putValue(map,"easybackup."+type+"."+name+".mail.receiver", mailReceiver);
putValue(map,"easybackup."+type+"."+name+".mail.sender", mailSender);
putValue(map,"easybackup."+type+"."+name+".mail.sender.passowrd", mailSenderPassword);
putValue(map,"easybackup."+type+"."+name+".mail.sender.host", mailSenderHost);
putValue(map,"easybackup."+type+"."+name+".mail.sender.port", mailSenderPort);
putValue(map,"easybackup."+type+"."+name+".mail.sender.ssl", mailSenderSsl);
putValue(map,"easybackup."+type+"."+name+".mail.sender.title", mailSenderTitle);
putValue(map,"easybackup."+type+"."+name+".mail.sender.template", mailSenderTemplate);
putValue(map,"easybackup."+type+"."+name+".mail.deleteBackup", mailDeleteBackup);
putValue(map,"easybackup."+type+"."+name+".cmd.before", cmdBefore);
putValue(map,"easybackup."+type+"."+name+".cmd.after", cmdAfter);
putValue(map,"easybackup."+type+"."+name+".beforeClass", beforeClass);
putValue(map,"easybackup."+type+"."+name+".afterClass", afterClass);
putValue(map,"easybackup."+type+"."+name+".senders", senders);

if(type.equals("user")){
	String targetFileClass=request.getParameter("targetFileClass");
	String dirClass=request.getParameter("dirClass");
	String fileClass=request.getParameter("fileClass");
	String backupClass=request.getParameter("backupClass");
	
	putValue(map,"easybackup."+type+"."+name+".targetFileClass", targetFileClass);
	putValue(map,"easybackup."+type+"."+name+".dirClass", dirClass);
	putValue(map,"easybackup."+type+"."+name+".fileClass", fileClass);
	putValue(map,"easybackup."+type+"."+name+".backupClass", backupClass);
}
System.out.println("#####################################################");
System.out.println(map);
System.out.println("#####################################################");

File propertieFile=BackupRuntime.getPropertiesFile();

if(propertieFile!=null){
	EasyPropertiesUtils.modify(propertieFile, map, "utf-8");
}else{
	session.setAttribute("MSG", "can not found easybackup.properties file!");
}
response.sendRedirect(basePath+"easybackup/configuraions.jsp");
%>