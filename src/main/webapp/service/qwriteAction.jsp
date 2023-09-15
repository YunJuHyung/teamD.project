<%@page import="teamD.project.dto.MqaDto"%>
<%@page import="teamD.project.dao.MqaDao"%>
<%@page import="teamD.project.dto.McommentDto"%>
<%@page import="teamD.project.dao.MqcommentDao"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@page import="teamD.project.dto.McommunityDto"%>
<%@page import="teamD.project.dao.McommunityDao"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.net.Inet4Address"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	request.setCharacterEncoding("UTF-8");		필터가 실행함

	MuserDto writer = (MuserDto) session.getAttribute("user");
//	 작성자는 문제점을 발견하기 위한 추가 사항이고 나중에는 삭제합니다. 아래와 같이 하면 세션 비교 코드 필요함


//	String writer = request.getParameter("writer");
	
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	MqaDao dao = MqaDao.getInstance();
	long idx = dao.qinsert(MqaDto.builder()
			.writer(writer.getId())
	//		.writer(writer)
			.title(title)
			.content(content)
			.build());
%>
	<script type="text/javascript">
	alert('글 등록이 완료 되었습니다.')
	location.href='service.jsp'
	</script>


