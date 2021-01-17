<%@page import="cn.easyproject.easybackup.BackupRuntime"%>
<%@page import="cn.easyproject.easybackup.configuration.BackupConfiguration"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String name=request.getParameter("name");
String type=request.getParameter("t");
List<BackupConfiguration> backupConfigs=BackupRuntime.getBackupsConfigurations();

BackupConfiguration conf=null;

for(BackupConfiguration c:backupConfigs){
	if(c.getName().equals(name)){
		conf=c;
		break;
	}
}

if(conf!=null&& type!=null){
	request.setAttribute("conf", conf);
	if(type.equalsIgnoreCase("file")){
		request.getRequestDispatcher("/easybackup/detailFile.jsp").forward(request, response);
	}else{
		
		request.getRequestDispatcher("/easybackup/detailUser.jsp").forward(request, response);
	}
}else{
	session.setAttribute("MSG", "BackupConfiguration not exists!");
	response.sendRedirect(basePath+"easybackup/configuraions.jsp");
}
%>