<%@page import="cn.easyproject.easybackup.configuration.BackupConfiguration"%>
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
	<title><%=resourceBundle.getString("configurations.h1") %> - EasyBackup Web Management System</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">

	<%@include file="common/resource.jsp" %>
	<style type="text/css">
	.table th{ 
		text-align: center; 
		height:38px;
		vertical-align: middle;
	}
	</style>
</head>
<body>
	<%
	List<BackupConfiguration> backupConfigs=BackupRuntime.getBackupsConfigurations();
	
	String sort="name";
	String order="asc";
	
	
	if(request.getParameter("s")!=null){
		sort=request.getParameter("s");
	}
	if(request.getParameter("o")!=null){
		order=request.getParameter("o");
	}
	
	final String sort2=sort;
	final String order2=order;
	
	Collections.sort(backupConfigs, new Comparator<BackupConfiguration>(){
		public int compare(BackupConfiguration o1, BackupConfiguration o2){
			if(order2.equals("asc")){
				if(sort2.equals("type")){
					return o1.getType().compareTo(o2.getType());
				}else if(sort2.equals("enable")){
					return o1.getEnable().compareTo(o2.getEnable());
				}
				
				return o1.getName().compareTo(o2.getName());
			}
			if(sort2.equals("type")){
				return o2.getType().compareTo(o1.getType());
			}else if(sort2.equals("enable")){
				return o2.getEnable().compareTo(o1.getEnable());
			}
			return o2.getName().compareTo(o1.getName());
		}
	});
	
	request.setAttribute("backupConfigs", backupConfigs);
	%>

  <jsp:include page="common/header.jsp"></jsp:include>

    <div class="container-fluid">
      <div class="row">
        <jsp:include page="common/menu.jsp">
 			<jsp:param value="configurations" name="s"/>
 		</jsp:include>
 		
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header" >
			<%=resourceBundle.getString("configurations.h1") %>
			</h1>
            <div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading"><%=resourceBundle.getString("configurations.table.header") %></div>
           <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered">
              <thead> 
                <tr class="info" align="center">
                  <th>#</th>
                  <th onclick="sort('type')" style="min-width:70px; cursor: pointer;" id="thType">Type</th>
                  <th onclick="sort('name')" style="min-width:80px; cursor: pointer;" id="thName">Name</th>
                  <th>Value(TargetFile)</th>
                  <th>Backup to information</th>
                  <th onclick="sort('enable')" style="min-width:85px;cursor: pointer;" id="thEnable">Enable</th>
                  <th>&nbsp;</th>
                </tr>
              </thead>
              <tbody>
              <c:if test="${fn:length(backupConfigs)==0 }">
              	<tr>
              		<td colspan="6" align="center">
              		<%=resourceBundle.getString("configurations.nolist") %>
              		</td>
              	</tr>
              </c:if>
              <c:forEach items="${backupConfigs }" var="conf" varStatus="s">
                <%
                  	  	pageContext.setAttribute("trCls", "");
                 %>
                 <c:set value="${fn:escapeXml(conf.type)}:${fn:escapeXml(conf.name)}" var="n" scope="page"></c:set>
                  <c:forEach items="${errorBackups }" var="conf2" >
                 <c:set value="${fn:escapeXml(conf2.type)}:${fn:escapeXml(conf2.name)}" var="n2" scope="page"></c:set>
                  	  <c:if test="${n==n2}">
                  	  	<%
                  	  	pageContext.setAttribute("trCls", "class=\"danger\"");
                  	  	%>
                  	  </c:if>
                  </c:forEach>
	                  
	               <tr valign="middle" ${trCls }> 
                  
                  <td style="vertical-align: middle;" class="active" valign="middle" >${fn:escapeXml(s.count) }</td>
                  <td style="vertical-align: middle;" align="center">${fn:escapeXml(conf.type) }</td>
                  <td style="vertical-align: middle;" style="font-weight: bold;">${fn:escapeXml(conf.name) }</td>
                  <td style="vertical-align: middle;">
                	 <span class="text-info"> ${fn:escapeXml(conf.value) }</span>
                  </td>
                  <td style="vertical-align: middle;">
	                  <strong class="text-primary">CronExpression</strong>：<span class="text-info">${fn:escapeXml(conf.cronExpression) }</span><br>
	                  <strong class="text-primary">Directory</strong>：<span class="text-info">${fn:escapeXml(fn:join(conf.dir,';')) }</span><br>
	                  <strong class="text-primary">FileName</strong>：<span class="text-info">${empty conf.file?'targetFileName-yyyyMMddHHmmssS[.zip|tar|tar.gz]':fn:escapeXml(conf.file) }</span><br>
	                  <strong class="text-primary">Compression</strong>：<span class="text-info">${fn:escapeXml(conf.compress?"ON":"OFF") }</span><br>
	                  <c:if test="${conf.type=='USER' }">
	                  	<c:if test="${!empty conf.targetFileClass}">
	                  	<strong class="text-primary">targetFileClass</strong>：<span class="text-info">${fn:escapeXml(conf.targetFileClass) }</span><br>
	                  	</c:if>
	                  	<c:if test="${!empty conf.dirClass}">
	                  	<strong class="text-primary">dirClass</strong>：<span class="text-info">${fn:escapeXml(conf.dirClass) }</span><br>
	                  	</c:if>
	                  	<c:if test="${!empty conf.fileClass}">
	                  	<strong class="text-primary">fileClass</strong>：<span class="text-info">${fn:escapeXml(conf.fileClass) }</span><br>
	                  	</c:if>
	                  	<c:if test="${!empty conf.backupClass}">
	                  	<strong class="text-primary">backupClass</strong>：<span class="text-info">${fn:escapeXml(conf.backupClass) }</span><br>
	                	 </c:if>
	                  </c:if>
	                  <strong class="text-primary">Mail receiver</strong>：<span class="text-info">${fn:escapeXml(fn:join(conf.mailReceiver,';')) }</span><br>
                  </td>
                  <td align="center" style="vertical-align: middle;color:${conf.enable?"#33CC00":"#FF3333" }"> ${fn:escapeXml(conf.enable?"ON":"OFF") }</td>
                  <td style="vertical-align: middle;" align="center">  
	                   <c:if test="${fn:escapeXml(conf.enable) }">
	                	  <a href="easybackup/do/doEnable.jsp?v=OFF&t=${fn:escapeXml(conf.type) }&name=${fn:escapeXml(conf.name) }" class="btn btn-xs btn-warning" style="width: 54px; margin: 5px;" role="button"><%=resourceBundle.getString("configurations.btn.disable") %></a> <br/>
	                   </c:if>
					  <c:if test="${!conf.enable }">
	                 	 <a href="easybackup/do/doEnable.jsp?v=ON&t=${fn:escapeXml(conf.type) }&name=${fn:escapeXml(conf.name) }" class="btn btn-xs btn-success" style="width: 54px; margin: 5px;" role="button"><%=resourceBundle.getString("configurations.btn.enable") %></a><br/>
					  </c:if>
	                  <a href="easybackup/do/toEdit.jsp?t=${fn:escapeXml(conf.type) }&name=${fn:escapeXml(conf.name) }" style="width: 54px; margin: 5px;" class="btn btn-xs btn-info" role="button"><%=resourceBundle.getString("configurations.btn.detail") %></a><br/>
	                  <a href="easybackup/do/doDelete.jsp?t=${fn:escapeXml(conf.type) }&name=${fn:escapeXml(conf.name) }" style="width: 54px; margin: 5px;" onclick="return confirm('<%=resourceBundle.getString("msg.delete")%>')" class="btn btn-xs btn-danger" role="button"><%=resourceBundle.getString("configurations.btn.delete") %></a>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            </div>
		</div>
        
           
        </div>
      </div>
    </div>


<%@ include file="common/footer.jsp"%>
<script type="text/javascript">
	var nowSort='<%=sort2%>';
	var nowOrder='<%=order2%>';

	var up='<span class="glyphicon glyphicon-arrow-up"></span>';
	var down='<span class="glyphicon glyphicon-arrow-down"></span>';
	
	if(nowSort=="name"){
		var th=$("#thName");
		th.html(th.html()+" "+(nowOrder=="asc"?up:down));
	}else if(nowSort=="type"){
		var th=$("#thType");
		th.html(th.html()+" "+(nowOrder=="asc"?up:down));
	}else if(nowSort=="enable"){
		var th=$("#thEnable");
		th.html(th.html()+" "+(nowOrder=="asc"?up:down));
	}
	function sort(s){
		if(s==nowSort){
			nowOrder=(nowOrder=="asc"?"desc":"asc");
		}else{
			nowSort=s;
			nowOrder="asc";
		}
		window.location.href='easybackup/configuraions.jsp?s='+nowSort+'&o='+nowOrder;
	}
</script>
</body>
</html>