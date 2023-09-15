<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/list.css" />
      	      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
      	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
      	<style type="text/css">
      		table{
      			width:850px;
      		}
      		table th{
      			text-align: center;
      			font-size: 22px;
      			background-color: white;
      		}
      		
      		.buy,.row ul{
      			list-style: none;
      			text-align: center;
				display:flex;
				flex-direction: row;
				
      		} 
      		
      		.row ul li{
      			text-align: center;
      		}
      		ul.buy{
      			list-style: none;
      			display: flex;
      			
      		}
      		
      		ul.row{
      			padding:5px 200px 5px 375px;
      			margin:0;
      			font-weight: bold;
      			list-style: none;
      			text-align: center;
				display:flex;
				flex-direction: row;
				
      		}
      		
      		
      		
      		ul.row > li{
				padding: 3px 0px 3px 25px;
			}
			ul.row > li:nth-child(1){  /* .row 의 자식태그 중 li 그리고 그 li의 n번째 위치(자식요소)로 select  */
				flex-basis:12%;
			}	
			ul.row > li:nth-child(2){
				
				flex-basis:17%;
			}
			ul.row > li:nth-child(3){
				flex-basis:5%;
			}
			ul.row > li:nth-child(4){
				flex-basis:16%;
			}
			ul.row > li:nth-child(5){
				flex-basis:8%;
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
			<div class="box" style=" display:inline-grid; width:100em; margin: 5em; box-shadow: 6px 6px 10px lightblue; ">
			<br>
            	<form action="updateView.jsp" method="post">
				<div class="box" style=" display:inline-grid; width: 32em; margin: auto ; box-shadow: 6px 6px 10px lightblue; ">
				<h2 style="text-align: center;"><c:out value="${user.name }"/>님의 마이페이지</h2>
				<br>
	            	<h3 style="text-align: center;"><c:out value="내 정보"/></h3>
	            	<ul style="list-style: none; text-align: center;" >
	            		<li><c:out value="ID : ${user.id}"/></li> 
	            		<li><c:out value="이름 : ${user.name}"/></li>
	            		<li><c:out value="닉네임 : ${user.nickname}"/></li> 
	            		<li><c:out value="생년월일 : ${user.birth}"/></li> 
	            		<li><c:out value="주소 : ${user.address}"/></li>
	            		<li><button type="submit" class="button primary small">정보수정</button></li>
	            	</ul>
            	</div>
            	</form>
            	<form action="mypage.jsp" style="justify-content: center; margin: auto;">
				    <a href="?buypage=1" class="button small" onclick="showContent('buyContent')">구매한 상품</a>
				    <a href="?sellpage=1" class="button small" onclick="showContent('sellContent')">판매한 상품</a>
				</form>
				<br>
               <div id="buyContent" class="content" >
				<c:if test="${buydisplay=='yes' }">
               	<header class="heading major">
                  <h2>내가 구매한 상품</h2>
               	</header>
						
				<table class="" style="margin:auto;">
						<tr>
							<th>판매자</th>
							<th>상품명</th>
							<th>브랜드</th>
							<th>가격</th>
							<th>카테고리</th>
							<th>구매일자</th>
						</tr>
                  	<c:forEach var="vo1" items="${mybuylist }">
						<tr style="text-align: center;">                           
                           	   <td><c:out value="${vo1.id}"/></td>
                           	   <td><c:out value="${vo1.pname}"/></td>
	                           <td><c:out value="${vo1.brand}"/></td>
	                           <td><c:out value="${vo1.price}"/></td>
	                           <td><c:out value="${vo1.category}"/></td>
	                           <td><fmt:formatDate value="${vo1.buyat }" pattern="yyyy-MM-dd" /></td>
	                    </tr> 
                     </c:forEach>
                 </table>  
							 <div style="width:700px;margin: auto;padding: 10px;text-align: center;">
								전체 구매 개수 : <c:out value="${buypaging.totalCount }"/> <br>
								<hr>
								<a class="pagenum" href="?buypage=1">&lt;&lt;</a>   <!--(1) 첫번째 페이지 1번으로 이동 -->
							
								<a class="pagenum" href="?buypage=${buypaging.startPage-1 }"      
										style='<c:if test="${buypaging.startPage==1 }">display:none;</c:if>' >&lt;</a>
							
								<c:forEach var="i" begin="${buypaging.startPage }" end="${buypaging.endPage }">
									<a class="pagenum ieach" href="?buypage=${i }"><c:out value="${i }"/></a>
								</c:forEach>
							
								<a class="pagenum" href="?buypage=${buypaging.endPage+1 }"
										style='<c:if test="${buypaging.endPage==buypaging.totalPage }">display:none;</c:if>'	>&gt;</a>
										
								<a class="pagenum" href="?buypage=${buypaging.totalPage }">&gt;&gt;</a>  <!--(5) 가장 마지막 페이지로 이동 -->
							</div>
							<script type="text/javascript">
							const pnums = document.querySelectorAll('.ieach');
							pnums.forEach(function(item){		/* forEach로 숫자 a태그를 하나씩 item에 저장 */
								console.log(item);
								/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
								if(item.innerHTML=='${buypaging.currentPage}') {    /* a태그의 숫자와 현재페이지가 같은지 검사 */
									item.style.color = 'black';
									item.style.fontWeight = 'bold';
								}else{
									item.style.color = '#37966f';
								}
							});
								
							</script>
				</c:if>
					</div>
				
               <div id="sellContent" class="content" >
				<c:if test="${selldisplay=='yes' }">
				<header class="heading major">
                  <h2>내가 판매한 상품</h2>
               </header>
					<table class="" style="margin:auto;">
						<tr>
							<th>등록날짜</th>
							<th>상품명</th>
							<th>브랜드</th>
							<th>가격</th>
							<th>카테고리</th>
							<th>판매여부</th>
							<th>구매자</th>
							<th>판매일자</th>
						</tr>
                  	<c:forEach var="vo2" items="${myselllist }">
                  	<input type="hidden" id="pcode" value="${vo2.pcode }">
						<tr style="text-align: center;">  
							   <td><fmt:formatDate value="${vo2.createAt }" pattern="yyyy-MM-dd" /></td>   
                           	   <td>
                           	   <c:if test="${vo2.status eq 0}">
                           	   <a href="mypage.jsp?sellpage=${sellpaging.currentPage }" onclick="goBuyRequest('${vo2.pcode}')" style="text-decoration: none;"><c:out value="${vo2.pname}"/></a>
                           	   </c:if>
                           	   <c:if test="${vo2.status eq 1}">
                           	   <c:out value="${vo2.pname}"/>
								</c:if>
                           	   </td>
	                           <td><c:out value="${vo2.brand}"/></td>
	                           <td><c:out value="${vo2.price}"/></td>
	                           <td><c:out value="${vo2.category}"/></td>
	                           <td>
	                           	<c:if test="${vo2.status eq 0}">
									   <c:out value="판매중"/>
								</c:if>
								<c:if test="${vo2.status eq 1}">
									   <c:out value="판매완료"/>
								</c:if>		                           
	                           </td>
	                           <td><c:out value="${vo2.buyid}"/></td>
	                           <td><fmt:formatDate value="${vo2.buyat }" pattern="yyyy-MM-dd" /></td>
	                    </tr>
                     </c:forEach>
                     </table> 
                     		 <div style="width:700px;margin: auto;padding: 10px;text-align: center;">
								전체 판매 개수 : <c:out value="${sellpaging.totalCount }"/> <br>
								<hr>
								<a class="pagenum" href="?sellpage=1" >&lt;&lt;</a>   <!--(1) 첫번째 페이지 1번으로 이동 -->
							
								<a class="pagenum" href="?sellpage=${sellpaging.startPage-1 }"      
										style='<c:if test="${sellpaging.startPage==1 }">display:none;</c:if>' >&lt;</a>
							
								<c:forEach var="i" begin="${sellpaging.startPage }" end="${sellpaging.endPage }">
									<a class="pagenum ieach" href="?sellpage=${i }"><c:out value="${i }"/></a>
								</c:forEach>
							
								<a class="pagenum" href="?sellpage=${sellpaging.endPage+1 }"
										style='<c:if test="${sellpaging.endPage==sellpaging.totalPage }">display:none;</c:if>'	>&gt;</a>
										
								<a class="pagenum" href="?sellpage=${sellpaging.totalPage }">&gt;&gt;</a>  <!--(5) 가장 마지막 페이지로 이동 -->
							</div>
							<script type="text/javascript">
							const pnums1 = document.querySelectorAll('.ieach');
							pnums1.forEach(function(item){		/* forEach로 숫자 a태그를 하나씩 item에 저장 */
								console.log(item);
								/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
								if(item.innerHTML=='${sellpaging.currentPage}') {    /* a태그의 숫자와 현재페이지가 같은지 검사 */
									item.style.color = 'black';
									item.style.fontWeight = 'bold';
								}else{
									item.style.color = '#37966f';
								}
							});
								
							function goBuyRequest(pcode){
								window.open("buyrequest.jsp?pcode="+pcode,"구매요청 리스트","width=900, height=600, left=500, top=250")
								
							}
							</script>     
				</c:if>	
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
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
const scrollSpy = new bootstrap.ScrollSpy(document.body, {
  target: '#navbar-example'
})
</script>
			
			
			
			
			
				<script>
				
				    function showContent(contentId) {
				        if (contentId === 'buyContent') {
				            document.getElementById('buyContent').style.display = 'block';
				            document.getElementById('sellContent').style.display = 'none';
				            
				        } else if (contentId === 'sellContent') {
				            document.getElementById('buyContent').style.display = 'none';
				            document.getElementById('sellContent').style.display = 'block';
				        }
				    }
				 	
				    
				</script>


	</body>
</html>