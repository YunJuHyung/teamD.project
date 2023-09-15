<%@page import="teamD.project.dto.MuserDto"%>
<%@page import="teamD.project.dto.Paging"%>
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

	session = request.getSession();	
	MuserDto vo = (MuserDto) session.getAttribute("user");
	
	MproductDao dao = MproductDao.getInstance();
	
	


	int buypageNo = 0;
	int buypageSize = 4;
	String buydisplay = null;
	
	if(request.getParameter("buypage")==null){
		buypageNo=1;
	}
	else{ 
		buypageNo = Integer.parseInt(request.getParameter("buypage"));
		buydisplay = "yes";	
	
	}

	Paging buypages = new Paging(buypageNo,dao.buycount(vo.getId()),buypageSize);

	Map<String,Object> map = new HashMap<>();
	map.put("id",vo.getId());
	map.put("start",buypages.getStartNo());
	map.put("end",buypages.getEndNo());

	List<MproductDto> mybuylist = dao.buylist(map);
	
	request.setAttribute("mybuylist", mybuylist);
	request.setAttribute("buypage", buypageNo);			// 현재 페이지 번호
	request.setAttribute("buypaging", buypages);  		// 현재 페이지 번호에 따라 계산된 페이지 목록


	
	
	
	int sellpageNo = 0;
	int sellpageSize = 4;
	String selldisplay= null;
	
	if(request.getParameter("sellpage")==null) 
		{	sellpageNo=1;
		
		}
	else {
		sellpageNo = Integer.parseInt(request.getParameter("sellpage"));
		selldisplay = "yes";	
	}
	
	
	
	if(buydisplay==null && selldisplay==null){
		buydisplay="yes";
	}
	
	

	Paging sellpages = new Paging(sellpageNo,dao.sellcount(vo.getId()),sellpageSize);

	Map<String,Object> map1 = new HashMap<>();
	map1.put("id",vo.getId());
	map1.put("start",sellpages.getStartNo());
	map1.put("end",sellpages.getEndNo());

	List<MproductDto> myselllist = dao.selllist(map1);

	request.setAttribute("myselllist", myselllist);
	request.setAttribute("buydisplay", buydisplay);
	request.setAttribute("selldisplay", selldisplay);
	request.setAttribute("sellpage", sellpageNo);			// 현재 페이지 번호
	request.setAttribute("sellpaging", sellpages);  		// 현재 페이지 번호에 따라 계산된 페이지 목록

	
	pageContext.forward("mypageView2.jsp");
	
	
%>