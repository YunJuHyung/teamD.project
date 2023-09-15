<%@page import="teamD.project.dto.MqcommentDto"%>
<%@page import="teamD.project.dao.MqcommentDao"%>
<%@page import="teamD.project.dto.MqaDto"%>
<%@page import="teamD.project.dao.MqaDao"%>
<%@page import="teamD.project.dto.MserviceDto"%>
<%@page import="teamD.project.dao.MserviceDao"%>
<%@page import="teamD.project.dto.McommentDto"%>
<%@page import="teamD.project.dao.McommentDao"%>
<%@page import="teamD.project.dto.McommunityDto"%>
<%@page import="teamD.project.dao.McommunityDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int idx=0; 
	int pageNo =0;
	if(request.getParameter("idx") !=null) {
      idx = Integer.parseInt(request.getParameter("idx"));
	}

    if(request.getParameter("page")!=null) {
        pageNo = Integer.parseInt(request.getParameter("page"));
    }
            
   	MqaDao dao = MqaDao.getInstance();
    dao.qsetReadCount(idx);			//조희수 증가
    MqaDto vo = dao.qselectByIdx(idx);	//idx 글 조회하기

    //(1)
    request.setAttribute("vo1", vo);
    //(2)
    request.setAttribute("page", pageNo);
    
    MqcommentDao cmtdao = MqcommentDao.getInstance();
    List<MqcommentDto> cmtlist = cmtdao.commentsList(idx);
    
    request.setAttribute("cmtlist", cmtlist);
    pageContext.forward("qareadView.jsp");		//화면에 애트리뷰트와 함께 요청 전달.
%>