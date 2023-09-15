<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
               <a href="${pageContext.request.contextPath}/login/mypage.jsp">마이페이지
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
		<section id="two" class="wrapper style1">
		<form action="update.jsp" method="post">
		<div class="box" style=" display:inline-grid; width: 50em; margin-left: 30em ; box-shadow: 6px 6px 10px lightblue; ">
			<h2 style="text-align: center;">정보 수정</h2>
			<br>
            	<h3 style="text-align: center;"><c:out value="내 정보"/></h3>
            	<table>
            		<tr style="background-color: transparent;">
            			<td style="text-align:right; "><c:out value="ID : "/></td>
            			<td><input type="text" value="${user.id }"name="id" style="width:250px;" readonly/></td>
            		</tr> 
            		<tr style="background-color: transparent;">
            			<td style="text-align:right; "><c:out value="비밀번호 : "/></td>
            			<td><input type="password" name="password" style="width:250px;" /></td>
            		</tr> 
            		<tr style="background-color: transparent;">
            			<td style="text-align:right; "><c:out value="비밀번호 확인 : "/></td>
            			<td><input type="password" name="password2" style="width:250px;"/></td>
            		</tr> 
            		<tr style="background-color: transparent;">
            			<td style="text-align:right; width:40%;"><c:out value="이름 : "/></td>
            			<td><input type="text" value="${user.name }" name="name" style="width:250px;"/></td>
            		</tr>
            		<tr style="background-color: transparent;">
            			<td style="text-align:right;"><c:out value="닉네임 : "/></td> 
            			<td><input type="text" name="nickname" style="width:250px;" placeholder="${user.nickname }"/></td>
            		</tr> 
            		<tr style="background-color: transparent;">
            			<td style="text-align:right;"><c:out value="생년월일 : "/></td>
            			<td><input type="text" value="${user.birth }" name="birth" style="width:250px" readonly /></td>
            		</tr> 
            		<tr style="background-color: transparent;">
            			<td style="text-align:right;"><c:out value="주소 : "/></td>
            			<td><input type="text" name="address" style="width:250px;" placeholder="${user.address }"/></td> 
            		</tr>
            		<tr style="background-color: transparent;">
            			<td style="text-align:right;"><c:out value="전화번호 : "/></td>
            			<c:if test="${user.phone != null }">
            				<td><input type="text" name="address" style="width:250px;" placeholder="${user.phone }"/></td>
            			</c:if> 
            			<c:if test="${user.phone == null }">
            				<td><input type="text" name="address" style="width:250px;" placeholder="등록된 전화번호가 없습니다."/></td>
            			</c:if> 
            		</tr>
            		<tr>
            			<td colspan="2" style="text-align: center;"><button type="submit" class="button primary" >수정하기</button>
            			<a href="mypage.jsp"  class="button primary" >취소하기</a></td>
            		</tr>
            	</table>
            	</div>	
		</form>
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
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			
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