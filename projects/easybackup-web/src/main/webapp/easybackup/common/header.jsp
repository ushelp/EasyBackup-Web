<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="i18n.jsp" %>
<nav class="navbar navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#"><%=resourceBundle.getString("header.title") %></a>
      </div>
      <div>
      <div class="navRight" >
       <div class="navbar-right" id="help" style="line-height: 60px;padding-right: 20px;">
          <a href="#" onclick="window.location.href='easybackup/do/changeLanguage.jsp?lang=zh_CN&loc='+window.location.href;return false;" style="color:#ffffff;">中文</a> 
          |
          <a href="#" onclick="window.location.href='easybackup/do/changeLanguage.jsp?lang=en&loc='+window.location.href;return false;" style="color:#ffffff;">English</a>
      </div> 
      <div class="navbar-right" style="color:${started?'#009933':'#CC3333' }; font-weight: bold;line-height: 60px;padding-right: 10px;">
      	<c:if test="${started }">
      	<%=resourceBundle.getString("status.started") %>
      	</c:if>
      	<c:if test="${!started }">
      	<%=resourceBundle.getString("status.stoped") %>
      	</c:if>
      </div>
      </div>
    </div>
  </div>
</nav>
