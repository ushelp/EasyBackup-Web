<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../common/i18n.jsp" %>

<%
response.sendRedirect(request.getParameter("loc"));
%>
