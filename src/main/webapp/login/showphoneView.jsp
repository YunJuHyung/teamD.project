<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신마켓</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body>
	<div class="box" style=" display:inline-grid; width: 550px; margin: 150px 100px 150px 200px; box-shadow: 6px 6px 10px lightblue;">
	<h3><c:out value ="${dto.name }"/>님의 연락처는 <c:out value="${dto.phone }"/> 입니다</h3>
	<h4>판매하실 분에게 연락해주세요!</h4>
	<button class="button small" onclick="gowrite('${dto.id}')">쪽지 보내기</button>
	<button class="button small" onclick="closewindow()">확인</button>
	</div>
	<script type="text/javascript">
		function closewindow(){
			window.close()
		}
		function gowrite(sendid){
			window.open("${pageContext.request.contextPath}/message/writemessage.jsp?reciveid="+sendid,"쪽지 읽기","width=450, height=530, left=500, top=250");
		}
		
	</script>
</body>
</html>