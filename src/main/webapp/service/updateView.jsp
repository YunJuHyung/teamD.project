<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<!--
	Venue by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
	<meta charset="UTF-8">
		<title>당신마켓</title>
		<meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<style type="text/css">
	.badge{
	background-color: #FF0000;
	
	}
	
	</style>
     
      
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
               
 <span class="badge text-bg-secondary"><c:out value="${requestcount}"/></span>
               <a href="#menu">메뉴</a>
            </c:if> 
            </nav>
         </header>

		<!-- Nav -->
		<nav>
			<ul class="links">
            <li><a href="${pageContext.request.contextPath}">홈</a></li>
            <li><a href="${pageContext.request.contextPath}/product/buy.jsp">판매상품</a></li>
            <li><a href="${pageContext.request.contextPath}/product/sell.jsp">판매등록</a></li>
            <li><a href="${pageContext.request.contextPath}/community/community.jsp">커뮤니티</a></li>
            <li><a href="${pageContext.request.contextPath}/service/service.jsp">고객센터</a></li>
        </ul>
    </nav>
			
			<main id="write">
			<h3 style="justify-content: center; text-align: center;">당신마켓 커뮤니티</h3>
			<p style="justify-content: center; text-align: center;">글 내용 수정</p>
	<hr style="color:white;">
	
	<form name="frm1" method="post" action="updateAction.jsp" style="padding: 20px 100px; margin: auto;">
   <input type="hidden" name="idx" value="${vo.idx }">
   <input type="hidden" name="page" value="${page }">
   <!-- 현재페이지 번호 전달 - 순서5) post 로 전달해야 하므로 hidden type 으로 저장 -->
<table >
   <tr><th>제목</th>
      <td>
         <c:choose> 
            <c:when test="${fn:contains(vo.title,'[수정]')}"> 
               <input type="text" name="title" size="50" value="${vo.title }" readonly>
            </c:when>
            <c:otherwise>
               <input type="text" name="title" size="50" value="[수정]${vo.title }"readonly>
            </c:otherwise>
         </c:choose>
         <!-- readonly : 입력불가 -->
      </td>
      </tr>
      <tr>
         <th>작성자</th>
         <td><input type="text" name="writer" size="50" value="${vo.writer }"disabled></td>
         <!-- disabled : 입력불가 + 파라미터 전송 못 함 -->
      </tr>
      <tr>
         <th>작성 날짜</th> <!-- 수정할 값이 아니므로 화면에 표시만 합니다. -->
         <td><c:out value="${vo.createdAt }"/></td>
      </tr>
      
      <tr><th>내용</th> <!-- textarea 의 크기 : rows="30" cols="80 -->
         <td>
            <textarea rows="15" cols="80" name="content" required><c:out value="${vo.content }"/></textarea>
         </td>
      </tr>
      <tr>
      <td colspan="2" align="center">
         <button type="button"onclick="isValid()">저장</button><!-- 유효성검사 후 자바스크립트에서 submit. (hrd_mvc2 프로젝트 유효성 검사 참고 -->
         <button type="button" onclick="location.href='read.jsp?'">취소</button>
          <!-- 현재페이지 번호 전달 - 순서5) -->
      </td>
      </tr>
</table>
</form>
         </main>
<script type="text/javascript">
   function isValid(){
      let result = true   //유효성 검사 결과 저장
      const content = document.forms[0].content      //input 요소 지정
      if(content.value == ''){
         alert('글 내용 작성은 필수 입니다.')
         result = false
         content.focus()
      }
      
      if(result){
         document.forms[0].submit()
      }
   }
   //유효성 검사를 위해서 저장 버튼 타입을 submit 으로 두는 방법도 있습니다.
   //그 때는 form 태그에 onsubmit="return isValid()"   => isValid 함수 실행한 리턴이 true 일 때만 submit 합니다.
</script>


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