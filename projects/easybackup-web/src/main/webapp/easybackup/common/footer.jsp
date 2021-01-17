<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<footer class="footer">
    <div class="container">
      <p class="text-muted">
 EasyBackup Web Management System v1.1.0 &copy; <a href="http://www.easyproject.cn" target="_blank">easyproject.cn</a> 

	</p>
    </div>
</footer>

<c:if test="${!empty MSG}">
	<script type="text/javascript">
		alert('${MSG}');
	</script>
	
	<c:remove var="MSG" scope="session"/>
</c:if>