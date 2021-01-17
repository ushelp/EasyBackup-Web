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
	<title><%=resourceBundle.getString("new.h1") %> - EasyBackup Web Management System</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">

		<%@include file="common/resource.jsp" %>
	<link rel="stylesheet" href="easybackup/css/github.css">
	<script type="text/javascript">
	
	$(function(){
		
		  //1. 简单写法：
		   $("#fileForm").validation(function(obj,params){
			   if (obj.id=='inputFileName'){
			         $.post('easybackup/do/doNameExists.jsp?v='+new Date(),"name=FILE:"+obj.value,function(data){
			        	 if(data.res){
			 				params.err = true;
					        params.msg = "File <%=resourceBundle.getString("new.exists")%>";
			 			}
			 		},"json");
		       }
		       }
		       ,{icon:true, reqmark:true} //这个参数是设必填不要显示有星号，默认是有星号的
		   );
		   
		   $("#userForm").validation(function(obj,params){
			   if (obj.id=='inputUserName'){
			         $.post('easybackup/do/doNameExists.jsp?v='+new Date(),"name=USER:"+obj.value,function(data){
			        	 if(data.res){
			 				params.err = true;
					        params.msg = "User <%=resourceBundle.getString("new.exists")%>";
			 			}
			 		},"json");
		       }
			   }
		       ,{icon:true, reqmark:true} //这个参数是设必填不要显示有星号，默认是有星号的
		   );
		  
		   $("#addFileSubmit").on('click',function(event){
		     // 2.最后要调用 valid()方法。
		     if ($("#fileForm").valid(this,"error!")==false){
		       return false;
		     }
		   })  
	
		  $("#addUserSubmit").on('click',function(event){
		     // 2.最后要调用 valid()方法。
		     if ($("#userForm").valid(this,"error!")==false){
		       return false;
		     }
		   })  
	
		
		$("[name='type']").on("change",function(){
			var v=$(this).val();
			if(v=="FILE"){
				$("#fileFormDiv").show();
				$("#userFormDiv").hide();
			}else{
				$("#fileFormDiv").hide();
				$("#userFormDiv").show();
			}
		});
	});
	
	</script>
</head>
<body>

	<jsp:include page="common/header.jsp"></jsp:include>

    <div class="container-fluid">
      <div class="row">
 		<jsp:include page="common/menu.jsp">
 			<jsp:param value="new" name="s"/>
 		</jsp:include>
        
        
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
           <h1 class="page-header" ><%=resourceBundle.getString("new.h1") %></h1> 

        <div class="panel panel-default panel-info">
			  <div class="panel-heading">New BackupConfiguration</div>
			  <div class="panel-body">
	
	
<form class="form-horizontal" id="form" role="form">	
  
  <div class="form-group">
    <label for="inputValue" class="col-sm-2 control-label">type</label>
    <div class="col-sm-8">
    <label class="radio-inline">
	  <input type="radio" name="type"  id="inlineRadio1" value="FILE" checked="checked" > File
	</label>
	<label class="radio-inline">
	  <input type="radio" name="type" id="inlineRadio2" value="USER"> User
	</label>
    </div>
  </div>		    
</form>


<div id="fileFormDiv">
<form class="form-horizontal" action="easybackup/do/doNew.jsp" method="post" id="fileForm" role="form">
 
	<input type="hidden" name="type" value="FILE"/>

  <div class="form-group">
    <label for="inputValue" class="col-sm-2 control-label">enable</label>
    <div class="col-sm-8">
    <label class="radio-inline">
	  <input type="radio" name="enable" id="inlineRadio1" value="ON" ${fn:escapeXml(conf.enable?"checked":"") }> <%=resourceBundle.getString("conf.on") %>
	</label>
	<label class="radio-inline">
	  <input type="radio" name="enable" id="inlineRadio2" value="OFF" ${fn:escapeXml(conf.enable?"":"checked") }> <%=resourceBundle.getString("conf.off") %>
	</label>
    </div>
  </div>
  
  <div class="form-group">
	<label for="inputFileName" class="col-sm-2 control-label">name</label>
	<div class="col-sm-8">
	  <input name="name" check-type="required"  required-message="required" value="" type="text" class="form-control" id="inputFileName" placeholder="<%=resourceBundle.getString("conf.name") %>">
		<p class="text-info"><%=resourceBundle.getString("conf.name") %></p>
	</div>
