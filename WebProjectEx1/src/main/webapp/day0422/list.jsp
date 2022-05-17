<%@page import="org.json.simple.JSONArray"%>
<%@page import="mysql.date.GuestDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="mysql.date.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	//json 배열타입으로 나오도록 코딩
	//날짜는 년월일 시분까지만 나오게 SimpleDateFormat
	
	//목록 가져오기
	GuestDao dao=new GuestDao();
	List<GuestDto> list=dao.getAllGuest();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:MM");
	
	JSONArray arr=new JSONArray();
	for(GuestDto dto:list)
	{
	
		JSONObject ob =new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("writer",dto.getWriter());
		ob.put("avata",dto.getAvata());
		ob.put("content",dto.getContent());
		ob.put("writeday",sdf.format(dto.getWriteday())); //문자는 반드시 따움표가 있어야 함 
		
		//arr에 추가
		arr.add(ob);
	}
%>
<%=arr.toString()%>