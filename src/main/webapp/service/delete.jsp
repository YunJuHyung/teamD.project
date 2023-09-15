<%@page import="teamD.project.dao.MserviceDao"%>
<%@page import="teamD.project.dao.McommunityDao"%>
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
	long idx = Long.parseLong(request.getParameter("idx"));
	String pageNo = request.getParameter("page");
	
	MserviceDao dao = MserviceDao.getInstance();
	if(dao.delete(idx)==1) {
		request.setAttribute("message", "글번호" + idx + " 삭제되었습니다.");
		request.setAttribute("url", "service.jsp?page="+pageNo);
	}
	pageContext.forward("service.jsp");
%>

</body>
</html>