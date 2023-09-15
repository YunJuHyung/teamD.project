<%@page import="teamD.project.dto.MuserDto"%>
<%@page import="teamD.project.dto.MserviceDto"%>
<%@page import="teamD.project.dao.MserviceDao"%>
<%@page import="teamD.project.dto.McommunityDto"%>
<%@page import="teamD.project.dao.McommunityDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	request.setCharacterEncoding("UTF-8");		필터가 실행함

  MuserDto writer = (MuserDto) session.getAttribute("user");
  String allowedUserId = "madmin"; // 특정 사용자의 ID를 여기에 설정

  if (writer != null && writer.getId().equals(allowedUserId)) {
    // 특정 사용자일 경우에만 글 작성을 허용
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    MserviceDao dao = MserviceDao.getInstance();
    long idx = dao.insert(MserviceDto.builder()
        .writer(writer.getId())
        .title(title)
        .content(content)
        .build());
%>
<script type="text/javascript">
  alert('글 등록이 완료 되었습니다.');
  location.href='service.jsp';
</script>
<%
  } else {
%>
<script type="text/javascript">
  alert('글을 작성할 권한이 없습니다.');
  location.href='service.jsp';
</script>
<%
  }
%>
