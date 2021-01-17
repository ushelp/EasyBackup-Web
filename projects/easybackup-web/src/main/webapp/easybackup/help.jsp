<%@page import="cn.easyproject.easybackup.BackupRuntime" %>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="common/common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<base href="<%=basePath%>">
	<title><%=resourceBundle.getString("help.h1") %> - EasyBackup Web Management System</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">

	<%@include file="common/resource.jsp" %>
	<link rel="stylesheet" href="easybackup/css/github.css">
</head>
<body>

	<jsp:include page="common/header.jsp"></jsp:include>

    <div class="container-fluid">
      <div class="row">
 		<jsp:include page="common/menu.jsp">
 			<jsp:param value="help" name="s"/>
 		</jsp:include>
        
        
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
           <h1 class="page-header" ><%=resourceBundle.getString("help.h1") %></h1> 

			<P>
			<a href="https://github.com/ushelp/EasyBackup" class="btn btn-default">EasyBackup GitHub</a>
			<a href="http://www.easyproject.cn/easybackup" class="btn btn-default">EasyBackup Home</a>
			</P>
			
        	<h2 class="page-header" >Configuration Example</h2>
           <jsp:include page="common/help.jsp"></jsp:include>
           

        
           
        </div>
      </div>
    </div>


<%@ include file="common/footer.jsp"%>
</body>
</html>