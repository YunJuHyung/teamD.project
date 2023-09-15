<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Venue by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
	    <title>당신마켓</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/community.css" />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
   </head>
   <body class="is-preload">

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
			<main id="write">
		<header class="heading major">
		<h2 style="padding-top: 50px;">당신마켓 공지사항</h2>
			</header>
	
		<form name="frm1" method="post" action="servicewriteAction.jsp" onsubmit="return isValid()" style="padding: 20px 100px; margin: auto;">
<table>
   <tr>
   <th>제목</th>
   <td>
     <input type="text" name="title" size="50">
   </td>
   </tr>
   <tr>
   <!-- 작성자는 문제점을 발견하기 위한 추가 사항이고 나중에는 삭제합니다. -->
   <th>작성자</th>
   <td>
     <input type="text" name="writer" size="50" value="${user.id }">
   </td>
      <tr><th>내용</th> <!-- textarea 의 크기 : rows="30" cols="80 -->
         <td>
            <textarea rows="20" cols="80" name="content"></textarea>
         </td>
      </tr>
      <tr>
      <td colspan="2" align="center">
         <button type="submit">저장</button>
         <button type="reset">다시쓰기</button>
         <button type="button" onclick="location.href='list.jsp'">목록</button>
        
			  </td>
      </tr>
        </table>
			</form>
			</main>
        
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
			
			
			
<script type="text/javascript">
   function isValid(){
      let result = true   //유효성 검사 결과 저장
      const content = document.forms[0].content      //input 요소 지정
      const title = document.forms[0].title      //input 요소 지정
      
      
      if(title.value == ''){
         alert('글 제목 작성은 필수 입니다.')
         result = false
         title.focus()
      }
      
      return result;
      
      }
   }
   // 유효성 검사를 위해서 저장 버튼 타입을 submit 으로 두는 방법도 있습니다.
   // 그 때는 form 태그에 onsubmit="return isValid()" 
   //   => isValid 함수 실행한 리턴이 true 일 때만 submit 합니다.
</script>
    

	</body>
</html>