</div>
  <div class="form-group">
	<label for="inputValue" class="col-sm-2 control-label">value</label>
	<div class="col-sm-8">
	  <input name="value" value="" type="text" check-type="required" required-message="required" class="form-control" id="inputValue" placeholder="Backup service targetFile value">
		<p class="text-info"><%=resourceBundle.getString("conf.value") %></p>
	</div>
</div>

  
  <div class="form-group">
	<label for="inputCronExpression" class="col-sm-2 control-label">cronexpression</label>
	<div class="col-sm-8">
	  <input name="cronExpression" check-type="required" required-message="required" value="${fn:escapeXml(conf.cronExpression) }" type="text" class="form-control" id="inputCronExpression" placeholder="cronExpression">
	  <p class="text-info"><%=resourceBundle.getString("conf.cron") %></p>
	</div>
</div>


<div class="form-group">
	<label for="inputDir" class="col-sm-2 control-label">dir</label>
	<div class="col-sm-8">
	  <input name="dir" value="${fn:join(conf.dir, ';')}" check-type="required" required-message="required"  type="text" class="form-control" id="inputDir" placeholder="directory to store the backup file">
	 <p class="text-info"><%=resourceBundle.getString("conf.dir") %></p>
	</div>
	
</div>

<div class="form-group">
	<label for="inputFile" class="col-sm-2 control-label">file</label>
	<div class="col-sm-8">
	  <input name="file" value="${fn:escapeXml(conf.file) }" type="text"  class="form-control" id="inputFile" placeholder="targetFileName-yyyyMMddHHmmssS[.zip|tar|tar.gz]">
		<P class="text-info">
		<%=resourceBundle.getString("conf.file") %>
		</P>
	</div>
	
</div>

<div class="form-group">

 <label for="inputCompress" class="col-sm-2 control-label">compress</label>
    <div class="col-sm-8">
    <label class="radio-inline">
	  <input type="radio" name="compress" id="compressinlineRadio1" value="ON" ${fn:escapeXml(conf.compress?"checked":"") }> <%=resourceBundle.getString("conf.on") %>
	</label>
	<label class="radio-inline">
	  <input type="radio" name="compress" id="compressinlineRadio2" value="OFF" ${fn:escapeXml(conf.compress?"":"checked") }> <%=resourceBundle.getString("conf.off") %>
	</label>
    <p class="text-info">
	<%=resourceBundle.getString("conf.compress") %>
	</p>
    </div>
</div>

<div class="form-group">
<label for="inputCompress" class="col-sm-2 control-label">compressType</label>
	 <div class="col-sm-8">
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
	<div class="col-sm-8">
	  <input name="compressEncoding" value="${fn:escapeXml(conf.compressEncoding) }" type="text" class="form-control" id="inputCompressEncoding" placeholder="default encoding">
	</div>
</div>

<div class="form-group">
<label for="inputdeleteTargetFile" class="col-sm-2 control-label">deleteTargetFile</label>
	 <div class="col-sm-8">
    <label class="radio-inline">
	  <input type="radio" name="deleteTargetFile" id="deleteTargetFileinlineRadio1" value="ON" ${fn:escapeXml(conf.compress?"checked":"") }> <%=resourceBundle.getString("conf.on") %>
	</label>
	<label class="radio-inline">
	  <input type="radio" name="deleteTargetFile" id="deleteTargetFileinlineRadio2" value="OFF" ${fn:escapeXml(conf.compress?"":"checked") }> <%=resourceBundle.getString("conf.off") %>
	</label>
	<p class="text-info">
	<%=resourceBundle.getString("conf.deleteTargetFile") %>
	</p>
    </div>
