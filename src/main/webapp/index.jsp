<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>

<html>
   <head>
      <title>당신마켓</title>
      <style>
	  </style>
      
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <link rel="stylesheet" href="assets/css/main.css" />
      
   </head>
   <body class="is-preload">

      <!-- Header -->
         <header id="header">
            <a class="logo" href="index.jsp">당신마켓<span>by koreait.project.teamD</span></a>
            <nav>
           <c:if test="${user==null }">
               <a href="${pageContext.request.contextPath}/login/login.jsp">로그인</a>
               <a href="${pageContext.request.contextPath}/login/join.jsp">회원가입</a>
               <a href="#menu">메뉴</a>
           </c:if>
            <c:if test="${user!=null }">
               <a href="${pageContext.request.contextPath}/login/logout.jsp">로그아웃</a>
               <a href="${pageContext.request.contextPath}/login/mypage.jsp">마이페이지</a>
               <a href="#menu">메뉴</a>
            </c:if>>
            </nav>
         </header>

      <!-- Nav -->
         <nav id="menu">
            <ul class="links">
               <li><a href="index.jsp">홈</a></li>
               <li><a href="product/buy.jsp">판매상품</a></li>
               <li><a href="javascript:sell()">판매등록</a></li>
               <li><a href="community/community.jsp">커뮤니티</a></li>
               <li><a href="community/service.jsp">고객센터</a></li>
            </ul>
         </nav>
<script type="text/javascript">
	function sell() {
		let yn
		if('${user.id}'==''){
			yn=confirm('판매등록은 로그인이 필요합니다. 로그인 하시겠습니까?')
			if(yn) location.href='${pageContext.request.contextPath}/login/login.jsp?back=s'  // 로그인 후 글쓰기 url로 redirect 하기 위한 파라미터
		}else{
			location.href='${pageContext.request.contextPath}/product/sell.jsp?page=${paging.currentPage }'
		}
	}
</script>



      <!-- Banner -->
         <div id="banner">
            <div class="inner">
               <span class="icon fa-gem"></span>
               <h1>당신의 신발 당신마켓</h1>
               <p>신발 찾고!<br /> 신발 팔고!</p>
               <ul class="actions stacked">
                  <li><a href="product/buy.jsp" class="button large primary">판매상품</a></li>
                  <li><a href="product/sell.jsp" class="button large">판매등록</a></li>
               </ul>
            </div>
         </div>
      <!-- Two -->
       <jsp:include page="product/product.jsp"></jsp:include>

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
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
         

   </body>
</html>