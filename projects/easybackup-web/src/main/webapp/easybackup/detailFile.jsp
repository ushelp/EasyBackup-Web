<%@page import="cn.easyproject.easybackup.BackupRuntime"%>
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
	<title>Detail - EasyBackup Web Management System</title>
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
 			<jsp:param value="configurations" name="s"/>
 		</jsp:include>


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">${fn:escapeXml(conf.name)} - ${fn:escapeXml(conf.type)}</h1>
			<div class="panel panel-default panel-info">
			  <div class="panel-heading">Detail&Edit</div>
			  <div class="panel-body">
			    

<form class="form-horizontal" method="post" action="easybackup/do/doEdit.jsp">
  <input type="hidden" name="name" value="${fn:escapeXml(conf.name)}"/>
  <input type="hidden" name="type" value="${fn:escapeXml(conf.type)}"/>
	
  <div class="form-group">
    <label for="inputValue" class="col-sm-2 control-label">enable</label>
    <div class="col-sm-6">
    <label class="radio-inline">
	  <input type="radio" name="enable" id="inlineRadio1" value="ON" ${conf.enable?"checked":"" }> ON
	</label>
	<label class="radio-inline">
	  <input type="radio" name="enable" id="inlineRadio2" value="OFF" ${conf.enable?"":"checked" }> OFF
	</label>
    </div>
  </div>
  
    <div class="form-group">
		<label for="inputValue" class="col-sm-2 control-label">value</label>
		<div class="col-sm-6">
		<input name="value" value="${fn:escapeXml(conf.value)}" type="text" check-type="required" required-message="required" class="form-control" id="inputValue" placeholder="Backup service targetFile value">
		</div>
		<div class="col-sm-4 text-info "> 
		<p class=""><%=resourceBundle.getString("conf.value") %></p> 
		</div>
	</div>
  
  
  <div class="form-group">
	<label for="inputCronExpression" class="col-sm-2 control-label">cronExpression</label>
	<div class="col-sm-6">
	  <input name="cronExpression" value="${fn:escapeXml(conf.cronExpression)}" type="text" class="form-control" id="inputCronExpression" placeholder="cronExpression">
	</div>
	<div class="col-sm-4 text-info "> 
	 <p class=""><%=resourceBundle.getString("conf.cron") %></p>
	</div>
</div>


<div class="form-group">
	<label for="inputDir" class="col-sm-2 control-label">dir</label>
	<div class="col-sm-6">
	  <input name="dir" value="${fn:escapeXml(fn:join(conf.dir, ';'))}" type="text" class="form-control" id="inputDir" placeholder="directory to store the backup file">
	</div>
	<div class="col-sm-4 text-info"> 
	 <p class=""><%=resourceBundle.getString("conf.dir") %></p>
	</div>
</div>

<div class="form-group">
	<label for="inputFile" class="col-sm-2 control-label">file</label>
	<div class="col-sm-6">
	  <input name="file" value="${fn:escapeXml(conf.file)}" type="text" class="form-control" id="inputFile" placeholder="targetFileName-yyyyMMddHHmmssS[.zip|tar|tar.gz]">
	</div>
	<div class="col-sm-4 text-info"> <p class="">
	<%=resourceBundle.getString("conf.file") %></p></div>
</div>

<div class="form-group">

 <label for="inputCompress" class="col-sm-2 control-label">compress</label>
    <div class="col-sm-6">
    <label class="radio-inline">
	  <input type="radio" name="compress" id="compressinlineRadio1" value="ON" ${conf.compress?"checked":"" }> ON
	</label>
	<label class="radio-inline">
	  <input type="radio" name="compress" id="compressinlineRadio2" value="OFF" ${conf.compress?"":"checked" }> OFF
	</label>
    </div>
    <div class="col-sm-4 text-info"> <p class="">
	<%=resourceBundle.getString("conf.compress") %></p>
	</div>
</div>

