<%@page import="teamD.project.dto.MuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
    <title>당신마켓</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/NewFile.css" />
</head>
<body class="is-preload">
<%
// 세션에서 로그인한 사용자 정보를 가져옴
MuserDto user = (MuserDto) session.getAttribute("user");

// 로그인한 사용자 정보가 없을 경우 로그인 페이지로 리다이렉트
if (user == null) {
    response.sendRedirect("../login/login.jsp");
} else {
    // 로그인한 사용자 정보를 이용하여 쪽지를 보내는 기능을 수행
    String sender = user.getId();
%>
    <!-- Header -->
<header id="header">
            <a class="logo" href="${pageContext.request.contextPath}">당신마켓 <span>by koreait.project.teamD</span></a>
            <nav>
           
            </nav>
         </header>

    

    <!-- 쪽지 보내기 폼 -->
    <h3 style="text-align: center;">쪽지읽기</h3>
    <br>
    
        <!-- 받는 사람은 입력 받도록 유지 -->
        <table>
        	<tr>
		        <td>보낸 사람</td>
		        <td><c:out value="${byidx.sendid }"/></td>
		    </tr>    
		      
		    <tr>
		        <!-- 쪽지 내용 입력 필드 -->
		        <td><label for="message">내용</label></td>
		        <td><textarea id="message" name="message" rows="4" cols="50" readonly style="width:300px; height:200px;">${byidx.message }</textarea></td>
		
		    </tr>
        </table>
        <div style="text-align: center;">
		     <input type="button" value="확인" onclick="window.close()"/>
		     <input type="submit" value="답장하기" onclick="gowrite('${byidx.sendid }')"/>
		</div>
    
<script type="text/javascript">
	function gowrite(sendid){
		window.open("${pageContext.request.contextPath}/message/writemessage.jsp?reciveid="+sendid,"쪽지 읽기","width=450, height=530, left=500, top=250");
	}
</script>
</body>
</html>
<%
}
%>
