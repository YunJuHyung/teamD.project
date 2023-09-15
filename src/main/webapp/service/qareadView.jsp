<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>

<head>
    <meta content="text/html; charset=UTF-8">
    <title>당신마켓</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/read.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
    <style type="text/css">
        .badge {
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
            <c:choose>
                <c:when test="${empty user}">
                    <a href="${pageContext.request.contextPath}/login/login.jsp">로그인</a>
                    <a href="${pageContext.request.contextPath}/login/join.jsp">회원가입</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login/logout.jsp">로그아웃</a>
                    <a href="${pageContext.request.contextPath}/mypage.jsp">마이페이지
                    <span class="badge text-bg-secondary"><c:out value="${requestcount}" /></span>
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
                    
                    
                </c:otherwise>
            </c:choose>
            <a href="#menu">메뉴</a>
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

    <main id="write" style="margin-bottom: 8rem;">
        <h3 style="margin-top: 4rem;">당신마켓 Q&A</h3>
        <hr style="color:white;">
        <div style="width: 80%; margin: auto; max-width: 760px;">
            <ul id="table">
                <li>
                    <ul class="row">
                        <li>제목</li>
                        <li><c:out value="${vo1.title}" /></li>
                        <li>조회수</li>
                        <li><c:out value="${vo1.readCount}" /></li>
                    </ul>
                </li>
                <li>
                    <ul class="row">
                        <li>작성자</li>
                        <li><c:out value="${vo1.writer}" /><span style="font-size: 70%;"></span></li>
                        <li>작성날짜</li>
                        <li><fmt:formatDate value="${vo1.createdAt}" type="both" /></li>
                    </ul>
                </li>
                <li id="content">
                    <ul>
                        <li>내용</li>
                        <li>
                            <c:out value="${vo1.content}" />
                        </li>
                    </ul>
                </li>
            </ul>
            <div>
                <form action="" method="post" style="text-align: center; margin-bottom: 30px;justify-content: center;">
                    <c:if test="${user.id == vo1.writer}">
                        <input type="hidden" name="idx" value="${vo1.idx}">
                        <input type="hidden" name="page" value="${page}">
                        <a class="button small" href="javascript:formexecute(1)">수정</a>
                        <a class="button small" href="javascript:formexecute(2)">삭제</a>
                    </c:if>
                    <a class="button small " href="service.jsp?page=${page}">목록</a>
                </form>
            </div>
            <script type="text/javascript">
                function execute(f) {
                    let url;
                    let message;
                    if (f === 1) {
                        message = '글 수정하시겠습니까?';
                    } else if (f === 2) {
                        message = '글 삭제하시겠습니까?';
                    }
                    const yn = confirm(message);
                    if (yn) {
                        url = (f === 1) ? 'qupdate.jsp?idx=' + ${vo1.idx} : (f === 2) ? 'qdelete.jsp?idx=' + ${vo1.idx} : '#';
                        location.href = url + '&page=' + ${page};
                    } else {
                        alert('취소합니다.');
                    }
                }

                function formexecute(f) {
                    let url;
                    let message;
                    if (f === 1) {
                        message = '글 수정하시겠습니까?';
                    } else if (f === 2) {
                        message = '글 삭제하시겠습니까?';
                    }
                    const yn = confirm(message);
                    if (yn) {
                        url = (f === 1) ? 'qupdate.jsp' : (f === 2) ? 'qdelete.jsp' : '#';
                        document.forms[0].action = url;
                        document.forms[0].submit();
                    } else {
                        alert('취소합니다.');
                    }
                }
            </script>

            <hr style="margin:2rem 1rem;">
            <form action="qcommentAction.jsp" method="post">
                <input type="hidden" name="mref" value="${vo1.idx}">
                <input type="hidden" name="idx" value="0">
                <input type="hidden" name="f" value="0">
                <input type="hidden" name="page" value="${page}">
                <ul>
                    <li>
                        <ul class="row" style="margin-top:1.5rem;">
                            <li style="  flex-basis: 10%;">작성자</li>
                            <li><input name="writer" class="input" value="${user.id}" readonly></li>
                        </ul>
                    </li>
                    <li>
                        <ul style="display: flex;">
                            <li>
                                <textarea rows="5" cols="80" name="content" style="resize:none;margin-right:20px; margin-top: 0.8rem;"
                                    placeholder="로그인 후에 댓글을 작성하세요." class="input"></textarea>
                            </li>
                            <li style="align-self: center;margin-bottom: 20px;">
                                <button class="button " type="button" onclick="executeCmt(1,0)">저장</button>
                                <c:if test="${user.id == 'admin' && user.id == cmt.writer }">
                                    <button class="button primary" type="button" onclick="location.href='../login'">로그인</button>
                                </c:if>
                            </li>
                        </ul>
                    </li>
                </ul>
            </form>

            <span>댓글</span>
            <span>[<c:out value="${vo1.commentCount }" />]</span>
            <hr>

            <c:forEach var="cmt" items="${cmtlist}">
                <li style="list-style-type: none; margin-bottom:10px;">
                    <ul class="crow">
                        <li style="list-style-type: none;"><c:out value="${cmt.writer }" /></li>
                        <li style="list-style-type: none;"><c:out value="${cmt.createdAt }" /></li>
                        <c:if test="${user.id == cmt.writer || user.id == 'admin'}">
                            <li><a href="javascript:executeCmt(2,'${cmt.idx }')">삭제</a></li>
                        </c:if>
                    </ul>
                </li>
                <li style="list-style-type: none;">
                    <pre style="padding-bottom:40px;" class="cmtcontent"><c:out value="${cmt.content }" /></pre>
                </li>
            </c:forEach>
        </div>

        <script type="text/javascript">
            function executeCmt(fval, cidx) {
                const frm = document.forms[1];
                if (fval === 1) {
                    if (frm.content.value == '') {
                        alert('글 내용은 필수 입력입니다.');
                        frm.content.focus();
                        return;
                    } else {
                        frm.f.value = fval;
                        frm.submit();
                    }
                } else if (fval === 2) {
                    const yn = confirm('댓글 삭제 하시겠습니까?');
                    if (yn) {
                        frm.f.value = fval;
                        frm.idx.value = cidx;
                        frm.submit();
                    }
                }
            }
        </script>
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