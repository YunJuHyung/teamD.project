<%@page import="teamD.project.dto.McommentDto"%>
<%@page import="teamD.project.dto.MuserDto"%>
<%@page import="teamD.project.dao.McommentDao"%>
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

	//필요한 파라미터 가져오기 : mref,writer,content, f(insert 또는 delete) ,page
	long mref= Long.parseLong(request.getParameter("mref"));		//메인글 idx
	String f = request.getParameter("f");
	String pageNo = request.getParameter("page");
	McommentDao dao = McommentDao.getInstance();
	
	if(f.equals("1")){		//insert
		String content = request.getParameter("content");
		MuserDto user = (MuserDto)session.getAttribute("user");
		String writer = user.getId();
		McommentDto dto = McommentDto.builder()
			.content(content)
			.writer(writer)
			.mref(mref)
			.build();
		if(dao.insert(dto)==1){		//댓글 저장 완료
	dao.setCommentCount(mref);			//댓글 갯수 새로 구하기
	request.setAttribute("message", "댓글 등록이 완료되었습니다.");
		}
	
	}else if (f.equals("2")) {  //delete
		long idx= Long.parseLong(request.getParameter("idx"));
		if(dao.delete(idx)==1) {
	dao.setCommentCount(mref);			//댓글 갯수 새로 구하기
	request.setAttribute("message", "댓글 삭제 완료되었습니다.");
		}
	}else {
		throw new IllegalAccessException();
	}
	
	request.setAttribute("url", "read.jsp?idx="+ mref + "&page="+pageNo);
	pageContext.forward("read.jsp?idx=" + mref + "&page=" + pageNo);
%>
</body>
</html>