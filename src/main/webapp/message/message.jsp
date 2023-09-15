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
           <c:if test="${user==null }">
               <a href="${pageContext.request.contextPath}/login/login.jsp">로그인</a>
               <a href="${pageContext.request.contextPath}/login/join.jsp">회원가입</a>
               <a href="#menu">메뉴</a>
           </c:if>
            <c:if test="${user!=null }">
               <a href="${pageContext.request.contextPath}/login/logout.jsp">로그아웃</a>
               <a href="${pageContext.request.contextPath}/mypage.jsp">마이페이지</a>
               <a href="#menu">메뉴</a>
            </c:if> 
            </nav>
         </header>

    <!-- Nav -->
    <nav id="menu">
        <ul class="links">
            <li><a href="${pageContext.request.contextPath}">홈</a></li>
            <li><a href="${pageContext.request.contextPath}/product/buy.jsp">판매상품</a></li>
            <li><a href="${pageContext.request.contextPath}/product/sell.jsp">판매등록</a></li>
            <li><a href="${pageContext.request.contextPath}/community/community.jsp">커뮤니티</a></li>
            <li><a href="${pageContext.request.contextPath}/service/service.jsp">고객센터</a></li>
        </ul>
    </nav>

    <!-- 쪽지 보내기 폼 -->
    <h1>쪽지 보내기</h1>
    <form action="sendmessage.jsp" method="post">
        <!-- 받는 사람은 입력 받도록 유지 -->
        <label for="recipient">받는 사람:</label>
        <input type="text" id="recipient" name="recipient" required><br><br>

        <!-- 쪽지 내용 입력 필드 -->
        <label for="message">쪽지 내용:</label><br>
        <textarea id="message" name="message" rows="4" cols="50" required></textarea><br><br>

        <!-- sender 파라미터로 로그인한 사용자 정보 전달 -->
        <input type="hidden" name="sender" value="<%= sender %>">

        <input type="submit" value="쪽지 보내기">
    </form>

    <!-- Footer -->
    <section id="footer">
        <div class="inner">
            <ul class="icons">
                <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                <li><a href="#" class="icon solid fa-map-marker-alt"><span class="label">Location</span></a></li>
                <li><a href="#" class="icon solid fa-phone"><span class="label">Phone</span></a></li>
                <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
            </ul>
        </div>
        <div class="copyright">
            &copy; Untitled. All rights reserved.
        </div>
    </section>

    <!-- Scripts -->
    <script src="https://kit.fontawesome.com/b69711df0e.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
<%
}
%>
