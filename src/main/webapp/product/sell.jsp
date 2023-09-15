<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

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
		input{
			margin : 10px 0 10px 0;
			width: 50%;
		}
		
		img {
			width : 350px;
			height : 300px;
			margin-left : 450px;
		}

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
				<a class="logo" href="${pageContext.request.contextPath}/index.jsp">당신마켓 <span>by koreait.project.teamD</span></a>
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
					<li><a href="${pageContext.request.contextPath}/index.jsp">홈</a></li>
					<li><a href="buy.jsp">판매상품</a></li>
					<li><a href="javascript:sell()">판매등록</a></li>
					<li><a href="${pageContext.request.contextPath}/community/community.jsp">커뮤니티</a></li>
					<li><a href="${pageContext.request.contextPath}/service/service.jsp">고객센터</a></li>
				</ul>
			</nav>
<!-- 로그인 하였을때 판매등록 가능 -->			
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
			
		<!-- section -->
         <section id="two" class="wrapper style1">
            <div class="inner">
               <header class="heading major">
                  <h2>판매 등록</h2>
               </header>
               <div class="row" >
                        <form action="sellAction.jsp" method="post" enctype="multipart/form-data">
                        	<div class="col-4" >
						   <img id="preview" src="../images/photo.png" alt="" style="margin-bottom: 50px;">
						   <script>
						   window.onload = function() {
							   thumbnail();
						   };
						   </script>
						   <textarea rows="30" cols="80" name="content" style="height: 350px; width: 800px; margin-left: 225px;" placeholder="상품 정보를 최대한 상세하게 적어주세요."></textarea>
						   </div>
						   <div style="margin-left: auto;">
								<input type="text" name="pname" placeholder="상품명을 입력하시오." required="required" >
								<input type="text" name="price" placeholder="가격을 입력하시오" required="required">
								<input type="text" name="brand" placeholder="브랜드 입력하시오" required="required">
								<input type="text" name="psize" placeholder="사이즈를 입력하시오" required="required">
						   <select name="category" id="category">
						   <option value="">- 종류를 골라주세요 -</option>
						      <option value="운동화">운동화</option>
						      <option value="단화">단화</option>
						      <option value="워커">워커</option>
						      <option value="슬리퍼">슬리퍼</option>
						   </select>
						   <br>
						   <p style="margin-bottom: 5px; color: #585858;" >※ 배경제거 후 등록해주세요. ※</p>
						   <a href="https://www.remove.bg/ko" style="color: black;" target="_blank">배경 제거(https://www.remove.bg/ko)</a>
						   <br>
						   <label for="image">
						   <a class="button primary icon solid fa-search" style="margin : 10px 0px 0 0;">이미지 등록</a>
						 <input class="button primary icon solid fa-search" type="file" name="picture" id="image"  accept="image/*"
						onchange="thumbnail(event);" style="display: none;" >
						   </label>
						 <button class="button primary" >등록하기</button>
                        </div>
						<!-- <button>전송</button> -->
						</form>
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
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/sell.js"></script>
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