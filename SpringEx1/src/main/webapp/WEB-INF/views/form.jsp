<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<style>
 #sub{
 	margin-left:200px;
 }
</style>
</head>
<body>
<form id="form" action="form"> 
	<b>이 름 : </b>
	<input type= "text" name="name" class="form-control" style="width:120px;">
	<br>
	
	<b>나 이 :</b>
	<input type="text" name="age" class="form-control" style="width:120px;">
	<br>
	
	<b>여행하고 싶은 나라 : </b>
	<select name="nara">
		<option value="하와이">하와이</option>
		<option value="미국">미국</option>
		<option value="프랑스">프랑스</option>
		<option value="스페인">스페인</option>
	</select>	
	<br>
	
	<button type="submit" id="sub">전 송</button>	
	
</form>
<!-- param.name 이 비어있지 않을경우에만 출력하라 -->
<c:if test="${!empty param.name}"> <!-- c태그 쓰려면 3행 무조건 있어야 한다 -->
이 름 : ${param.name}<br>
나 이 : ${param.age}<br> 
</c:if>
	
<!-- 나이가 20세 이상이면 파랑색으로 xxx님은 성인 입니다 
20세 미만이면 빨강색으로 xxx님은 미성년자 입니다-->
<c:if test="${param.age>=20}">
	<h2 style="color:blue">${param.name }님은 성인입니다</h2>

</c:if>

<c:if test="${param.age<20}" >
	<h2 style="color:red">${param.name }님은 미성년자입니다</h2>

</c:if>

<c:set var="nara" value="${param.nara }"/>
<h2>선택한 나라는 ${nara}입니다</h2>
<c:if test="${nara=='미국'}">
	<h3 style="background-color:orange">미국은 아름다운 나라입니다</h3>
</c:if>

<c:if test="${nara=='하와이'}">
	<h3 style="background-color:pink">하와이 바다는 아름답습니다</h3>
</c:if>

<c:if test="${nara=='프랑스'}">
	<h3 style="background-color:yellow">프랑스 에펠탑은 최고입니다</h3>
</c:if>

<c:if test="${nara=='스페인'}">
	<h3 style="background-color:orange">스페인은 정말 아름다운 나라입니다</h3>
</c:if>

<c:choose>
	<c:when test="${nara=='미국'}">
		<h1>다음달에 미국 여행갑니다</h1>
	</c:when>
	
	<c:when test="${nara=='하와이'}">
		<h1>올해안에 하와이 여행갈거야!!!</h1>
	</c:when>
	
	<c:otherwise>
		<h1>${nara} 언제 여행간다구요??</h1>
	</c:otherwise>
</c:choose>
<hr>

<c:if test="${nara=='미국' or nara=='하와이'}">
	<h1>선택한 나라는 ${nara} 입니다</h1>
</c:if>

<!-- 나이가 20에서 50 사이면 "상금 50만원 드립니다" -->
<c:if test="${param.age>=20 and param.age<=50}">
	<h1>상금 50만원 드립니다</h1>
</c:if>


</body>
</html>