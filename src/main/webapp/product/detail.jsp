<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="teamD.project.dto.MproductDto"%>
<%@page import="teamD.project.dao.MproductDao"%>
<% 

	int pcode = 0;
	int pageNo = 0;
	if(request.getParameter("pcode")!=null){
		pcode = Integer.parseInt(request.getParameter("pcode"));
	}	
	if(request.getParameter("page")!=null){
		pageNo = Integer.parseInt(request.getParameter("page"));
	}
	
	MproductDao dao = MproductDao.getInstance();
	dao.readCount(pcode);
	MproductDto vo = dao.detail(pcode);
	
	
	request.setAttribute("vo", vo);
	request.setAttribute("page", pageNo);
	
	pageContext.forward("detailView.jsp");





%>