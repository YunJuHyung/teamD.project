<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="teamD.project.dto.Paging"%>
<%@page import="java.util.List"%>
<%@page import="teamD.project.dto.MproductDto"%>
<%@page import="teamD.project.dao.MproductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    
	MproductDao dao = MproductDao.getInstance();
	MproductDto dto = new MproductDto();
	
	String keyword = request.getParameter("keyword");
	String category = request.getParameter("category");
	
	int pageNo = 0;
	int pageSize = 9;
	
	 if (keyword == null) {
	        keyword = ""; // 또는 적절한 기본값 설정
	    }
	
	 if (category == null) {
	        category = ""; 
	    }
	 
	  if (request.getParameter("page") != null) {
	        try {
	            pageNo = Integer.parseInt(request.getParameter("page"));
	        } catch (NumberFormatException e) {
	            pageNo = 1; 
	        }
	    } else {
	        pageNo = 1;
	    }
	
		Paging pages = null;
		int totalcount = 0;
		if(category.length() == 0 || category == null) { 
			totalcount = dao.searchCount(keyword);
		} else {
			totalcount = dao.categoryCount(category);
		}	
	
	pages = new Paging(pageNo, totalcount, pageSize);
	
	List<MproductDto> list;
	
	Map<String, Object> map = new HashMap<>();
		map.put("start", pages.getStartNo());
		map.put("end", pages.getEndNo());
	
	if(keyword.isEmpty() && category.isEmpty()) {
		list = dao.pagelist(map);
	} else if(category.isEmpty()){
		map.put("keyword", keyword);
		list = dao.searchlist(map);
		request.setAttribute("keyword", keyword);

	} else {
		map.put("category", category);
		list = dao.categorylist(map);
		request.setAttribute("category",category);
	}
	
	request.setAttribute("pagelist", list);
		
	request.setAttribute("page", pageNo);       // 현재 페이지 번호
	request.setAttribute("paging", pages);      // 현재 페이지 번호에 따라 계산된 페이지 목록
	
	pageContext.forward("buyView.jsp");
%>