<%@page import="teamD.project.password.PasswordSecret"%>
<%@page import="teamD.project.dao.MbuyDao"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@page import="teamD.project.dao.MuserDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
		String id = request.getParameter("demo-name"); //login에서 받아오는 name의 파라미터 값이필요함
		String password = request.getParameter("demo-password");
		//할일 : dao 로 id,password 확인하는 메소드 실행
		Map<String, String> map = new HashMap<>();
		PasswordSecret pass= new PasswordSecret();
		map.put("id", id); //map으로 생성된 key 값을 가져와야한다.
		map.put("password", pass.secret(password));
		MuserDao dao = MuserDao.getInstance();
		MuserDto vo = dao.login(map);
		
		
		MbuyDao buydao = MbuyDao.getInstance();
		
		String url = request.getContextPath();
		String back = (String) session.getAttribute("back");
		if (vo != null) {
		//로그인 성공
		session.setAttribute("user", vo); //핵심.
		
	if (back != null) {
			url = back;
			session.removeAttribute("back"); //back 이름의 애트리뷰트 삭제
		}
			} else { //로그인 실패
		url = "login.jsp?incorrect=y";
			}
			
			response.sendRedirect(url);		//index.jsp
%>
</body>
</html>