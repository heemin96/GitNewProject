<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="mysql.date.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="mysql.date.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//dao에서 list 가져오기
	ShopDao dao=new ShopDao();
	List<ShopDto> list=dao.getSangpumList();
	
	//json 형태로 변환
	JSONArray arr=new JSONArray();
	for(ShopDto dto:list)
	{
		JSONObject ob=new JSONObject();
		ob.put("sangpum",dto.getSangpum());
		ob.put("photo", dto.getPhoto());
		ob.put("color", dto.getColor());
		ob.put("price", dto.getPrice());
		ob.put("cnt", dto.getCnt());
		ob.put("ipgoday", dto.getIpgoday());
		ob.put("num",dto.getNum());
		
		//arr에 추가
		arr.add(ob);
	}
%>
<%=arr.toString()%>