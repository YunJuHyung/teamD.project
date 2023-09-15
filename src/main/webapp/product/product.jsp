<%@page import="teamD.project.dto.MessageDto"%>
<%@page import="teamD.project.dao.MessageDao"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@page import="teamD.project.dao.MbuyDao"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="teamD.project.dto.MproductDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="teamD.project.dao.MproductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MproductDao dao = MproductDao.getInstance();
	MbuyDao buydao = MbuyDao.getInstance();	
	MessageDao messagedao = MessageDao.getInstance();
	
	MuserDto user =  (MuserDto)session.getAttribute("user");
	
	if(user != null){
	String id = user.getId();
		int requestcount =	buydao.requestcount(user.getId());
	List<MessageDto> messagelist = messagedao.getMessagesByRecipient(user.getId());
		session.setAttribute("requestcount", requestcount);
		session.setAttribute("messagelist", messagelist);
	} 
	
	
	
	
	List<MproductDto> list = dao.list();
	List<MproductDto> recentlist = dao.recentlist();
	List<MproductDto> mostlist = dao.mostlist();
	
	request.setAttribute("list", list);
	request.setAttribute("recentlist", recentlist);
	request.setAttribute("mostlist", mostlist);
	pageContext.forward("productView.jsp");
	
	

%>