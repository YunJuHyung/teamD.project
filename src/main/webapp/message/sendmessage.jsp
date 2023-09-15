<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="teamD.project.dao.MessageDao"%>
<%@page import="teamD.project.dto.MessageDto"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
    <title>당신마켓 - 쪽지 전송</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/NewFile.css" />
</head>
<body class="is-preload">
<%
// 세션에서 로그인한 사용자 정보를 가져옴
MuserDto loggedInUser = (MuserDto) session.getAttribute("user");

// 로그인한 사용자 정보가 없을 경우 로그인 페이지로 리다이렉트
if (loggedInUser == null) {
    response.sendRedirect("${pageContext.request.contextPath}/login/login.jsp");
} else {
    // 로그인한 사용자 정보를 이용하여 쪽지를 보내는 기능을 수행
    String sender = loggedInUser.getId();

    if (request.getMethod().equals("POST")) {
        String recipient = request.getParameter("recipient");
        String messageContent = request.getParameter("message");

        // MessageDao를 이용하여 쪽지 보내기
        MessageDao dao = MessageDao.getInstance();
        MessageDto message = new MessageDto();
        message.setSendid(sender); // 보내는 사람 설정
        message.setReciveid(recipient); // 받는 사람 설정
        message.setMessage(messageContent); // 쪽지 내용 설정
        message.setM_date(new java.sql.Timestamp(new java.util.Date().getTime())); // 현재 시간 설정

        // 쪽지를 데이터베이스에 저장
        int result = dao.insert(message);

        // 쪽지 전송 결과에 따라 메시지 표시
        if (result > 0) {
%>
            <script>
                alert("쪽지가 전송되었습니다.");
                window.close();
            </script>
<%
        } else {
%>
            <script>
                alert("쪽지 전송에 실패했습니다. 다시 시도해주세요.");
                history.back();
            </script>
<%
        }
    }
}
%>
</body>
</html>
