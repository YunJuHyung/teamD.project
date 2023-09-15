<%@page import="teamD.project.dto.MuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 


//세션에서 로그인한 사용자 정보를 가져옴
MuserDto user = (MuserDto) session.getAttribute("user");
 
String reciver = request.getParameter("reciveid");

request.setAttribute("reciver", reciver);

pageContext.forward("writemessageView.jsp");
%>

