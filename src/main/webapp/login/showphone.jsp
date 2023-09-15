<%@page import="teamD.project.dto.MproductDto"%>
<%@page import="teamD.project.dao.MproductDao"%>
<%@page import="teamD.project.dao.MbuyDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="teamD.project.dto.MbuyDto"%>
<%@page import="teamD.project.dao.MuserDao"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String buyid= request.getParameter("buyid");
	String code = request.getParameter("pcode");
	int pcode= Integer.parseInt(code);
	
	MuserDao dao = MuserDao.getInstance();
	MuserDto dto = dao.one(buyid); /* 엠유저 검색해서 전화번호 띄우기 위한 DAO */
	Map<String,Object> map = new HashMap<>();
	map.put("buyid",buyid);
	map.put("pcode",pcode);
	
	MbuyDao buydao = MbuyDao.getInstance();
	MbuyDto buydto = buydao.onembuy(map); /* 상품코드와 파라미터를 맵타입으로 묶어서 해당 구매요청데이터 불러오기 */
	
	/* UPDATE mproduct SET price=#{requestprice},buyid=#{buyid}, buyat = sysdate, status=1 WHERE pcode = #{pcode} ; */
	Map<String,Object> updatemap = new HashMap<>();
	updatemap.put("requestprice",buydto.getRequestprice());
	updatemap.put("buyid",buydto.getBuyid());
	updatemap.put("pcode",buydto.getPcode());
	MproductDao prodao = MproductDao.getInstance();
	prodao.update(updatemap); 
	buydao.delete(pcode);
	
	
	request.setAttribute("dto", dto);
	pageContext.forward("showphoneView.jsp");
%>