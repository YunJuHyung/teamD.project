<%@page import="teamD.project.dto.MuserDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="teamD.project.dao.MproductDao"%>
<%@page import="teamD.project.dto.MproductDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 처리기능 -->
<%
	String path = "D:\\iclass0419\\projectupload";
	//String path = "C:\\Users\\user\\Desktop\\2\\java\\iclass0419\\java_workspace\\teamD\\src\\main\\webapp\\images";
	int size = 10*1024*1024;		//파일 전송 용량 최대 크기
	
	MuserDto user = (MuserDto) session.getAttribute("user");
	MultipartRequest multiRequest = new MultipartRequest(
			request,						//원래의 요청 객체
			path,							//업로드 경로
			size,							//파일 최대 크기
			"UTF-8",						//파일명 인코딩
			new DefaultFileRenamePolicy()	//중복된 파일이름 변경 정책
			);
	
	String pname = multiRequest.getParameter("pname");
	int price = Integer.parseInt(multiRequest.getParameter("price"));
	String brand = multiRequest.getParameter("brand");
	int psize = Integer.parseInt(multiRequest.getParameter("psize"));
	String category = multiRequest.getParameter("category");
	String content = multiRequest.getParameter("content");
	
	//방법 1 임의의 이름으로 파일저장
	//String picture = multiRequest.getFilesystemName("picture");
	//String fileExtension = picture.substring(picture.lastIndexOf("."));
	//String newpicturename = UUID.randomUUID().toString() + fileExtension; 
	
	
	//방법 2 날짜 형식으로 파일 저장 
	String picture = multiRequest.getOriginalFileName("picture");
	String fileExtension = picture.substring(picture.lastIndexOf("."));
	String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	String filename = timeStamp + fileExtension;
	
	
	
	
	File uploadFile = new File(path,filename);
	multiRequest.getFile("picture").renameTo(uploadFile);
	
	
	//파일을 전송 받아 path 경로에 저장하고. 리턴은 받은 파일의 파일명
	
	MproductDto dto = MproductDto.builder()
					.pname(pname)
					.id(user.getId())
		            .price(price)
		            .brand(brand)
		            .psize(psize)
		            .category(category)
		            .picture(filename)
		            .content(content)
		            .build();
			
	MproductDao dao = MproductDao.getInstance();
	dao.insert(dto);
	

%>
<script type="text/javascript">
	alert('상품 등록이 완료 되었습니다.');
	location.href='buy.jsp';


</script>
</html>