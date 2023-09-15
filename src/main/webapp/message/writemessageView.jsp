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

    <!-- Header -->
<header id="header">
            <a class="logo" href="${pageContext.request.contextPath}">당신마켓 <span>by koreait.project.teamD</span></a>
            <nav>
           
            </nav>
         </header>

    

    <!-- 쪽지 보내기 폼 -->
    <h3 style="text-align: center;">쪽지 보내기</h3>
    <br>
    <form action="writemessageAction.jsp" method="get">
        <!-- 받는 사람은 입력 받도록 유지 -->
        <table>
        	<tr>
		        <td>받는 사람</td>
		        <td><input type="text" readonly name="reciveid" value="${reciver }"/></td>
		    </tr>    
		      
		    <tr>
		        <!-- 쪽지 내용 입력 필드 -->
		        <td><label for="message">내용</label></td>
		        <td><textarea id="message" name="message" rows="4" cols="50" required style="width:300px; height:200px;"></textarea></td>
		
		    </tr>
		        <!-- sender 파라미터로 로그인한 사용자 정보 전달 -->
		     <tr style="background-color: white;">   
		        <td ><input type="hidden" name="sendid" value="${user.id}" ></td>
		        <td colspan="2" style="float:right;"><input type="submit" value="쪽지 보내기" ></td>
		     </tr>
        </table>
    </form>

</body>
</html>

