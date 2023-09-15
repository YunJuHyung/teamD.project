<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

	<head>
		<title>당신마켓</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../assets/css/login.css" />
		<style type="text/css">
		
		.button.fit{
		width: 45%;
		margin-left: 10px;
		
		}
		
		
		</style>
		
	</head>
	<body class="is-preload">
	<%
	String temp=request.getParameter("back");
	if (temp != null && temp.equals("w")){
		session.setAttribute("back", "../community/write.jsp");
	}
	else if (temp != null && temp.equals("s")){
		session.setAttribute("back","../product/sell.jsp");
	}
	else if(temp != null && temp.equals("p")){
		session.setAttribute("back","../product/buy.jsp");
		
	}
	%>

		<!-- Header -->
			<header id="header">
				<a class="logo" href="${pageContext.request.contextPath}/index.jsp"> 당신마켓 </a>
				<nav>
					<a href="#menu">메뉴</a>
				</nav>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="${pageContext.request.contextPath}">홈</a></li>
					<li><a href="${pageContext.request.contextPath}/product/buy.jsp">판매상품</a></li>
					<li><a href="javascript:sell()">판매등록</a></li>
					<li><a href="${pageContext.request.contextPath}/community/community.jsp">커뮤니티</a></li>
					<li><a href="${pageContext.request.contextPath}/community/service.jsp">고객센터</a></li>
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
			
			
		<!-- sction -->
		
		<div class="row" >
			<form action="loginAction.jsp" method="post">

			<div class="box" style=" display:inline-grid; width: 32em; margin: 100px auto 100px auto; box-shadow: 6px 6px 10px lightblue; padding : 3rem">
			<h2 style="display:flex; justify-content: center; margin-top: 50px;">당신마켓</h2>
			<div class="col-6 col-12-medium">
				<div class="col-6 col-12-xsmall">
					<input type="text" name="demo-name" id="demo-name" placeholder="id" required="required">
				</div>
				<div class="col-6 col-12-xsmall">
				
				<input type="password" name="demo-password" id="demo-password" placeholder="password" style="margin-bottom: 30px;" required="required">
				</div>
				<button type="submit" class="button primary fit" >로그인</button>
				<a class="button primary fit" href="join.jsp" style="margin-top: 20px;">회원가입</a>
			</div>
			</div>
			</form>
		</div>
		
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
		<script type="text/javascript">
		  	if('${param.incorrect}'==='y')
		  		alert("계정 정보가 일치하지 않습니다.")
		</script>
			<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	</body>
</html>