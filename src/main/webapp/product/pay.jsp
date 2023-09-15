<%@page import="teamD.project.dto.MuserDto"%>
<%@page import="teamD.project.dto.MproductDto"%>
<%@page import="java.util.List"%>
<%@page import="teamD.project.dao.MproductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%
	session = request.getSession();	
	MuserDto user = (MuserDto) session.getAttribute("user");
%>
<head>
<meta charset="UTF-8">
  <head>
      <title>구매 요청</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/list.css"/>
   </head>
<body class="is-preload">
       <header id="header">
            <p class="logo" style="margin-top: auto;">당신마켓 <span>구매요청</span></p>
         </header>

 
	<form action="payAction.jsp" method="post"  onsubmit="return check()">
	<div class="box" style=" display:inline-grid; width: 640px; height: 870px; margin: auto ; box-shadow: 6px 6px 10px lightblue; 
	margin-top: 50px;">
 	<h3 style="text-align: center; margin: 0;" >구매요청</h3>
	<table>
		<tr>
			<th>상품코드</th>
			<td><input type="text" name="pcode" id="pcode" readonly="readonly" value = "${param.pcode }" size="50"></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" id="pname" name="pname" readonly="readonly" value = "${param.pname }"size="50"></td>
		</tr>
		<tr>
			<th>판매자 ID</th>
			<td><input type="text" id="id" name="id" readonly="readonly" value="${param.id }" size="50"></td>
		</tr>
		<tr>
			<th>요청 가격</th>
			<td><input type="text" name="requestprice" size="50" required="required"></td>
		</tr>
		<tr>
			<th>구매자 ID</th>
			<td><input type="text" readonly="readonly" value="${user.id }" name="buyid" size="50"></td>
		</tr>
		<tr>
			<th>구매 지역</th>
			<td><input type="text" readonly="readonly" value="${user.address }" name="buyaddress" size="50"></td>
		</tr>
		<tr>
			<th>구매자 연락처</th>
			<td><input type="text" name="buyphone" size="50" value="${user.phone }" readonly="readonly"></td>
		</tr>
	</table>
	
			<div class="col-6 col-12-small" style="margin-left: auto;">
			개인정보 이용을 동의하십니까?
			<input type="checkbox" id="demo-checkbox-beta" name="agree">
			<label for="demo-checkbox-beta"></label>
			</div>
			
	<button type="submit" class="button small primary" style="width: 100px; margin-left: auto; font-size: 15px;"  >구매 요청</button>
	</div>
	</form>
</body>

<!-- <script type="text/javascript">
	var pcode  =opener.document.getElementById("pcode").value
	var pname = opener.document.getElementById("pname").value
	var id = opener.document.getElementById("id").value
	
	document.getElementById("pcode").value = pcode;
	document.getElementById("pname").value = pname;
	document.getElementById("id").value = id;
	
</script> -->

<script type="text/javascript">
function check() {
	let result = true
    var agreeCheckbox = document.getElementById("demo-checkbox-beta");
    
    // 동의란에 체크가 되어 있을 때만 구매 요청을 처리
if(!agreeCheckbox.checked) {
       alert('개인정보 이용에 동의해야 구매 요청이 가능합니다.');
        result = false;
    }
    
    
    return result;
}



</script>	





</html>