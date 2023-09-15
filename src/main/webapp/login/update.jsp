<%@page import="teamD.project.dao.MuserDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.google.common.collect.ImmutableBiMap.Builder"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신마켓</title>
</head>
<body>
<%

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String name= request.getParameter("name");
	String nickname= request.getParameter("nickname");
	String birth= request.getParameter("birth");
	String address= request.getParameter("address");
	String phone = request.getParameter("phone");
	
	java.sql.Date birthday = null;
	 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 try {
         java.util.Date utilDate = dateFormat.parse(birth);
         birthday = new java.sql.Date(utilDate.getTime());
     } catch (ParseException e) {
         e.printStackTrace();
     }
	
	MuserDto vo = new MuserDto(id,password,name,nickname,birthday,address,phone);
	MuserDao dao = MuserDao.getInstance();
	
	String url = "mypage.jsp";
	String back = (String) session.getAttribute("back");
	if (password.equals(password2)) {
	
	dao.update(vo);
	session.setAttribute("user", vo);
	
	
    out.println("<script type=\"text/javascript\">");
    out.println("alert('정보가 수정되었습니다!');");
    out.println("location.href='"+url+"';");
    out.println("</script>");


	
	} else { 

	url = "updateView.jsp";
    out.println("<script type=\"text/javascript\">");
    out.println("alert('비밀번호가 같지 않습니다!');");
    out.println("location.href='"+url+"';");
    out.println("</script>");
	}
		
		/* response.sendRedirect(url);	 */	
%>

</body>
</html>