<div class="form-group">
<label for="inputCompress" class="col-sm-2 control-label">compressType</label>
	 <div class="col-sm-6">
    <label class="radio-inline">
	  <input type="radio" name="compressType" id="compressTypeinlineRadio1" value="ZIP" ${conf.compressType=="ZIP"?"checked":"" }> ZIP
	</label>
	<label class="radio-inline">
	  <input type="radio" name="compressType" id="compressTypeinlineRadio2" value="GZIP" ${conf.compressType=="GZIP"?"checked":"" }> GZIP
	</label>
	<label class="radio-inline">
	  <input type="radio" name="compressType" id="compressTypeinlineRadio2" value="TAR" ${conf.compressType=="TAR"?"checked":"" }> TAR
	</label>
    </div>
</div>

<div class="form-group">
	<label for="inputCompressEncoding" class="col-sm-2 control-label">compressEncoding</label>
	<div class="col-sm-6">
	  <input name="compressEncoding" value="${fn:escapeXml(conf.compressEncoding)}" type="text" class="form-control" id="inputCompressEncoding" placeholder="default encoding">
	</div>
</div>

<div class="form-group">
<label for="inputdeleteTargetFile" class="col-sm-2 control-label">deleteTargetFile</label>
	 <div class="col-sm-6">
    <label class="radio-inline">
	  <input type="radio" name="deleteTargetFile" id="deleteTargetFileinlineRadio1" value="ON" ${conf.compress?"checked":"" }> ON
	</label>
	<label class="radio-inline">
	  <input type="radio" name="deleteTargetFile" id="deleteTargetFileinlineRadio2" value="OFF" ${conf.compress?"":"checked" }> OFF
	</label>
    </div>
	<div class="col-sm-4 text-info"> <p class="">
	<%=resourceBundle.getString("conf.deleteTargetFile") %></p>
	</div>
</div>

<div class="form-group">
	<label for="inputMailReceiver" class="col-sm-2 control-label">mail.receiver</label>
	<div class="col-sm-6">
	  <input name="mailReceiver" value="${fn:escapeXml(fn:join(conf.mailReceiver,';')) }" type="text" class="form-control" id="inputMailReceiver" placeholder="yourmail@domain.com;youmail2@domai2.org">
	</div>
	<div class="col-sm-4 text-info"> <p class="">
	<%=resourceBundle.getString("conf.receiver") %></p>
	</div>
</div>

<div class="form-group">
	<label for="inputMailSender" class="col-sm-2 control-label">mail.sender</label>
	<div class="col-sm-6">
	  <input name="mailSender" value="${fn:escapeXml(conf.mailSender)}" type="text" class="form-control" id="inputMailSender" placeholder="sendermail@domain.com">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderPassword" class="col-sm-2 control-label">mail.sender.password</label>
	<div class="col-sm-6">
	  <input name="mailSenderPassword" value="${fn:escapeXml(conf.mailSenderPassword)}" type="text" class="form-control" id="inputMailSenderPassword" placeholder="mailpassword">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderHost" class="col-sm-2 control-label">mail.sender.host</label>
	<div class="col-sm-6">
	  <input name="mailSenderHost" value="${fn:escapeXml(conf.mailSenderHost)}" type="text" class="form-control" id="inputMailSenderHost" placeholder="smtp.domain.com">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderPort" class="col-sm-2 control-label">mail.sender.port</label>
	<div class="col-sm-6">
	  <input name="mailSenderPort" value="${fn:escapeXml(conf.mailSenderPort)}" type="text" class="form-control" id="inputMailSenderPort" placeholder="25">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderSsl" class="col-sm-2 control-label">mail.sender.ssl</label>
	 <div class="col-sm-6">
    <label class="radio-inline">
	  <input type="radio" name="mailSenderSsl" id="mailSenderSslinlineRadio1" value="true" ${conf.mailSenderSsl?"checked":"" }> YES
	</label>
	<label class="radio-inline">
	  <input type="radio" name="mailSenderSsl" id="mailSenderSslinlineRadio2" value="false" ${conf.mailSenderSsl?"":"checked" }> NO
	</label>
    </div>
	<div class="col-sm-4 text-info"> <p class="">
	<%=resourceBundle.getString("conf.ssl") %></p>
	</div>
	
</div>



