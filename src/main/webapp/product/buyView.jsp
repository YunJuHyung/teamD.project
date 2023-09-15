<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>


<html>
   <head>
      <title>당신마켓</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/list.css"/>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
  /* 클릭된 버튼에 대한 스타일 */
 .button:hover {
    background-color: #4cbfaf; 
  }
  
  .button:active {
	background-color: black;
}
/* 	.clicked {
		background-color: red;
	} */
	
	  img {
	width:350px;
	height: 350px;
	image-rendering:-webkit-optimize-contrast;
 	transform:translateZ(0);
  	backface-visibility:hidden;
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
               <span class="badge text-bg-secondary"><c:out value="${requestcount}"/></span></a>
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
               <li><a href="javascript:sell()">판매등록</a></li>
               <li><a href="${pageContext.request.contextPath}/community/community.jsp">커뮤니티</a></li>
               <li><a href="${pageContext.request.contextPath}/service/service.jsp">고객센터</a></li>
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
	
	



	<!-- section -->
	<section id="two" class="wrapper style1">
		<div class="inner">
			<header class="heading major">
				<h2>판매 상품</h2>
			</header>

			<!-- 제품 검색창 -->
			<div style="text-align: center; margin-top: 20px; justify-content :space-between; ">
				<form action="" method="GET" style="display: flex; justify-content: center;">
					<input type="text" name="keyword" placeholder="제품 이름 검색" style="width: 40%;" value="${keyword}" />
					<button type="submit" class="button small" style="margin-left: 3px; margin-top: 5px;">검색</button>
				</form>
			</div>
			<!-- 카테고리 별 검색 -->
			<form action="" style="justify-content: center; margin: 20px;" >
				<a class="button small" id="allCategory" href="?page=1" onclick="changeCategory('')">전체</a> 
				<a class="button small" id="sneakers" href="?page=1&category=운동화" onclick="changeCategory('운동화')">운동화</a> 
				<a class="button small" id="slippers" href="?page=1&category=단화" onclick="changeCategory('단화')">단화</a> 
				<a class="button small" id="walkers" href="?page=1&category=워커" onclick="changeCategory('워커')">워커</a> 
				<a class="button small" id="slipper" href="?page=1&category=슬리퍼" onclick="changeCategory('슬리퍼')">슬리퍼</a>
			</form>

<!-- 전체리스트 페이지 -->
			<div class="spotlights" style="padding:10px; margin:10px;">
				<c:forEach begin="0" end="8" var="vo1" items="${pagelist }">
				<div class="spotlight" >
							<article>
								<a class="image fit"><img src="/projectupload/${vo1.picture}" alt="" /></a>
								<div class="content">
									<h4><c:out value="${vo1.pname }" /></h4>
									<p style="margin: auto;">브랜드:<c:out value="${vo1.brand }" /></p>
									<p style="margin: auto;">ID:<c:out value="${vo1.id }" /></p>
									<p style="margin: auto;">가격:<c:out value="${vo1.price }" /> 원</p>
									<p style="margin-bottom: 10px;">사이즈:<c:out value="${vo1.psize }" /></p>
									<ul class="actions special">
										<li><a href="detail.jsp?pcode=${vo1.pcode }&page=${paging.currentPage}" class="button primary">상세보기</a></li>
									</ul>
								</div>
							</article>
						</div>
				</c:forEach>
			</div>
			
			<div style="width:700px;margin: auto;padding: 10px;text-align: center;">
		    전체 글 개수 : <c:out value="${paging.totalCount}"/> <br>
		    <hr>
		    <c:set var="targetParam" value="${not empty category ? 'category=' : 'keyword='}" />
		    <a class="pagenum" href="?page=1&${targetParam}${not empty category ? category : keyword }">&lt;&lt;</a>   <!--(1) 첫번째 페이지 1번으로 이동 -->
		    <a class="pagenum" href="?page=${paging.startPage-1 }" style='<c:if test="${paging.startPage==1 }">display:none;</c:if>' >&lt;</a>
		    <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		        <a class="pagenum ieach" href="?page=${i }&${targetParam}${not empty category ? param.category : param.keyword }">
		        <c:out value="${i }"/></a>
		    </c:forEach>
		    <a class="pagenum" href="?page=${paging.endPage+1 }&${targetParam}${not empty category ? category : keyword }" 
		    style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'>&gt;</a>
		    <a class="pagenum" href="?page=${paging.totalPage }&${targetParam}${not empty category ? category : keyword }">&gt;&gt;</a>  
			</div>
			
			<script type="text/javascript">
			const pnums = document.querySelectorAll('.ieach');
			pnums.forEach(function(item){		
				if(item.innerHTML=='${paging.currentPage}') {    
					item.style.color = 'black';
					item.style.fontWeight = 'bold';
				}else{
					item.style.color = '#37966f';
				}
			});
			</script>
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
				<div class="copyright">&copy; Untitled. All rights reserved.</div>
			</section>

			<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script src="../assets/js/page.js"></script>
			 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
const scrollSpy = new bootstrap.ScrollSpy(document.body, {
  target: '#navbar-example'
})
</script>
	
		     <script type="text/javascript">
				
		       	const categoryButtons = document.querySelectorAll(".button.small");
		            categoryButtons.forEach(function(button) {
		            	if(button.innerHTML == '${param.category}'|| (button.id == 'allCategory' && '${param.category}' == '')) {
		            		button.style.backgroundColor='#A9F5E1'
		            	}else {
		            		button.style.backgroundColor='transparent'
		            	}
		            	
		          })
            
        function checkClicked(category) {
			 const currentCategory = '${param.category}';
				
			    if (category  !== '전체') {
			        location.href = "?category=" + category;
			    } else {//if (category === '전체') {
			        location.href = "buy.jsp";
			    }
		}     
    </script> 
     
	    <script>
		function changeCategory(category) {
	    if (category !== '') {
	        location.href = "?page=1&category=" + category;
	    } else {
	        location.href = "?page=1";
	    }
	}
</script>
    
</body>
</html>


