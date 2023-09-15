<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="teamD.project.dao.MbuyDao"%>
<%@page import="teamD.project.dto.MbuyDto"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>    
<%
		
	int pcode = Integer.parseInt(request.getParameter("pcode"));
	String pname = request.getParameter("pname");
	String id = request.getParameter("id");
	String buyid = request.getParameter("buyid");
	String buyphone =request.getParameter("buyphone");
	int requestprice = Integer.parseInt(request.getParameter("requestprice"));
	String buyaddress = request.getParameter("buyaddress");
	String phone = request.getParameter("buyphone");
	

	MbuyDto bdto = MbuyDto.builder()
			.pcode(pcode)
			.pname(pname)
			.id(id)
			.requestprice(requestprice)
			.buyid(buyid)
			.buyphone(buyphone)
			.buyaddress(buyaddress)
			.buyphone(buyphone)
			.build();


	MbuyDao dao = MbuyDao.getInstance();
	
	Map<String,Object> map = new HashMap<>();
	map.put("id",buyid);
	map.put("pcode",pcode);
	
	int dto = dao.paylist(map);
		
	
	
	
	Map<String,Integer> updatemap = new HashMap<>();
	updatemap.put("requestprice", requestprice);
	updatemap.put("pcode",pcode);
	
	
	
	if(dto == 1){
		dao.update(updatemap);
		System.out.println("업데이트");
	}else if (dto == 0){
		dao.buyinsert(bdto);
		System.out.println("인서트");
	}
	

%>
<script type="text/javascript">
	alert('판매 요청이 완료 되었습니다.')
	window.close();

</script> 

</html>
