<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="mysql.date.StuDao"%>
<%@page import="mysql.date.Studto"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StuDao dao = new StuDao();
	List<Studto> list=dao.getallDatas();
%>

<list> 
	<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	for(Studto dto:list)
	{%>
	<stu>
		<num><%=dto.getNum()%></num>
		<name><%=dto.getName()%></name>
		<hp><%=dto.getHp()%></hp>
		<photo><%=dto.getPhoto()%></photo>
		<addr><%=dto.getAddr()%></addr>
		<writeday><%=sdf.format(dto.getWriteday())%></writeday> 
	</stu>
	<%}
	%>
	</list>