<%@page import="teamD.project.dto.McommunityDto"%>
<%@page import="teamD.project.dto.Paging"%>
<%@page import="teamD.project.dao.McommunityDao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="teamD.project.dao.McommunityDao"%>
<%@page import="teamD.project.dto.McommunityDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="UTF-8" />
    <title>당신마켓</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/NewFile.css" />
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

    <section class="notice">
        <div class="page-title">
            <div class="container">
                <h2>당신마켓 고객센터</h2>
            </div>
        </div>
        <hr>

        <div style="margin: auto;">
            <a class="button" id="notice" href="?noticepage=1&selectedContent=notice"
                onclick="showContent('noticeContent')">공지사항</a>
            <a class="button" id="qanda" href="?qandapage=1&selectedContent=qanda"
                onclick="showContent('qandaContent')">Q&A</a>
                <div style="float:right; margin:auto;">
                    <c:if test="${user.id=='admin' && param.selectedContent=='notice' ||user.id=='admin' &&  param.selectedContent == null }">
                        <a href="javascript:write()" class="button">글쓰기</a>
                    </c:if>
                    <c:if test="${param.selectedContent=='qanda' && user.id != null}">
                        <a href="javascript:qwrite()" class="button">글쓰기</a>
                    </c:if>
                    <a href="${pageContext.request.contextPath}" class="button">홈</a>
                </div>
        </div>
		
        <div id="board-search">
            <div class="container">
                <form class="search" style="display: flex; justify-content: center; margin-bottom: -40px; margin-top:0px; height:60%;" method="get"
                    action="service.jsp">
                    <input type="hidden" name="selectedContent" value="${selectedContent}" />
                    <table class="search">
                        <tr>
                            <td>
                                <select class="SelectSearch" name="WhichSearch" style="text-align: center; padding:0px 15px 0px 15px; width:70%;">
                                    <option id="select" value="select">선택</option>
                                    <option id="title" value="title"
                                        <c:if test="${param.WhichSearch eq 'title'}">selected</c:if>>제목</option>
                                    <option id="writer" value="writer"
                                        <c:if test="${param.WhichSearch eq 'writer'}">selected</c:if>>작성자</option>
                                </select>
                            </td>
                            <td style="display: flex; justify-content: center; width:auto;">
                                <input class="keyword" id="search" name="keyword" type="search" placeholder="검색어를 입력하세요."
                                    style="width: 70%;" value="${param.keyword}">
                                <button type="submit" class="button icon solid fa-search" style="margin:auto;">
                                </button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        
        <c:choose>
            <c:when test="${selectedContent == 'notice' }">
                <c:set var="contentList" value="${noticeList}" />
            </c:when>
            <c:otherwise>
                <c:set var="contentList" value="${qandaList}" />
            </c:otherwise>
        </c:choose>

        <c:if test="${selectedContent=='notice' }">
            <div id="noticeContent" class="content" style="margin-top=20px;">
                <div id="board-list">
                    <div class="container">
                        <table class="board-table">
                            <thead>
                                <tr>
                                    <th scope="col" class="th-num">글번호</th>
                                    <th scope="col" class="th-title">제목</th>
                                    <th scope="col" class="th-writer">작성자</th>
                                    <th scope="col" class="th-readCount">조회수</th>
                                    <th scope="col" class="th-date">등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="vo" items="${contentList}">
                                    <tr>
                                        <td><c:out value="${vo.idx }" /></td>
                                        <th>
                                            <a href="serviceread.jsp?idx=${vo.idx }&noticepage=${noticepaging.currentPage}">${vo.title }</a>
                                        </th>
                                        <td><c:out value="${vo.writer }" /></td>
                                        <td><c:out value="${vo.readCount }" /></td>
                                        <td>
                                            <fmt:formatDate value="${vo.createdAt}" pattern="yyyy-MM-dd"
                                                var="createdAt" />
                                            <c:choose>
                                                <c:when test='${createdAt == today}'>
                                                    <fmt:formatDate value="${vo.createdAt}" type="time" />
                                                </c:when>
                                                <c:otherwise>
                                                    <fmt:formatDate value="${vo.createdAt}" pattern="yyyy-MM-dd" />
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
						
                        <div
                            style="width:700px;margin: auto;padding: 10px;text-align: center;">
                            전체 글 개수 : <c:out value="${noticepaging.totalCount }" /> <br>
                            <hr>
                            <a class="pagenum"
                                href="?noticepage=1&WhichSearch=${param.WhichSearch}&keyword=${param.keyword}&selectedContent${selectedContent }">&lt;&lt;</a> <!--(1) 첫번째 페이지 1번으로 이동 -->

                            <a class="pagenum" href="?noticepage=${noticepaging.startPage-1 }"
                                style='<c:if test="${noticepaging.startPage==1 }">display:none;</c:if>'>&lt;</a>

                            <c:forEach var="i" begin="${noticepaging.startPage }" end="${noticepaging.endPage }">
                                <a class="pagenum ieach"
                                    href="?noticepage=${i }&WhichSearch=${param.WhichSearch}&keyword=${param.keyword}&selectedContent=${selectedContent }"><c:out value="${i }" /></a>
                            </c:forEach>

                            <a class="pagenum"
                                href="?noticepage=${noticepaging.endPage+1 }&WhichSearch=${param.WhichSearch}&keyword=${param.keyword}&selectedContent=${selectedContent }"
                                style='<c:if test="${noticepaging.endPage==noticepaging.totalPage }">display:none;</c:if>'>&gt;</a>

                            <a class="pagenum"
                                href="?noticepage=${noticepaging.totalPage }&WhichSearch=${param.WhichSearch}&keyword=${param.keyword}&selectedContent=${selectedContent }">&gt;&gt;</a> <!--(5) 가장 마지막 페이지로 이동 -->
                        </div>

                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${selectedContent=='qanda' }">
            <div id="qandaContent" class="content">
                <div id="board-list">
                    <div class="container">
                        <table class="board-table">
                            <thead>
                                <tr>
                                    <th scope="col" class="th-num">글번호</th>
                                    <th scope="col" class="th-title">제목</th>
                                    <th scope="col" class="th-writer">작성자</th>
                                    <th scope="col" class="th-readCount">조회수</th>
                                    <th scope="col" class="th-date">등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="vo1" items="${contentList}" varStatus="status">
                                    <tr>
                                        <td><c:out value="${vo1.idx }" /></td>
                                        <th>
                                            <c:choose>
                                                <c:when test="${user.id == 'admin' || user.id == vo1.writer }">
                                                    <a
                                                        href="qaread.jsp?idx=${vo1.idx }&qapage=${qandapaging.currentPage}">${vo1.title }</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <span>비밀글은 작성자만 볼수 있습니다.</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </th>
                                        <td><c:out value="${vo1.writer }" /></td>
                                        <td><c:out value="${vo1.readCount }" /></td>
                                        <td>
                                            <fmt:formatDate value="${vo1.createdAt}" pattern="yyyy-MM-dd"
                                                var="createdAt" />
                                            <c:choose>
                                                <c:when test='${createdAt == today}'>
                                                    <fmt:formatDate value="${vo1.createdAt}" type="time" />
                                                </c:when>
                                                <c:otherwise>
                                                    <fmt:formatDate value="${vo1.createdAt}" pattern="yyyy-MM-dd" />
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div
                            style="width:700px;margin: auto;padding: 10px;text-align: center;">
                            전체 글 개수 : <c:out value="${qandapaging.totalCount }" /> <br>
                            <hr>
                            <a class="pagenum"
                                href="?qandapage=1&WhichSearch=${param.WhichSearch}&keyword=${param.keyword}&selectedContent=qanda">&lt;&lt;</a> <!--(1) 첫번째 페이지 1번으로 이동 -->

                            <a class="pagenum"
                                href="?qandapage=${qandapaging.startPage-1 }&WhichSearch=${param.WhichSearch}&keyword=${param.keyword}&selectedContent=qanda"
                                style='<c:if test="${qandapaging.startPage==1 }">display:none;</c:if>'>&lt;</a>

                            <c:forEach var="l" begin="${qandapaging.startPage }" end="${qandapaging.endPage }">
                                <a class="pagenum ieach"
                                    href="?qandapage=${l }&WhichSearch=${param.WhichSearch}&keyword=${param.keyword}&selectedContent=qanda"><c:out value="${l }" /></a>
                            </c:forEach>

                            <a class="pagenum"
                                href="?qandapage=${qandapaging.endPage+1 }&WhichSearch=${param.WhichSearch}&keyword=${param.keyword}&selectedContent=qanda"
                                style='<c:if test="${qandapaging.endPage==qandapaging.totalPage }">display:none;</c:if>'>&gt;</a>

                            <a class="pagenum"
                                href="?qandapage=${qandapaging.totalPage }&WhichSearch=${param.WhichSearch}&keyword=${param.keyword}&selectedContent=qanda">&gt;&gt;</a> <!--(5) 가장 마지막 페이지로 이동 -->
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

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
    <script src="https://kit.fontawesome.com/b69711df0e.js" crossorigin="anonymous"></script>
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



    <script type="text/javascript">
        const pnums = document.querySelectorAll('.ieach');
        pnums.forEach(function (item) {
            console.log(item);
            if (item.innerHTML == '${paging.currentPage}') {
                item.style.color = 'black';
                item.style.fontWeight = 'bold';
            }
        });
    </script>
    <script>
        function write() {
            location.href = "servicewrite.jsp?selectedContent=${selectedContent}&noticepage=${noticepaging.currentPage}";
        }

        function qwrite() {
            location.href = "qwrite.jsp?selectedContent=${selectedContent}&qapage=${qandapaging.currentPage}";
        }

        function showContent(contentId) {
            const noticeButton = document.getElementById("notice");
            const qandaButton = document.getElementById("qanda");
            const content = document.getElementById(contentId);

            if (contentId === "noticeContent") {
                noticeButton.classList.add("active");
                qandaButton.classList.remove("active");
            } else {
                noticeButton.classList.remove("active");
                qandaButton.classList.add("active");
            }

            content.style.display = "block";
            if (contentId === "noticeContent") {
                document.getElementById("qandaContent").style.display = "none";
            } else {
                document.getElementById("noticeContent").style.display = "none";
            }
        }
    </script>
</body>

</html>