</div>

<div class="form-group">
	<label for="inputMailReceiver" class="col-sm-2 control-label">mail.receiver</label>
	<div class="col-sm-8">
	  <input name="mailReceiver" value="${fn:escapeXml(fn:join(conf.mailReceiver,';')) }" type="text" class="form-control" id="inputMailReceiver" placeholder="yourmail@domain.com;youmail2@domai2.org">
	<p class="text-info">
	<%=resourceBundle.getString("conf.receiver") %>
	</p>
	</div>
</div>

<div class="form-group">
	<label for="inputMailSender" class="col-sm-2 control-label">mail.sender</label>
	<div class="col-sm-8">
	  <input name="mailSender" value="${fn:escapeXml(conf.mailSender) }" type="text" class="form-control" id="inputMailSender" placeholder="sendermail@domain.com">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderPassword" class="col-sm-2 control-label">mail.sender.password</label>
	<div class="col-sm-8">
	  <input name="mailSenderPassword" value="${fn:escapeXml(conf.mailSenderPassword) }" type="text" class="form-control" id="inputMailSenderPassword" placeholder="mailpassword">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderHost" class="col-sm-2 control-label">mail.sender.host</label>
	<div class="col-sm-8">
	  <input name="mailSenderHost" value="${fn:escapeXml(conf.mailSenderHost) }" type="text" class="form-control" id="inputMailSenderHost" placeholder="smtp.domain.com">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderPort" class="col-sm-2 control-label">mail.sender.port</label>
	<div class="col-sm-8">
	  <input name="mailSenderPort" value="${fn:escapeXml(conf.mailSenderPort) }" type="text" class="form-control" id="inputMailSenderPort" placeholder="25">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderSsl" class="col-sm-2 control-label">mail.sender.ssl</label>
	 <div class="col-sm-8">
    <label class="radio-inline">
	  <input type="radio" name="mailSenderSsl" id="mailSenderSslinlineRadio1" value="true" ${fn:escapeXml(conf.mailSenderSsl?"checked":"") }> <%=resourceBundle.getString("conf.yes") %>
	</label>
	<label class="radio-inline">
	  <input type="radio" name="mailSenderSsl" id="mailSenderSslinlineRadio2" value="false" ${fn:escapeXml(conf.mailSenderSsl?"":"checked") }> <%=resourceBundle.getString("conf.no") %>
	</label>
	<p class="text-info">
	<%=resourceBundle.getString("conf.ssl") %>
	</p>
    </div>
	
</div>



<div class="form-group">
	<label for="inputMailSenderTitle" class="col-sm-2 control-label">mail.sender.title</label>
	<div class="col-sm-8">
	  <input name="mailSenderTitle" value="${fn:escapeXml(conf.mailSenderTitle) }" type="text" class="form-control" id="inputMailSenderTitle" placeholder="Backup ${targetFileName}- EasyBackup">
	<p class="text-info">
	<%=resourceBundle.getString("conf.title") %>
	</p>
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderTemplate" class="col-sm-2 control-label">mail.sender.template</label>
	<div class="col-sm-8">
	  <input name="mailSenderTemplate" value="${fn:escapeXml(conf.mailSenderTemplate) }" type="text" class="form-control" id="inputMailSenderTemplate" placeholder="mail.tpl">
	</div>
</div>

<div class="form-group">
	<label for="inputMailDeleteBackup" class="col-sm-2 control-label">mail.delete.backup</label>
		 <div class="col-sm-8">
    <label class="radio-inline">
	  <input type="radio" name="mailDeleteBackup" id="mailDeleteBackupinlineRadio1" value="ON" ${fn:escapeXml(conf.mailDeleteBackup?"checked":"") }> <%=resourceBundle.getString("conf.on") %>
	</label>
	<label class="radio-inline">
	  <input type="radio" name="mailDeleteBackup" id="mailDeleteBackupinlineRadio2" value="OFF" ${fn:escapeXml(conf.mailDeleteBackup?"":"checked") }> <%=resourceBundle.getString("conf.off") %>
	</label>
	<p class="text-info">
	<%=resourceBundle.getString("conf.deleteBackup") %>
	</p>
    </div>
