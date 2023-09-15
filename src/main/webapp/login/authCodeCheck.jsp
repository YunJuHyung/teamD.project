<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.io.Console"%>
<%@ page import="pw.ShareVar_login"%>
<%@ page import="sendemail.EmailService"%>

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
   EmailService emailService = new EmailService();

   String result = "false";
   String authCode = emailService.getAuthEmailCode();
   String inputedCode = request.getParameter("inputedCode");
   //out.println(" inputedCode: " + inputedCode +"\n"); // inputedCode 값을 출력하여 확인
   //   session.setAttribute("emailVerified", "");
   if (authCode.equals(inputedCode)) {
      session.setAttribute("emailVerified", "yes");
      result="true";
   }else {
      session.setAttribute("emailVerified", "no");
   }

%>

   <script type="text/javascript">
    var jsResult = "<%=result%>";
    var inputedCode = "<%=inputedCode%>";
   
    function handleEmailVerification() {
        // null 또는 undefined 확인
           if (inputedCode == "" || jsResult == undefined) {
               alert("인증번호가 올바르지 않습니다.");
               window.opener.document.getElementById("demo-checkemail").value = "false";
               self.close();
               return 0;
           }   
           if (jsResult === "true") { // 문자열로 비교
               console.log("ht");
               alert("인증이 완료되었습니다.");
               window.opener.document.querySelector('#joinButton').disabled =false;
               self.close();
               return 1;
           } else {
               alert("인증번호가 올바르지 않습니다.");
               window.opener.document.querySelector('#joinButton').disabled = true;
               self.close();
               
               return 0;
           }
        }
        
        //페이지 로딩 시 handleEmailVerification 함수 실행
        handleEmailVerification();
</script>
</body>
</html>