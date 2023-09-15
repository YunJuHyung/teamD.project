<%@page import="teamD.project.dto.MessageDto"%>
<%@page import="java.util.List"%>
<%@page import="teamD.project.dao.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String idx = request.getParameter("m_idx");

	MessageDao dao = MessageDao.getInstance();
	List<MessageDto> messagelist = dao.getMessagesByRecipient(idx);

	

	request.setAttribute("messagelist", messagelist);
	pageContext.forward("readmessageView.jsp");





%>
