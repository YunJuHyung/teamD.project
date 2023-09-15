<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/list.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <style type="text/css">
  table th{
  text-align: center;
   font-size: medium;
  
  }
  
  
  </style>
  
<title>구매요청목록</title>
</head>
<body>



 <header id="header">
            <p class="logo" style="margin-top: auto;">당신마켓</p>
         </header>

	<h3 style="text-align: center; margin-top: 20px;">받은 구매요청</h3>
		<table class="table table-hover" style="width:800px; height:200px; margin: 0px 40px 0px 40px; text-align: center;">
			<thead style="background-color:white; height: 20px; text-align: center;">
				<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>판매자</th>
				<th>구매요청가</th>
				<th>구매자</th>
				<th>지역</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
		<c:forEach var="vo" items="${pcodelist }">
			<tr style="background-color: white;">
				<td><c:out value="${vo.pcode }"></c:out></td>
				<td><c:out value="${vo.pname }"></c:out></td>
				<td><c:out value="${vo.id }"></c:out></td>
				<td><c:out value="${vo.requestprice }"></c:out></td>
				<td><c:out value="${vo.buyid }"></c:out></td>
				<td><c:out value="${vo.buyaddress }"></c:out></td>
				<td><a class="button small" href="#" onclick="goShowPhone('${vo.buyid}','${pcode}')">판매하기</a></td>
											<!--  -->
			</tr>
		</c:forEach>
			</tbody>
		</table>
		<div style="width:700px;margin: auto;padding: 10px;text-align: center;">
			전체 글 개수 : <c:out value="${paging.totalCount }"/> <br>
			<hr>
			<a class="pagenum" href="?page=1">&lt;&lt;</a>   <!--(1) 첫번째 페이지 1번으로 이동 -->
		
			<a class="pagenum" href="?page=${paging.startPage-1 }&pcode=${param.pcode}"      
					style='<c:if test="${paging.startPage==1 }">display:none;</c:if>' >&lt;</a>
		
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<a class="pagenum ieach" href="?page=${i }&pcode=${param.pcode}"><c:out value="${i }"/></a>
			</c:forEach>
		
			<a class="pagenum" href="?page=${paging.endPage+1 }"
					style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'	>&gt;</a>
					
			<a class="pagenum" href="?page=${paging.totalPage }">&gt;&gt;</a>  <!--(5) 가장 마지막 페이지로 이동 -->
		</div>
		<script type="text/javascript">
		const pnums = document.querySelectorAll('.ieach');
		pnums.forEach(function(item){		/* forEach로 숫자 a태그를 하나씩 item에 저장 */
			console.log(item);
			/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
			if(item.innerHTML=='${paging.currentPage}') {    /* a태그의 숫자와 현재페이지가 같은지 검사 */
				item.style.color = 'black';
				item.style.fontWeight = 'bold';
			}else{
				item.style.color = '#37966f';
			}
		});
		
		function goShowPhone(buyid,pcode) {
            // "예"를 클릭하면 새 페이지로 이동
            var confirmResult = confirm("판매하시겠습니까?");
            if (confirmResult) {
            	
            	window.open("showphone.jsp?buyid="+buyid+"&pcode="+pcode,"구매요청 리스트","width=900, height=600, left=500, top=250")
            	
            } else {
            	window.back();
            }
            return false; // 기본 이벤트를 중단하여 현재 페이지에 남도록 함
        };
		
		</script>
</body>
</html>