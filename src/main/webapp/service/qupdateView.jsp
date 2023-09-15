<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>

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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	
	<style type="text/css">
	.badge{
	background-color: #FF0000;
	
	}
	.dropdown-item{
	width: 260px;
	overflow: auto;
	} 


  #message::-webkit-scrollbar {
                width: 7px; /*스크롤바의 너비*/
            }
 
            #message::-webkit-scrollbar-thumb {
                background-color: #4cbfaf; /*스크롤바의 색상*/
            }
 
            #message::-webkit-scrollbar-track {
                background-color: white; /*스크롤바 트랙 색상*/
            }
	.start-100 {
    left: 80%!important;
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
               <a href="${pageContext.request.contextPath}/mypage.jsp">마이페이지
 				<span class="badge text-bg-secondary"><c:out value="${requestcount}"/></span>
               </a>
               <button class="button primary dropdown-toggle" type="button"  data-bs-toggle="dropdown" aria-expanded="false" style="padding: 0 10px 0 10px;" >
  				쪽지 <i class="bi bi-envelope"></i>
  				</button>
 			 <div class="dropdown-menu" style="overflow-y: scroll; height: 300px;" id="message">
  				<c:forEach var="talkvo" items="${messagelist }">
  					<c:if test="${talkvo.status ==0 }">
  				  		<li class="dropdown-item" onclick="openmessage('${talkvo.m_idx}')"><c:out value="${talkvo.sendid }님의 메세지 입니다." />
  				    		<span class="position-absolute translate-middle p-2 bg-danger border border-light rounded-circle start-100 " style="margin-top: 23px; margin-left: 38px;"></span>
    						<span class="visually-hidden">New alerts</span>
  				  	    </li>
  				 	</c:if>
  				 	<c:if test="${talkvo.status==1 }">
  				 		<li class="dropdown-item" onclick="openmessage('${talkvo.m_idx}')"><c:out value="${talkvo.sendid }님의 메세지 입니다." />
  				 			<span class="visually-hidden">New alerts</span>
  				 	</c:if>
  				</c:forEach>
  			</div>
  			
  		<script type="text/javascript">
  		function openmessage(m_idx){
  	      window.open("${pageContext.request.contextPath}/message/getmessage.jsp?m_idx="+m_idx,"쪽지 읽기","width=450, height=530, left=500, top=250")
  	   }		
  		</script>	
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
			<h3 style="justify-content: center; text-align: center;">당신마켓 Q&A</h3>
			<p style="justify-content: center; text-align: center;">글 내용 수정</p>
	<hr style="color:white;">
	
	<form name="frm1" method="post" action="qupdateAction.jsp" style="padding: 20px 100px; margin: auto;">
   <input type="hidden" name="idx" value="${vo1.idx }">
   <input type="hidden" name="page" value="${page }">
<table >
   <tr><th>제목</th>
      <td>
         <c:choose> 
            <c:when test="${fn:contains(vo1.title,'[수정]')}"> 
               <input type="text" name="title" size="50" value="${vo1.title }" readonly>
            </c:when>
            <c:otherwise>
               <input type="text" name="title" size="50" value="[수정]${vo1.title }"readonly>
            </c:otherwise>
         </c:choose>
      </td>
      </tr>
      <tr>
         <th>작성자</th>
         <td><input type="text" name="writer" size="50" value="${vo1.writer }"disabled></td>
      </tr>
      <tr>
         <th>작성 날짜</th> <!-- 수정할 값이 아니므로 화면에 표시만 합니다. -->
         <td><c:out value="${vo1.createdAt }"/></td>
      </tr>
      
      <tr><th>내용</th> <!-- textarea 의 크기 : rows="30" cols="80 -->
         <td>
            <textarea rows="15" cols="80" name="content" required><c:out value="${vo1.content }"/></textarea>
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
			 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
const scrollSpy = new bootstrap.ScrollSpy(document.body, {
  target: '#navbar-example'
})
</script>
			

	</body>
</html>