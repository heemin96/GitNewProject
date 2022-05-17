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



</head>
<body>
	<%=msg%><br>
	
	<%! //선언문 : 서블릿으로 변환시 멤버 변수로 등록
	String msg="happy day";
	%>
	
	<%//scriptlet,자바영역,서블릿으로 변환시 지역변수로 등록 
	String msg2="안녕하세요!";
	%>
	<!-- 출력은 표현식으로 출력: 소스보기에서 보임 -->
	<%--jsp 주석 :소스보기에서 안보임 --%>
	<%=msg%><br>
	<%=msg2%><br>
	
	<%
		String []str={"red","orange","blue","pink","cyan","magenta"};
	
	%>
	
	<table class="table table-bordered" style="width: 200px;">
	<%
		for(String s:str){%>
			<tr>
				<th><%=s%></th>
				<td bgcolor="<%=s%>">color</td>
			</tr>
		
			
		<% }
	%>
	
	</table>
</body>
</html>