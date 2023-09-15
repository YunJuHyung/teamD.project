<%@page import="teamD.project.password.PasswordSecret"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="teamD.project.dao.MuserDao"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, java.time.*"%>
<%@ page import="java.sql.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//클라이언트가 전송한 파라미터 값들을 받아옴 name에 해당
	String id = request.getParameter("demo-id");
	String pass = request.getParameter("demo-password");
	PasswordSecret password = new PasswordSecret();
	password.secret(pass);
	String name = request.getParameter("demo-name");
	String nickname = request.getParameter("demo-nickname");
	String birthString = request.getParameter("demo-birth");
	String address = request.getParameter("demo-address");
	String email = request.getParameter("demo-email");
	String checkemail = request.getParameter("demo-checkemail");
	String phone = request.getParameter("demo-phone");
	
	
	java.sql.Date BirthStringConvertToDate = java.sql.Date.valueOf(birthString);
	
	MuserDto user = new MuserDto();
	user.setId(id);
	user.setPassword(password.secret(pass));
	user.setName(name);
	user.setNickname(nickname);
	user.setBirth(BirthStringConvertToDate); // 생년월일을 java.sql.Date로 설정
	user.setAddress(address);
	user.setPhone(phone);
	
	
	
	//세션 저장값을 활용해서 정확한 인증값이 들어왔을때만 join버튼이 되게 하라
	
	
	
	/* ------------------------------------------------------------------ */
		
	
       
        
	/* ------------------------------------------------------------------ */
	MuserDao Mdao = MuserDao.getInstance();
 	int rowsAffected = Mdao.insert(user);
	if (rowsAffected > 0) {
	    // 회원가입 성공한 경우
		String url = "login.jsp";
	    out.println("<script type=\"text/javascript\">");
	    out.println("alert('회원가입 완료. 로그인 페이지로 이동합니다!');");
	    out.println("location.href='"+url+"';");
	    out.println("</script>");
	} else {
	    // 회원가입 실패한 경우
		String url = "join.jsp";
	    out.println("<script type=\"text/javascript\">");
	    out.println("alert('회원가입 실패. 회원가입 창으로 이동합니다!');");
	    out.println("location.href='"+url+"';");
	    out.println("</script>");
	}
	
	
%>

	
	
</body>
</html>