</div>

<div class="form-group">
	<label for="inputCmdBefore" class="col-sm-2 control-label">cmd.before</label>
	<div class="col-sm-8">
	  <input name="cmdBefore" value="${fn:escapeXml(conf.cmdBefore) }" type="text" class="form-control" id="inputCmdBefore" placeholder="/user/before.sh;/user/before2.sh">
	<p class="text-info">
	<%=resourceBundle.getString("conf.cmdBefore") %>
	</p>
	</div>
</div>

<div class="form-group">
	<label for="inputCmdAfter" class="col-sm-2 control-label">cmd.after</label>
	<div class="col-sm-8">
	  <input name="cmdAfter" value="${fn:escapeXml(conf.cmdAfter) }" type="text" class="form-control" id="inputCmdAfter" placeholder="/user/after.sh;/user/after2.sh">
	</div>
</div>

<div class="form-group">
	<label for="inputBeforeClass" class="col-sm-2 control-label">before.class</label>
	<div class="col-sm-8">
	  <input name="beforeClass" value="${fn:escapeXml(conf.beforeClass) }" type="text" class="form-control" id="inputBeforeClass" placeholder="interceptor.Before;interceptor.Before2">
		<p class="text-info">
		<%=resourceBundle.getString("conf.beforeClass") %>
		</p>
	</div>
</div>

<div class="form-group">
	<label for="inputAfterClass" class="col-sm-2 control-label">after.class</label>
	<div class="col-sm-8">
	  <input name="afterClass" value="${fn:escapeXml(conf.afterClass) }" type="text" class="form-control" id="inputAfterClass" placeholder="interceptor.After;interceptor.Aefore2">
		<p class="text-info">
		<%=resourceBundle.getString("conf.afterClass") %> 
		</p>
	</div>
</div>
<div class="form-group">
	<label for="inputSenders" class="col-sm-2 control-label">senders</label>
	<div class="col-sm-8">
	  <input name="senders" value="" type="text" class="form-control" id="inputSenders" placeholder="package.userSenderClass;package.userSenderClass2">
		<p class="text-info">
		<%=resourceBundle.getString("conf.senders") %>
		</p>
	</div>
</div>

  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-9">
       <button type="submit" class="btn btn-success" id="addFileSubmit"><%=resourceBundle.getString("btn.add") %></button>
	   <button type="reset" class="btn btn-default"><%=resourceBundle.getString("btn.reset") %></button>
    </div>
  </div>
</form>
  
  </div>
  
  
  
  
<div id="userFormDiv" style="display: none;">
  <form class="form-horizontal" id="userForm" action="easybackup/do/doNew.jsp" method="post" role="form">
 
	<input type="hidden" name="type" value="USER"/>
	
	
	 <div class="form-group">
    <label for="inlineRadio1" class="col-sm-2 control-label">enable</label>
    <div class="col-sm-8">
    <label class="radio-inline">
	  <input type="radio" name="enable" id="inlineRadio1" value="ON" ${fn:escapeXml(conf.enable?"checked":"") }> <%=resourceBundle.getString("conf.on") %>
	</label>
	<label class="radio-inline">
	  <input type="radio" name="enable" id="inlineRadio2" value="OFF" ${fn:escapeXml(conf.enable?"":"checked") }> <%=resourceBundle.getString("conf.off") %>
	</label>
    </div>
  </div>
  
  <div class="form-group">
	<label for="inputFileName" class="col-sm-2 control-label">name</label>
	<div class="col-sm-8">
	  <input name="name" check-type="required" required-message="required" value="" type="text" class="form-control" id="inputUserName" placeholder="<%=resourceBundle.getString("conf.name") %>">
		<p class="text-info"><%=resourceBundle.getString("conf.name") %></p>
	</div>
