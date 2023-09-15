<%@page import="teamD.project.dto.MqcommentDto"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@page import="teamD.project.dao.MqcommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	long mref= Long.parseLong(request.getParameter("mref"));
	String f = request.getParameter("f");
	String pageNo = request.getParameter("page");
	MqcommentDao dao = MqcommentDao.getInstance();
	
	if(f.equals("1")){		//insert
	String content = request.getParameter("content");
	MuserDto user = (MuserDto)session.getAttribute("user");
	String writer = user.getId();
	
		MqcommentDto dto = MqcommentDto.builder()
					.content(content)
					.mref(mref)
					.writer(writer)
					.build();
		
		if(dao.insert(dto)==1){		//댓글 저장 완료
			dao.setqCommentCount(mref);			//댓글 갯수 새로 구하기
			request.setAttribute("message", "댓글 등록이 완료되었습니다.");
		}
	
		}else if (f.equals("2")) {  //delete
			long idx = Long.parseLong(request.getParameter("idx"));
			if(dao.delete(idx)==1) {	// 마이바티스에서 insert, delete, update는 자동으로 반환을 해주기 때문에 삭제 목록이 1개인지 학인하는것이다.
				dao.setqCommentCount(mref);
				request.setAttribute("message", "댓글 삭제가 완료되었습니다.");
			}	
		} else {
			throw new IllegalAccessException();
		}
			request.setAttribute("url", "qaread.jsp?idx="+ mref + "&page="+pageNo);
			pageContext.forward("alert.jsp");
%>
</body>
</html>