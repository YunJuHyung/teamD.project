<%@page import="teamD.project.dto.MuserDto"%>
<%@page import="teamD.project.dao.MuserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String id = request.getParameter("demo-id");
	
	MuserDto user = new MuserDto();
		MuserDao Mdao = MuserDao.getInstance();
		String url = request.getContextPath();
		int duplicateResult = Mdao.checkDuplicateId(id);
		if (duplicateResult == 0) {
		    // 중복 아이디가 없는경우
			out.println("<script>alert('생성가능합니다.');</script>");
			url = "join.jsp?incorrect=y";
			response.sendRedirect(url);
		}else{
			out.println("<script>alert('중복되는 아이디가 있습니다.');</script>");
			//신기하게 url사용하면 alert는 안뜸
			url = "join.jsp?incorrect=n";
			response.sendRedirect(url);
		}
	
%>
		<script type="text/javascript">
		var myid = id;
		sessionStorage.setItem("myid", myid);
		</script>

	
</body>
</html>