</div>
  <div class="form-group">
	<label for="inputValue" class="col-sm-2 control-label">value</label>
	<div class="col-sm-8">
	  <input name="value" value="" type="text" check-type="required" required-message="required" class="form-control" id="inputValue" placeholder="Backup service targetFile value">
		<p class="text-info"><%=resourceBundle.getString("conf.value") %></p>
	</div>
</div>

  
  <div class="form-group">
	<label for="inputCronExpression" class="col-sm-2 control-label">cronexpression</label>
	<div class="col-sm-8">
	  <input name="cronExpression" check-type="required" required-message="required" value="${fn:escapeXml(conf.cronExpression) }" type="text" class="form-control" id="inputCronExpression" placeholder="cronExpression">
	  <p class="text-info"><%=resourceBundle.getString("conf.cron") %></p>
	</div>
</div>
<div class="form-group">
	<label for="inputDir" class="col-sm-2 control-label">dir</label>
	<div class="col-sm-8">
	  <input name="dir" value="${fn:join(conf.dir, ';')}"   type="text" class="form-control" id="inputDir" placeholder="directory to store the backup file">
	 <p class="text-info"><%=resourceBundle.getString("conf.dir") %></p>
	</div>
</div>
<div class="form-group">
	<label for="inputFile" class="col-sm-2 control-label">file</label>
	<div class="col-sm-8">
	  <input name="file" value="${fn:escapeXml(conf.file) }" type="text"  class="form-control" id="inputFile" placeholder="default backup file name under 'dir' directory">
		<P class="text-info">
		<%=resourceBundle.getString("conf.file") %>
		</P>
	</div>
</div>

<div class="form-group">
	<label for="inputtargetFileClass" class="col-sm-2 control-label">targetFileClass</label>
	<div class="col-sm-8">
	  <input name="targetFileClass" value="" type="text"  class="form-control" id="inputtargetFileClass" placeholder="">
		<P class="text-info">
		<%=resourceBundle.getString("conf.targetFileClass") %>
		</P>
	</div>
</div>


<div class="form-group">
	<label for="inputDirClass" class="col-sm-2 control-label">dirClass</label>
	<div class="col-sm-8">
	  <input name="dirClass" value=""  type="text" class="form-control" id="inputDirClass" placeholder="">
	<P class="text-info">
		<%=resourceBundle.getString("conf.dirClass") %>
		</P>
	</div>
</div>




<div class="form-group">
	<label for="inputFileClass" class="col-sm-2 control-label">fileClass</label>
	<div class="col-sm-8">
	  <input name="fileClass" value="${fn:escapeXml(conf.file) }" type="text"  class="form-control" id="inputFileClass" placeholder="">
			<P class="text-info">
		<%=resourceBundle.getString("conf.fileClass") %>
		</P>
	</div>

</div>

<div class="form-group">
	<label for="inputBackupClass" class="col-sm-2 control-label">backupClass</label>
	<div class="col-sm-8">
	  <input name="backupClass" value="${fn:escapeXml(conf.file) }" type="text"  class="form-control" id="inputBackupClass" placeholder="">
			<P class="text-info">
		<%=resourceBundle.getString("conf.backupClass") %>
		</P>
	</div>
</div>

<div class="form-group">

 <label for="inputCompress" class="col-sm-2 control-label">compress</label>
    <div class="col-sm-8">
    <label class="radio-inline">
	  <input type="radio" name="compress" id="compressinlineRadio1" value="ON" ${fn:escapeXml(conf.compress?"checked":"") }> <%=resourceBundle.getString("conf.on") %>
	</label>
	<label class="radio-inline">
	  <input type="radio" name="compress" id="compressinlineRadio2" value="OFF" ${fn:escapeXml(conf.compress?"":"checked") }> <%=resourceBundle.getString("conf.off") %>
	</label>
    <p class="text-info">
	<%=resourceBundle.getString("conf.compress") %>
	</p>
    </div>
</div>

