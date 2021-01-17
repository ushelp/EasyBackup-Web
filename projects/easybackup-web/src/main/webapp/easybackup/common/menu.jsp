<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ include file="i18n.jsp" %>
<div class="col-sm-3 col-md-2 sidebar">
   <h4 class="page-header" style="font-size:20px ;color: #FF6600;margin-bottom:10px; margin-top:0; font-weight: bold;"><%=resourceBundle.getString("nav.title") %></h4>
   <ul class="nav nav-sidebar">
     <li ${param.s=='dashboard'?'class="active"':'' }><a href="easybackup/dashboard.jsp"><%=resourceBundle.getString("nav.dashboard") %></a></li>
     <li ${param.s=='configurations'?'class="active"':'' }><a href="easybackup/configuraions.jsp"><%=resourceBundle.getString("nav.configurations") %></a></li>
     <li ${param.s=='new'?'class="active"':'' }><a href="easybackup/do/toNew.jsp"><%=resourceBundle.getString("nav.new") %></a></li>
     <li ${param.s=='globalConfiguration'?'class="active"':'' }><a href="easybackup/do/toGlobal.jsp"><%=resourceBundle.getString("nav.global") %></a></li>
     <li ${param.s=='help'?'class="active"':'' }><a href="easybackup/help.jsp"><%=resourceBundle.getString("nav.help") %></a></li>
   </ul>
 </div>