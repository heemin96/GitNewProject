<%@page import="mysql.date.StuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	//num읽기
	String num=request.getParameter("num");
	//dao선언
	StuDao dao = new StuDao();
	
	//delete 메서드 호출
	dao.deleteStudent(num);
	
	%>