<div class="form-group">
<label for="inputCompress" class="col-sm-2 control-label">compressType</label>
	 <div class="col-sm-8">
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
	<div class="col-sm-8">
	  <input name="compressEncoding" value="${fn:escapeXml(conf.compressEncoding) }" type="text" class="form-control" id="inputCompressEncoding" placeholder="default encoding">
	</div>
</div>

<div class="form-group">
<label for="inputdeleteTargetFile" class="col-sm-2 control-label">deleteTargetFile</label>
	 <div class="col-sm-8">
    <label class="radio-inline">
	  <input type="radio" name="deleteTargetFile" id="deleteTargetFileinlineRadio1" value="ON" ${fn:escapeXml(conf.compress?"checked":"") }> <%=resourceBundle.getString("conf.on") %>
	</label>
	<label class="radio-inline">
	  <input type="radio" name="deleteTargetFile" id="deleteTargetFileinlineRadio2" value="OFF" ${fn:escapeXml(conf.compress?"":"checked") }> <%=resourceBundle.getString("conf.off") %>
	</label>
	<p class="text-info">
	<%=resourceBundle.getString("conf.deleteTargetFile") %>
	</p>
    </div>
</div>

<div class="form-group">
	<label for="inputMailReceiver" class="col-sm-2 control-label">mail.receiver</label>
	<div class="col-sm-8">
	  <input name="mailReceiver" value="${fn:escapeXml(fn:join(conf.mailReceiver,';')) }" type="text" class="form-control" id="inputMailReceiver" placeholder="yourmail@domain.com;youmail2@domai2.org">
	<p class="text-info">
	<%=resourceBundle.getString("conf.receiver") %>
	</p>
	</div>
</div>

<div class="form-group">
	<label for="inputMailSender" class="col-sm-2 control-label">mail.sender</label>
	<div class="col-sm-8">
	  <input name="mailSender" value="${fn:escapeXml(conf.mailSender) }" type="text" class="form-control" id="inputMailSender" placeholder="sendermail@domain.com">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderPassword" class="col-sm-2 control-label">mail.sender.password</label>
	<div class="col-sm-8">
	  <input name="mailSenderPassword" value="${fn:escapeXml(conf.mailSenderPassword) }" type="text" class="form-control" id="inputMailSenderPassword" placeholder="mailpassword">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderHost" class="col-sm-2 control-label">mail.sender.host</label>
	<div class="col-sm-8">
	  <input name="mailSenderHost" value="${fn:escapeXml(conf.mailSenderHost) }" type="text" class="form-control" id="inputMailSenderHost" placeholder="smtp.domain.com">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderPort" class="col-sm-2 control-label">mail.sender.port</label>
	<div class="col-sm-8">
	  <input name="mailSenderPort" value="${fn:escapeXml(conf.mailSenderPort) }" type="text" class="form-control" id="inputMailSenderPort" placeholder="25">
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderSsl" class="col-sm-2 control-label">mail.sender.ssl</label>
	 <div class="col-sm-8">
    <label class="radio-inline">
	  <input type="radio" name="mailSenderSsl" id="mailSenderSslinlineRadio1" value="true" ${fn:escapeXml(conf.mailSenderSsl?"checked":"") }> <%=resourceBundle.getString("conf.yes") %>
	</label>
	<label class="radio-inline">
	  <input type="radio" name="mailSenderSsl" id="mailSenderSslinlineRadio2" value="false" ${fn:escapeXml(conf.mailSenderSsl?"":"checked") }> <%=resourceBundle.getString("conf.no") %>
	</label>
	<p class="text-info">
	<%=resourceBundle.getString("conf.ssl") %>
	</p>
    </div>
	
</div>



<div class="form-group">
	<label for="inputMailSenderTitle" class="col-sm-2 control-label">mail.sender.title</label>
	<div class="col-sm-8">
	  <input name="mailSenderTitle" value="${fn:escapeXml(conf.mailSenderTitle) }" type="text" class="form-control" id="inputMailSenderTitle" placeholder="Backup ${targetFileName}- EasyBackup">
	<p class="text-info">
	<%=resourceBundle.getString("conf.title") %>
	</p>
	</div>
