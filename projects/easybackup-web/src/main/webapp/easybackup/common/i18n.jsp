<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Locale locale=request.getLocale();

if(session.getAttribute("locale")!=null){
	locale=(Locale)session.getAttribute("locale");
}


if(request.getParameter("lang")!=null){
	String lang=request.getParameter("lang");
	String language=lang;
	String country=null;
	try{
		if(lang.indexOf("_")!=-1){
			language=lang.split("_")[0];
			country=lang.split("_")[1];
			locale=new Locale(language,country);
		}else{
			locale=new Locale(language);
		}
		session.setAttribute("locale", locale);
	}catch(Exception e){
	}
}


ResourceBundle resourceBundle=ResourceBundle.getBundle("easybackup",locale);
%>