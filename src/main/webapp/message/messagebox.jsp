<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="teamD.project.dao.MessageDao"%>
<%@ page import="teamD.project.dto.MessageDto"%>
<%@ page import="java.util.List"%>
<%@ page import="teamD.project.dto.MuserDto"%>
<%
// 파라미터로 받은 사용자 ID
String userId = request.getParameter("userId");

// userId가 null이면 세션에서 로그인한 사용자 정보를 가져옴
if (userId == null) {
    MuserDto loggedInUser = (MuserDto) session.getAttribute("user");
    if (loggedInUser != null) {
        userId = loggedInUser.getId();
    }
}

// userId가 여전히 null이면 로그인 페이지로 리다이렉트
if (userId == null) {
    response.sendRedirect("../login/login.jsp");
} else {
    // 받은 쪽지 목록을 가져오는 예시 코드
    MessageDao dao = MessageDao.getInstance();
    List<MessageDto> receivedMessages = dao.getMessagesByRecipient(userId);

    // 받은 쪽지 목록을 request 속성에 저장
    request.setAttribute("receivedMessages", receivedMessages);

    // 결과를 보여줄 JSP 페이지로 포워드
   	pageContext.forward("messageboxView.jsp");
}
%>