</div>

<div class="form-group">
	<label for="inputMailSenderTemplate" class="col-sm-2 control-label">mail.sender.template</label>
	<div class="col-sm-8">
	  <input name="mailSenderTemplate" value="${fn:escapeXml(conf.mailSenderTemplate) }" type="text" class="form-control" id="inputMailSenderTemplate" placeholder="mail.tpl">
	</div>
</div>

<div class="form-group">
	<label for="inputMailDeleteBackup" class="col-sm-2 control-label">mail.delete.backup</label>
		 <div class="col-sm-8">
    <label class="radio-inline">
	  <input type="radio" name="mailDeleteBackup" id="mailDeleteBackupinlineRadio1" value="ON" ${fn:escapeXml(conf.mailDeleteBackup?"checked":"") }> <%=resourceBundle.getString("conf.on") %>
	</label>
	<label class="radio-inline">
	  <input type="radio" name="mailDeleteBackup" id="mailDeleteBackupinlineRadio2" value="OFF" ${fn:escapeXml(conf.mailDeleteBackup?"":"checked") }> <%=resourceBundle.getString("conf.off") %>
	</label>
	<p class="text-info">
	<%=resourceBundle.getString("conf.deleteBackup") %>
	</p>
    </div>
</div>

<div class="form-group">
	<label for="inputCmdBefore" class="col-sm-2 control-label">cmd.before</label>
	<div class="col-sm-8">
	  <input name="cmdBefore" value="${fn:escapeXml(conf.cmdBefore) }" type="text" class="form-control" id="inputCmdBefore" placeholder="/user/before.sh;/user/before2.sh">
	<p class="text-info">
	<%=resourceBundle.getString("conf.cmdBefore") %>
	</p>
	</div>
</div>

<div class="form-group">
	<label for="inputCmdAfter" class="col-sm-2 control-label">cmd.after</label>
	<div class="col-sm-8">
	  <input name="cmdAfter" value="${fn:escapeXml(conf.cmdAfter) }" type="text" class="form-control" id="inputCmdAfter" placeholder="/user/after.sh;/user/after2.sh">
	</div>
</div>

<div class="form-group">
	<label for="inputBeforeClass" class="col-sm-2 control-label">before.class</label>
	<div class="col-sm-8">
	  <input name="beforeClass" value="${fn:escapeXml(conf.beforeClass) }" type="text" class="form-control" id="inputBeforeClass" placeholder="interceptor.Before;interceptor.Before2">
		<p class="text-info">
		<%=resourceBundle.getString("conf.beforeClass") %>
		</p>
	</div>
</div>

<div class="form-group">
	<label for="inputAfterClass" class="col-sm-2 control-label">after.class</label>
	<div class="col-sm-8">
	  <input name="afterClass" value="${fn:escapeXml(conf.afterClass) }" type="text" class="form-control" id="inputAfterClass" placeholder="interceptor.After;interceptor.Aefore2">
		<p class="text-info">
		<%=resourceBundle.getString("conf.afterClass") %> 
		</p>
	</div>
</div>
<div class="form-group">
	<label for="inputSenders" class="col-sm-2 control-label">senders</label>
	<div class="col-sm-8">
	  <input name="senders" value="" type="text" class="form-control" id="inputSenders" placeholder="package.userSenderClass;package.userSenderClass2">
		<p class="text-info">
		<%=resourceBundle.getString("conf.senders") %>
		</p>
	</div>
</div>
  
    <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-9">
	      <button type="submit" class="btn btn-success" id="addUserSubmit"><%=resourceBundle.getString("btn.add") %></button>
	      <button type="reset" class="btn btn-default"><%=resourceBundle.getString("btn.reset") %></button>
	    </div>
	  </div>
  </form>
</div>


  </div>
</div>
        
     </div>
   </div>
 </div>


<%@ include file="common/footer.jsp"%>
</body>
</html>