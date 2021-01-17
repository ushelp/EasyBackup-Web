<%@page import="cn.easyproject.easybackup.BackupRuntime"%>
<%@page import="cn.easyproject.easybackup.EasyBackup"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="i18n.jsp" %>

<%
	// USE CDN load css&js
	boolean bootstrapCDN=false;

	// others
	request.setAttribute("started", BackupRuntime.started); 
	
	request.setAttribute("bootstrapCDN", bootstrapCDN);
%>