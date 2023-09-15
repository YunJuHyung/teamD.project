<%@page import="teamD.project.dto.MessageDto"%>
<%@page import="teamD.project.dao.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx= request.getParameter("m_idx");
	long m_idx= Long.parseLong(idx);
	
	MessageDao dao = MessageDao.getInstance();
	MessageDto dto = dao.getMessageBymidx(m_idx);
	
	dao.statusupdate(m_idx);
	request.setAttribute("byidx", dto);
	
	pageContext.forward("getmessageView.jsp");
	
%>