<%@page import="mysql.date.GuestDao"%>
<%@page import="mysql.date.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%

 	//한글 엔코딩
	request.setCharacterEncoding("UTF-8");
	
 	//데이타 읽기
	String num=request.getParameter("num");
	String writer=request.getParameter("writer");
	String avata=request.getParameter("avata");
	String content=request.getParameter("content");
		
	//dto
	GuestDto dto=new GuestDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setAvata(avata);
	dto.setContent(content);

	//dao
	GuestDao dao=new GuestDao();
	
	//insert메서드 호출
	dao.guestUpdate(dto);
 	
%>
 
 