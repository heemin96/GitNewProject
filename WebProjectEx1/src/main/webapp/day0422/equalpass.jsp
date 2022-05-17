<%@page import="org.json.simple.JSONObject"%>
<%@page import="mysql.date.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	//dao선언
	
	GuestDao dao=new GuestDao();
	boolean b=dao.isEqualPass(num, pass);
	if(b){
		//비번이 맞을경우 삭제
		dao. guestDelete(num);
	}
	JSONObject ob=new JSONObject();
	ob.put("result",String.valueOf(b)); // valueof = 오버로딩? 
%>
<%=ob.toString()%>