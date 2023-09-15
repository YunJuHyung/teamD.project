<%@page import="java.time.LocalDate"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="teamD.project.dto.MqaDto"%>
<%@page import="teamD.project.dao.MqaDao"%>
<%@page import="teamD.project.dao.MserviceDao"%>
<%@page import="teamD.project.dto.MserviceDto"%>
<%@page import="teamD.project.dto.McommunityDto"%>
<%@page import="teamD.project.dto.Paging"%>
<%@page import="teamD.project.dao.McommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // selectedContent 파라미터 가져오기
    String selectedContent = request.getParameter("selectedContent");

    // 공지사항 관련 변수 및 객체 초기화
    MserviceDao noticedao = MserviceDao.getInstance();
    String searchType = request.getParameter("WhichSearch");
    String keyword = request.getParameter("keyword");
    int noticepageNo=1;
    int noticepageSize = 10;
    String noticedisplay = null;
    int qandapageNo = 1;
    int qandaPageSize = 10;
    String qandadisplay = null;


    // 페이지 번호 설정 및 검색 결과 유무 확인
    if (request.getParameter("noticepage") != null) {
        noticepageNo = Integer.parseInt(request.getParameter("noticepage"));
    }

    // 검색 조건 및 키워드 설정
    if (searchType == null) {
        searchType = "";
    }
    if (keyword == null) {
        keyword = "";
    }

    // 공지사항 페이징 처리
    Paging noticepages = new Paging(noticepageNo, noticedao.searchCount(searchType, keyword), noticepageSize);
    List<MserviceDto> noticelist = null;

    Map<String, Integer> map = new HashMap<>();
    map.put("start", noticepages.getStartNo());
    map.put("end", noticepages.getEndNo());

    // 검색 결과 가져오기
    if (searchType.isEmpty() || keyword.isEmpty()) {
        noticelist = noticedao.pagelist(map);
    } else {
        noticelist = noticedao.searchPagelist(searchType, keyword, noticepages.getStartNo(), noticepages.getEndNo());
    }

    // Q&A 관련 변수 및 객체 초기화
    MqaDao qandaDao = MqaDao.getInstance();
    
    if (request.getParameter("qandapage") != null) {
        qandapageNo = Integer.parseInt(request.getParameter("qandapage"));
    }

    if (selectedContent == null) {
    	selectedContent="notice";
        noticedisplay = "yes";
    }else if(selectedContent.equals("qanda"))
    	qandadisplay ="yes";
    else if(selectedContent.equals("notice"))
    	noticedisplay = "yes";
    
    
    Paging qandaPages = new Paging(qandapageNo, qandaDao.qsearchCount(searchType, keyword), qandaPageSize);
    List<MqaDto> qandaList = null;

    Map<String, Integer> qandaMap = new HashMap<>();
    qandaMap.put("start", qandaPages.getStartNo());
    qandaMap.put("end", qandaPages.getEndNo());

    // Q&A 검색 결과 가져오기
    if (searchType.isEmpty() || keyword.isEmpty()) {
        qandaList = qandaDao.pagelist1(qandaMap);
    } else {
        qandaList = qandaDao.qsearchPagelist(searchType, keyword, qandaPages.getStartNo(), qandaPages.getEndNo());
    }
    
    // 결과를 request 속성에 저장
    request.setAttribute("today", LocalDate.now());
    request.setAttribute("noticepage", noticepageNo);
    request.setAttribute("noticepaging", noticepages);
    request.setAttribute("noticeList", noticelist);
    request.setAttribute("qandaList", qandaList);
    //request.setAttribute("qandadisplay", qandadisplay);
    //request.setAttribute("noticedisplay", noticedisplay);
    request.setAttribute("qandapage", qandapageNo);
    request.setAttribute("qandapaging", qandaPages);
    request.setAttribute("selectedContent", selectedContent); // selectedContent를 request 속성에 저장

    // 검색 유형에 따라 결과를 다른 JSP 페이지로 포워딩
    if ("notice".equals(selectedContent)) {
        if ("notice".equals(searchType) || "".equals(searchType)) {
            request.setAttribute("noticelist", noticelist);
        } else if ("qanda".equals(searchType)) {
            request.setAttribute("qandaList", qandaList);
        }
    } else if ("qanda".equals(selectedContent)) {
        if ("qanda".equals(searchType) || "".equals(searchType)) {
            request.setAttribute("qandaList", qandaList);
        } else if ("notice".equals(searchType)) {
            request.setAttribute("noticelist", noticelist);
        }
    }

    pageContext.forward("serviceView.jsp");
%>
