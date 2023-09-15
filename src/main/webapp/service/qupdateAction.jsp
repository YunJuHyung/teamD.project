<%@page import="teamD.project.dto.MqaDto"%>
<%@page import="teamD.project.dao.MqaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String ip=request.getRemoteAddr();
   long idx= Long.parseLong(request.getParameter("idx"));
   String title = request.getParameter("title");
   String content= request.getParameter("content");
   String pageNo= request.getParameter("page");
   MqaDto vo = MqaDto.builder()
		   .idx(idx)
		   .title(title)
		   .content(content)
		   .build();
   	MqaDao dao = MqaDao.getInstance();
    int result = dao.qupdate(vo);
    if(result==1){
    	request.setAttribute("message","글 수정이 완료 되었습니다.");
    	request.setAttribute("url","qaread.jsp?idx="+idx+"&page="+pageNo);
     }
    	pageContext.forward("alert.jsp");
   %>
    