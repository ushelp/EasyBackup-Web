<%@page import="cn.easyproject.easybackup.BackupRuntime"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="common/common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("allBackupsCount", BackupRuntime.getBackupNames().size());
	request.setAttribute("enableBackupsCount", BackupRuntime.getEnableBackupsConfigurations().size());
	request.setAttribute("errorBackups", BackupRuntime.errorJobBackupsOnStartup);
	request.setAttribute("runningBackups", BackupRuntime.runningBackupsOnStartup);


%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<base href="<%=basePath%>">
	<title>EasyBackup Web Management System</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">

	<%@include file="common/resource.jsp" %>
</head>
<body>

	<jsp:include page="common/header.jsp"></jsp:include>

    <div class="container-fluid">
      <div class="row">
 		<jsp:include page="common/menu.jsp">
 			<jsp:param value="dashboard" name="s"/>
 		</jsp:include>
        
        
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header" ><%=resourceBundle.getString("dashboard.h1") %></h1>
            
             <div style="margin: 15px 0; font-size: 22px">
            <%=resourceBundle.getString("dashboard.tip") %> <span style="font-weight:bold; color:${started?'#009933':'#CC3333' }"><c:if test="${started }">
      	<%=resourceBundle.getString("status.started") %>
      	</c:if>
      	<c:if test="${!started }">
      	<%=resourceBundle.getString("status.stoped") %>
      	</c:if>.</span>
            </div>
            
          
            
            <p class="row" style="margin-left: 1px;">
            	<button onclick="if(confirm('<%=resourceBundle.getString("dashboard.startup.tip") %>')){window.location.href='easybackup/do/startup.jsp'}" style="width: 150px;margin-right: 25px;" type="button" class="btn btn-success btn-lg " ${started?'disabled="disabled"':''}><%=resourceBundle.getString("dashboard.startup") %></button>
			  	<button onclick="if(confirm('<%=resourceBundle.getString("dashboard.shutdown.tip") %>')){window.location.href='easybackup/do/shutdown.jsp'}" style="width: 150px" type="button" class="btn btn-danger btn-lg" ${started?'':'disabled="disabled"'}><%=resourceBundle.getString("dashboard.shutdown") %></button>
			</p>

           <h2 class="sub-header"><%=resourceBundle.getString("dashboard.h2") %></h2>
           <div class="row" style="text-align: center; margin-left: 1px;">
            <div class="" style="float:left; margin-right: 25px">
              <div id="all">
              ${allBackupsCount }
              </div>
               <h4><%=resourceBundle.getString("dashboard.all") %></h4>
              <span class="text-muted"><%=resourceBundle.getString("dashboard.all2") %></span>
            </div>
            
             <div class="" style="float:left;margin-right: 25px ">
              <div id="enable">
              ${enableBackupsCount }
              </div>
              <h4><%=resourceBundle.getString("dashboard.enable") %></h4>
              <span class="text-muted"><%=resourceBundle.getString("dashboard.enable2") %></span>
            </div>
            
             <div class="" style="float:left;margin-right: 25px ">
              <div id="running">
              ${fn:length(runningBackups) }
              </div>
              <h4><%=resourceBundle.getString("dashboard.run") %></h4>
              <span class="text-muted"><%=resourceBundle.getString("dashboard.run2") %></span>
            </div>
             <div class="" style="float:left; ">
              <div id="error">
              <c:if test="${fn:length(errorBackups)==0 }">
              ${fn:length(errorBackups) }
              </c:if>
              <c:if test="${fn:length(errorBackups)>0 }">
              	<a href="easybackup/configuraions_errors.jsp" style="text-decoration: underline;color: #ffffff;">${fn:length(errorBackups) }</a>
              </c:if>
              
              </div>
              <h4><%=resourceBundle.getString("dashboard.error") %></h4>
              <span class="text-muted"><%=resourceBundle.getString("dashboard.error2") %></span>
            </div>
            <div class="col-xs-8 col-md-12"></div>
          </div>

        
           
        </div>
      </div>
    </div>


<%@ include file="common/footer.jsp"%>
</body>
</html>