<div class="form-group">
	<label for="inputMailSenderTitle" class="col-sm-2 control-label">mail.sender.title</label>
	<div class="col-sm-6">
	  <input name="mailSenderTitle" value="${fn:escapeXml(conf.mailSenderTitle)}" type="text" class="form-control" id="inputMailSenderTitle" placeholder="Backup ${targetFileName}- EasyBackup">
	</div>
	<div class="col-sm-4 text-info"><p class="">
	<%=resourceBundle.getString("conf.title") %></p>
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderTemplate" class="col-sm-2 control-label">mail.sender.template</label>
	<div class="col-sm-6">
	  <input name="mailSenderTemplate" value="${fn:escapeXml(conf.mailSenderTemplate)}" type="text" class="form-control" id="inputMailSenderTemplate" placeholder="mail.tpl">
	</div>
</div>

<div class="form-group">
	<label for="inputMailDeleteBackup" class="col-sm-2 control-label">mail.delete.backup</label>
		 <div class="col-sm-6">
    <label class="radio-inline">
	  <input type="radio" name="mailDeleteBackup" id="mailDeleteBackupinlineRadio1" value="ON" ${conf.mailDeleteBackup?"checked":"" }> ON
	</label>
	<label class="radio-inline">
	  <input type="radio" name="mailDeleteBackup" id="mailDeleteBackupinlineRadio2" value="OFF" ${conf.mailDeleteBackup?"":"checked" }> OFF
	</label>
    </div>
	<div class="col-sm-4 text-info"> <p class="">
	<%=resourceBundle.getString("conf.deleteBackup") %></p>
	</div>
</div>

<div class="form-group">
	<label for="inputCmdBefore" class="col-sm-2 control-label">cmd.before</label>
	<div class="col-sm-6">
	  <input name="cmdBefore" value="${fn:escapeXml(fn:join(conf.cmdBefore,';')) }" type="text" class="form-control" id="inputCmdBefore" placeholder="/user/before.sh;/user/before2.sh">
	</div>
	<div class="col-sm-4 text-info"> 
	<p class=""><%=resourceBundle.getString("conf.cmdBefore") %></p></div>
</div>

<div class="form-group">
	<label for="inputCmdAfter" class="col-sm-2 control-label">cmd.after</label>
	<div class="col-sm-6">
	  <input name="cmdAfter" value="${fn:escapeXml(fn:join(conf.cmdAfter,';')) }" type="text" class="form-control" id="inputCmdAfter" placeholder="/user/after.sh;/user/after2.sh">
	</div>
</div>

<div class="form-group">
	<label for="inputBeforeClass" class="col-sm-2 control-label">before.class</label>
	<div class="col-sm-6">
	  <input name="beforeClass" value="${fn:escapeXml(fn:join(conf.beforeClass,';')) }" type="text" class="form-control" id="inputBeforeClass" placeholder="interceptor.Before;interceptor.Before2">
	</div>
	<div class="col-sm-4 text-info"> 
	<p class=""><%=resourceBundle.getString("conf.beforeClass") %></p>
		</div>
</div>

<div class="form-group">
	<label for="inputAfterClass" class="col-sm-2 control-label">after.class</label>
	<div class="col-sm-6">
	  <input name="afterClass" value="${fn:escapeXml(fn:join(conf.afterClass,';')) }" type="text" class="form-control" id="inputAfterClass" placeholder="interceptor.After;interceptor.Aefore2">
	</div>
	<div class="col-sm-4 text-info"> 
	<p class=""><%=resourceBundle.getString("conf.afterClass") %></p>
		</div>
</div>
<div class="form-group">
	<label for="inputSenders" class="col-sm-2 control-label">senders</label>
	<div class="col-sm-6">
	  <input name="senders" value="${fn:escapeXml(conf.sendersString) }" type="text" class="form-control" id="inputSenders" placeholder="package.userSenderClass;package.userSenderClass2">
	</div>
	<div class="col-sm-4 text-info"> 
	<p class="">
		<%=resourceBundle.getString("conf.senders") %>
		</p>
		</div>
</div>
  

  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success"><%=resourceBundle.getString("btn.update") %></button>
      <button type="reset" class="btn btn-default"><%=resourceBundle.getString("btn.reset") %></button>
      
    </div>
  </div>
</form>











			  </div>
			</div>
        
           
        </div>
      </div>
    </div>


<%@ include file="common/footer.jsp"%>
</body>
</html>