<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="sendemail.EmailService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="../assets/css/main.css" />
</head>
<body class="is-preload">
	
	<!-- Header -->
	<header id="header">
		<a class="logo" href="${pageContext.request.contextPath}">당신마켓 <span>by koreait.project.teamD</span></a>
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
               <li><a href="${pageContext.request.contextPath}/service.jsp">고객센터</a></li>
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
	<!-- sction -->

	<div class="row">
		<!-- 나중에 post로 바꾸기 -->
		<form name="join" action="JoinAction.jsp" method="post">


			<div class="box"
				style="display: inline-grid; width: 32em; margin: 100px auto 10px auto; box-shadow: 6px 6px 10px lightblue; padding: 3rem">
				<h2
					style="display: flex; justify-content: center; margin-top: 50px;">당신마켓(회원가입)</h2>
				<div class="col-6 col-12-medium">
					<div class="col-6 col-12-xsmall" style="display: inline-flex; gap: 15px;width:100%;">
						<input type="text" style="margin-bottom: 10px;" name="demo-id"
							id="demo-id" placeholder="아이디를 입력해주세요." required="required">
							<button type="button" onclick="checkDuplicateId()">중복확인</button>
					</div>
					<label id="outcorrect" style="display: none; color:red;">중복되는 아이디가 있습니다.</label>
					<label id=incorrect style="display: none; color:blue;">사용가능 합니다.</label>
					
					<div class="col-6 col-12-xsmall">
						<input type="password" style="margin-bottom: 10px;"
							name="demo-password" id="demo-password" placeholder="비밀번호를 입력해주세요."
							required="required">
					</div>
					<div class="col-6 col-12-xsmall">
						<input type="text" style="margin-bottom: 10px;" name="demo-name"
							id="demo-name" placeholder="이름을 입력해주세요." required="required">
					</div>
					<div class="col-6 col-12-xsmall">
						<input type="text" style="margin-bottom: 10px;"
							name="demo-nickname" id="demo-nickname" placeholder="닉네임을 입력해주세요."
							required="required">
					</div>
					
					<div class="col-6 col-12-xsmall">
						<input type="text" style="margin-bottom: 10px;"
							name="demo-phone" id="demo-phone" placeholder="010-xxxx-xxxx"
							required="required">
					</div>

					<div class="col-6 col-12-xsmall"
						style="display: flex; margin-bottom: 20px;">
						<label style="margin: 0px 20px 0px 30px; color: #858585d9;">Birth</label>
						<input style="width: 18em;" type="date"
							style="margin-bottom: 30px;" name="demo-birth" id="demo-birth"
							placeholder="birth" required="required">
					</div>

					<div class="col-6 col-12-xsmall">
						<input type="text" style="margin-bottom: 30px;"
							name="demo-address" id="demo-address" placeholder="주소를 입력해주세요."
							required="required">
					</div>

					<!-- --------------------이메일 인증 테이블 ------------------------ -->
					
					
					<table class="table"
						style="margin-left: auto; margin-right: auto; background-color: white;">
						<tr>
							<th>이메일</th>
							<td><input type="text" name="demo-email" id="demo-email"
								maxlength="30" required="required">
								 <button onclick="sendEmail();" id="eamilAuthBtn" type="button"          
								class="btnChk">인증 메일 보내기</button></td>
								<!-- 쓸수도 있는 함수 return emailValCheck(); -->
						</tr>
						<!-- emailAuthentication() -->
						<tr>
							<th rowspan="2"><a>인증번호 입력</a></th>
							<td colspan="2"><input type="text" name="authCode"
								id="inputAuthCode" maxlength="10">
								<button onclick="authCodeCheck()" id="authCodeCheckBtn"
									type="button" class="btnChk">인증</button>
								<input type="hidden"
									name="demo-checkemail" id="demo-checkemail" value="false"></td>
						</tr>
					</table>
							
					


					<!-- --------------------조인 버튼 ------------------------ -->
					<button type="submit" class="button primary fit" name="" id="joinButton" disabled>Join</button>
					<!-- button요소의 name 속성이 빈 문자열인 경우, 해당 요소의 값을 폼 데이터로 전송하지 않게됩니다. 
				이렇게 하면 email 및 checkemail 파라미터가 포함되지 않습니다. -->
				
				</div>
			</div>
		</form>
	</div>

	<!-- Footer -->
	<section id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon brands fa-facebook-f"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon solid fa-map-marker-alt"><span
						class="label">Location</span></a></li>
				<li><a href="#" class="icon solid fa-phone"><span
						class="label">Phone</span></a></li>
				<li><a href="#" class="icon solid fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>
		</div>
		<div class="copyright">&copy; Untitled. All rights reserved.</div>
	</section>

	<!-- Scripts -->
	

	<script type="text/javascript">
    window.onkeydown = function() {
    	var kcode = event.keyCode;
    	if(kcode == 116) {
    	history.replaceState({}, null, location.pathname);
    	}
    	sessionStorage.clear();
    	}
    //history.replaceState 브라우저의 탐색 기록을 조작하는 메서드
    //{}인수 = null
    //location.pathname 현재페이지 경로
     
	<!-- 아이디중복체크 -->
	function checkDuplicateId() {

	    // 입력값이 비어 있는 경우 처리
	     var id = document.getElementById('demo-id').value;
   		 if (!id) {
        	alert("아이디를 입력하세요.");
        	return;
 	  	 }
   		 
   		

	    // 중복 확인 페이지로 이동
	    const duplchekcid = document.createElement('form');
	    duplchekcid.setAttribute('method','post');
	    duplchekcid.setAttribute('action','joinIdCheck.jsp');
		

	    const data_2 = document.createElement('input');
	    data_2.setAttribute('name', 'demo-id');
	    data_2.setAttribute('value', id);
		duplchekcid.appendChild(data_2);

	    document.body.appendChild(duplchekcid);
	    
	    var myid = document.getElementById('demo-id').value;
   		sessionStorage.setItem("myid", myid);
	    duplchekcid.submit();
	}
		 var paramIncorrect = '${param.incorrect}';
		    var incorrectLabel = document.getElementById('incorrect');
		    var outcorrectLabel = document.getElementById('outcorrect');

		    if (paramIncorrect === 'n') {
		    	outcorrectLabel.style.display = 'flex';
		    }else if(paramIncorrect === 'y'){
		    	incorrectLabel.style.display = 'flex';
		    }
		    else {
		        outcorrectLabel.style.display = 'none';
		    }
	
		    var loadedName = sessionStorage.getItem("myid");
		    document.getElementById("demo-id").value = loadedName;
	       
				
		function authCodeCheck() {
			var url = "authCodeCheck.jsp?inputedCode=" + document.getElementById("inputAuthCode").value;
			window.open(url, "confirm", "width=500,height=400");
		}

			
		function sendEmail(){
			
			var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	           var email = document.querySelector("#demo-email").value;
	           if (!emailPattern.test(email)) {
	               alert("유효하지 않은 이메일 주소입니다.");
	               return false;
	           }
	           
	           
			const form = document.createElement('form');
			form.setAttribute('method','post');
			form.setAttribute('action','sendEmail.jsp');
			
			const data_1 = document.createElement('input');
			data_1.setAttribute('type','hidden');
			data_1.setAttribute('name','demo-email');
			data_1.setAttribute('value',document.getElementById("demo-email").value);
			
			form.appendChild(data_1);
			
			document.body.appendChild(form);
			
			form.submit();
	           return true;
			
			
		}


		 </script>

	<!-- 	 ------------------------------------------------------------ -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>

</body>
</html>