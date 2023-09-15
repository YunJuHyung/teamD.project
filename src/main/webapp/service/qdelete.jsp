<%@page import="teamD.project.dao.MqaDao"%>
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
	
	MqaDao dao = MqaDao.getInstance();
	if(dao.qdelete(idx)==1) {
		request.setAttribute("message"," 삭제되었습니다.");
		request.setAttribute("url", "service.jsp?page="+pageNo);
	}
	pageContext.forward("alert.jsp");
%>

</body>
</html>