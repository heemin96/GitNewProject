<%@page import="mysql.date.ShopDao"%>
<%@page import="mysql.date.ShopDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//데이타 읽기
	String sangpum=request.getParameter("sangpum");
	String color=request.getParameter("color");
	String ipgoday=request.getParameter("ipgoday");
	String photo=request.getParameter("photo");
	int cnt=Integer.parseInt(request.getParameter("cnt"));
	int price;
	try{
		price=Integer.parseInt(request.getParameter("price"));
	
	}catch(NumberFormatException e){
		//문자가 섞여있을경우 발생
		price=0;
	}
	
	//dto에 넣기
	ShopDto dto=new ShopDto();
	dto.setSangpum(sangpum);
	dto.setColor(color);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setCnt(cnt);
	dto.setIpgoday(ipgoday);
	
	//dao선언
	ShopDao dao=new ShopDao();
	//insert 메서드 호출
	dao.shopInsert(dto);			
%>
	