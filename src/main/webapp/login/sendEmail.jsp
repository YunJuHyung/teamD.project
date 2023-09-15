<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="sendemail.EmailService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String receivefromuser= request.getParameter("demo-email");

	EmailService.getemail(receivefromuser);

	

%>

<script type="text/javascript">

	alert("인증메일 전송 완료");
	alert("회원가입 페이지로 돌아갑니다.");
	alert(history.back());



</script>
</body>
</html>