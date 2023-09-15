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
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<style type="text/css">

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

/* .fa-gem:before {
    content: "\f54b";
} */


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
               <input type="hidden" name="id" value="${user.id }">
               <a href="${pageContext.request.contextPath}/login/mypage.jsp">마이페이지
               <span class="badge text-bg" style="background-color: #FF0000"><c:out value="${requestcount}"/></span>
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
               <li><a href="index.jsp">홈</a></li>
               <li><a href="product/buy.jsp">판매상품</a></li>
               <li><a href="javascript:sell()">판매등록</a></li>
               <li><a href="community/community.jsp">커뮤니티</a></li>
               <li><a href="service/service.jsp">고객센터</a></li>
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
         <section id="two" class="wrapper style1">
         <h3 style="text-align: center;">최근 등록 상품</h3>
           <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators" style="position: unset;">
  <c:forEach begin="0" end="2" var="i">
     <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${i}" 
                <c:if test="${i == 0}">class="active"</c:if> aria-label="Slide ${i+1}"></button>
        </c:forEach>
  </div>
  <div class="carousel-inner" >
        <c:forEach begin="0" end="2" var="vo1" items="${recentlist}" varStatus="status">
            <div class="carousel-item <c:if test="${status.index == 0}">active</c:if>">
            <c:forEach begin="${status.index * 4 }" end="${status.index * 4 + 2}" var="vo2" items="${recentlist }">
                <div class="carousel-caption d-none d-md-block" style="position: unset; color: black; float: left; margin-left:100px; padding: 8px;">
                <img src="/projectupload/${vo2.picture}" class="image fit" alt="..." style="width: 450px; height: 450px; margin: auto;">
                    <h5><c:out value="${vo2.pname}" /></h5>
                    <p>ID : <c:out value="${vo2.id}" /></p>
                    <p>가격 : <c:out value="${vo2.price}" /></p>
                    <p>등록날짜 : <fmt:formatDate value="${vo2.createAt}" /></p>
                    <p>사이즈 : <c:out value="${vo2.psize}" /></p>
                    <ul class="actions special">
                        <li><a href="product/detail.jsp?pcode=${vo2.pcode}" class="button primary">상세보기</a></li>
                    </ul>
                </div>
            </c:forEach>
            </div><!-- 슬라이드 아이템 끝 -->
        </c:forEach>
    </div>

  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev" style="top: 380px; background: #4cbfaf; width: 30px;">
    <span aria-hidden="false" style="color: white; padding: auto;">&lt;</span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next" style="top: 380px; background: #4cbfaf; width: 30px;">
  <!--   <button class="button primary small" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next" style="right: 0;"> -->
    <span aria-hidden="false" style="color: white; padding: auto;">&gt;</span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
  </section>
  <!-- 최근 리스트 끝 -->
  

       <section id="two" class="wrapper style1">
       <h3 style="text-align: center;">많이 본 상품</h3>
           <div id="carouselExampleCaptions2" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators" style="position: unset;">
  <c:forEach begin="0" end="2" var="i">
     <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="${i}" 
                <c:if test="${i == 0}">class="active"</c:if> aria-label="Slide ${i+1}"></button>
        </c:forEach>
  </div>
  <c:if test="${mostlist != null}">
  <div class="carousel-inner" >
        <c:forEach begin="0" end="2" var="vo1" items="${mostlist}" varStatus="status">
            <div class="carousel-item <c:if test="${status.index == 0}">active</c:if>">
            <c:forEach begin="${status.index * 4 }" end="${status.index * 4 + 2}" var="vo2" items="${mostlist }">
                <div class="carousel-caption d-none d-md-block" style="position: unset; color: black; float: inherit; margin-left:100px;  padding: 8px; ">
                <img src="/projectupload/${vo2.picture}" class="image fit" alt="..." style="width: 450px; height: 450px; margin: auto;">
                    <h5><c:out value="${vo2.pname}" /></h5>
                    <p>ID : <c:out value="${vo2.id}" /></p>
                    <p>가격 : <c:out value="${vo2.price}" /></p>
                    <p>등록날짜 : <fmt:formatDate value="${vo2.createAt}" /></p>
                    <p>사이즈 : <c:out value="${vo2.psize}" /></p>
                    <ul class="actions special">
                        <li><a href="product/detail.jsp?pcode=${vo2.pcode}" class="button primary">상세보기</a></li>
                    </ul>
                </div>
            </c:forEach>
            </div><!-- 슬라이드 아이템 끝 -->
        </c:forEach>
    </div>
  </c:if>

  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide="prev" style="top: 380px; background: #4cbfaf; width: 30px;">
    <span aria-hidden="false" style="color: white; padding: auto;">&lt;</span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide="next" style="top: 380px; background: #4cbfaf; width: 30px;">
  <!--   <button class="button primary small" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next" style="right: 0;"> -->
    <span aria-hidden="false" style="color: white; padding: auto;">&gt;</span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
         </section>
         <!-- 많이 본 상품 리스트 끝 -->
         
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