<%@page import="teamD.project.dao.MessageDao"%>
<%@page import="teamD.project.dto.MessageDto"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	MuserDto user = (MuserDto)session.getAttribute("user");
	String sendid = request.getParameter("sendid");
	String reciveid= request.getParameter("reciveid");
	String message = request.getParameter("message");
	
	MessageDto mess = new MessageDto();
	mess.setSendid(sendid);
	mess.setReciveid(reciveid);
	mess.setMessage(message);
	
	MessageDao dao = MessageDao.getInstance();
	dao.insert(mess); 
%>
<script type="text/javascript">
	alert('쪽지 전송 완료!')
	window.close();
</script>
</html>