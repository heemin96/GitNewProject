<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
	body *{
		font-size:2rem;
		font-family: 'Jua';
		}
</style>
<%
	//form tag읽이 get방식일경우
	String name =request.getParameter("name");
	String email=request.getParameter("email");
	String driver=request.getParameter("driver"); //체크시 on, 해제 null
%>

<body>
	<b>이 름 : </b><%=name%><br>
	<b>이 메 일 : </b><%=email%><br>
	<b>운 전 면  허: </b><%=driver==null?"없음":"있음"%><br>

</body>
</html>