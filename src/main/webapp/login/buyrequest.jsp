<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="teamD.project.dto.Paging"%>
<%@page import="java.util.List"%>
<%@page import="teamD.project.dto.MbuyDto"%>
<%@page import="teamD.project.dao.MbuyDao"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@page import="teamD.project.dto.MproductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String para= request.getParameter("pcode");

	int pcode=Integer.parseInt(para); 
	
	session=request.getSession();
	
	
	MbuyDao dao = MbuyDao.getInstance();
	 
	request.setAttribute("pcode", para);
	
	
	
	int pageNo = 0;
	int pageSize = 5;

	if(request.getParameter("page")==null) pageNo=1;
	else pageNo = Integer.parseInt(request.getParameter("page"));

	Paging pages = new Paging(pageNo,dao.pcodecount(pcode),pageSize);

	Map<String,Integer> map = new HashMap<>();
	map.put("pcode",pcode);
	map.put("start",pages.getStartNo());
	map.put("end",pages.getEndNo());

	List<MbuyDto> pcodelist = dao.pcodelist(map);
	request.setAttribute("pcodelist", pcodelist);

	request.setAttribute("page", pageNo);			// 현재 페이지 번호
	request.setAttribute("paging", pages);  		// 현재 페이지 번호에 따라 계산된 페이지 목록
	
	pageContext.forward("buyrequestView.jsp");
%>
