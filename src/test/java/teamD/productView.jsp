<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>당신마켓</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <link rel="stylesheet" href="assets/css/main.css" />
      
   </head>
   <body class="is-preload">

      <!-- Header -->
         <header id="header">
            <a class="logo" href="${pageContext.request.contextPath}/index.jsp">당신마켓 <span>by koreait.project.teamD</span></a>
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
            </c:if>
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
			if(yn) location.href='${pageContext.request.contextPath}/login/login.jsp?back=w'  // 로그인 후 글쓰기 url로 redirect 하기 위한 파라미터
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
         <section id="two" class="wrapper style1">
            <div class="inner">
               <header class="heading major">
                  <h2>최근 등록 상품</h2>
               </header>
               <div class="spotlights">
                  	<c:forEach begin="0" end="5" var="vo1" items = "${recentlist }">
                  <div class="spotlight">
                     <article>
                        <a href="#" class="image fit"><img src="/projectupload/${vo1.picture}" alt="" /></a>
                        <div class="content">
                           <h3><c:out value="${vo1.pname }" /></h3>
                           <p>ID : <c:out value ="${vo1.id }"/></p>
                           <p>가격 : <c:out value ="${vo1.price }"/></p>
                           <p>등록날짜 : <fmt:formatDate value ="${vo1.createAt }"/></p> 
                           <p>사이즈 : <c:out value ="${vo1.psize }"/></p>
                           <ul class="actions special">
                              <li><a href="product/detail.jsp?pcode=${vo1.pcode }" class="button primary">상세보기</a></li>
                           </ul>
                        </div>
                     </article>
                  </div>
                     </c:forEach>
                     <a style="margin: auto;" href="product/buy.jsp" class="button small">더보기</a>
               </div>
            </div>
         </section>

      <section id="two" class="wrapper style1">
            <div class="inner">
               <header class="heading major">
                  <h2>인기 상품</h2>
               </header>
               <div class="spotlights">
                  	<c:forEach begin="0" end="5" var="vo1" items = "${mostlist }">
                  <div class="spotlight">
                     <article>
                        <a href="#" class="image fit"><img src="/projectupload/${vo1.picture}" alt="" /></a>
                        <div class="content">
                           <h3><c:out value="${vo1.pname }" /></h3>
                           <p>ID : <c:out value ="${vo1.id }"/></p>
                           <p>가격 : <c:out value ="${vo1.price }"/></p>
                           <p>등록날짜 : <fmt:formatDate value ="${vo1.createAt }"/></p> 
                           <p>사이즈 : <c:out value ="${vo1.psize }"/></p>
                           <ul class="actions special">
                              <li><a href="product/detail.jsp?pcode=${vo1.pcode }" class="button primary">상세보기</a></li>
                           </ul>
                        </div>
                     </article>
                  </div>
                     </c:forEach>
                     <a style="margin: auto;" href="product/buy.jsp" class="button small">더보기</a>
               </div>
            </div>
         </section>

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