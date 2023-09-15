<%@page import="teamD.project.dto.McommunityDto"%>
<%@page import="teamD.project.dto.Paging"%>
<%@page import="teamD.project.dao.McommunityDao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="teamD.project.dao.McommunityDao"%>
<%@page import="teamD.project.dto.McommunityDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    McommunityDao dao = McommunityDao.getInstance();

    String searchType = request.getParameter("WhichSearch");
    String keyword = request.getParameter("keyword");

    int pageNo;
    int pageSize = 10;   

    if (searchType == null) {
        searchType = ""; // 또는 적절한 기본값 설정
    }

    if (keyword == null) {
        keyword = ""; // 또는 적절한 기본값 설정
    }

    if (request.getParameter("page") != null) {
        try {
            pageNo = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            pageNo = 1; // 페이지 번호 파라미터가 잘못된 경우 기본값 설정
        }
    } else {
        pageNo = 1;
    }

    Paging pages = new Paging(pageNo, dao.searchCount(searchType, keyword), pageSize);
    List<McommunityDto> list;
    Map<String,Integer> map = new HashMap<>();

    map.put("start", pages.getStartNo()); // 요청된 페이지번호로 글목록 시작번호
    map.put("end", pages.getEndNo());     // 마지막번호

    if (searchType.isEmpty() || keyword.isEmpty()) {
        // 검색 파라미터가 없을 경우 전체 리스트 표시
        list = dao.pagelist(map);
    } else {
        // 검색 파라미터가 있는 경우 검색 결과 표시
        list = dao.searchPagelist(searchType, keyword, pages.getStartNo(), pages.getEndNo());
    }

    request.setAttribute("list", list); // 검색 또는 전체 리스트
    request.setAttribute("today", LocalDate.now());   // 오늘 날짜

    // 페이지 번호를 애트리뷰트로 저장
    request.setAttribute("page", pageNo);     // 현재 페이지 번호
    request.setAttribute("paging", pages);  // 현재 페이지 번호에 따라 계산된 페이지 목록

    pageContext.forward("communityView.jsp");
%>
