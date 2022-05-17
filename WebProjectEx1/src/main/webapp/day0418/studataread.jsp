<%@page import="mysql.date.StuDao"%>
<%@page import="mysql.date.Studto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 엔코딩 > 포스트로 보낼려면 필요함
	request.setCharacterEncoding("utf-8");
	//값 읽기
	String name=request.getParameter("name");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr");
	String photo=request.getParameter("photo");
	
	//dto에 넣기
	Studto dto=new Studto();
	dto.setName(name);
	dto.setHp(hp);
	dto.setAddr(addr);
	dto.setPhoto(photo);
	
	// dao 선언
	StuDao dao= new StuDao();
	//insert
	dao.insertStudent(dto);
	%>
	
	