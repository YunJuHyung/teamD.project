package sendemail;

import java.util.Random;
import java.util.Scanner;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import pw.ShareVar_login;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;

public class EmailService {

	private static String authEmailCode; // authEmailCode 값을 저장하는 필드

	public String getAuthEmailCode() { //? 이거 왜 이렇게 있는거지
		return authEmailCode;
	}
	//authCodeCheck 에 21번째줄 보내는 이메일 아이디를 설정하고 randomUUID 값을 저장함 추후에 비교값으로 사용하기위해서 
	public static void getemail(String email) {
        	Scanner sc = new Scanner(System.in);
        	pw.ShareVar_login shareVar = new pw.ShareVar_login();
        	String[] info = shareVar.info();
        	//보내는 사람의 메일주소 패스워드를 입력해주세요
                //mail server 설정
                String host = "smtp.naver.com";
                String user = info[0]; //자신의 네이버 계정. 보내는 메일 주소
                
                //System.out.print("user에 해당하는 비밀번호 입력 : ");
               // String strpass = sc.nextLine();
                String password = info[1]; //보안성문제로 일단 ShareVar_login 에서 가져오기 
                								//자신의 네이버 패스워드
                String to_email = email;		//인증받을 사용자의 메일주소
                sc.close();
                
                
                //패스워드 및 회원가입 시 사용자가 입력한 인증키를 비교하기 위해 애트리뷰트 저장
                //request.getRequestDispatcher("keyConfirm.jsp").forward(request, response);

                //SMTP 서버 정보를 설정한다.
                try {
                Properties props = new Properties();
                props.put("mail.smtp.host", host);
                props.put("mail.smtp.port", 587); //네이버 고유의 포트를 뜻함 메일 서버를 빌려옴
                props.put("mail.smtp.auth", "true");
                
                props.put("mail.smtp.ssl.protocols", "TLSv1.2");
                
                //인증 번호 생성기 1
               
//                String AuthenticationKey;
//                AuthenticationKey=UUID.randomUUID().toString();		//실제로는 인증값으로 substring (일부) 보내기
               
                
//                HttpSession saveKey = request.getSession();
//                saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
                
             // 인증 번호 생성기 2
        		StringBuffer temp = new StringBuffer();
        		Random rnd = new Random();
        		for (int i = 0; i < 10; i++) {
        			int rIndex = rnd.nextInt(3);
        			switch (rIndex) {
        			case 0:
        				// a-z
        				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
        				break;
        			case 1:
        				// A-Z
        				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
        				break;
        			case 2:
        				// 0-9
        				temp.append((rnd.nextInt(10)));
        				break;
        			}
        		}
        		
        		//.인증 번호 생성기3
//        		 authCodeMaker()
//
//        		 영문 대문자-소문자, 숫자로 이루어진 랜덤한 10자리의 인증코드를 만들어줍니다.
//

        		
        		String AuthenticationKey = temp.toString();
        		System.out.println(AuthenticationKey);
        		
        		
                
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(user,password);
                    }
                });
                
                //email 전송
                
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(user));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                    System.out.println(to_email);
                    //메일 제목
                    msg.setSubject("안녕하세요 당신마켓 인증 메일입니다.");
                    //메일 내용
                    msg.setText("인증 번호는 :"+AuthenticationKey);
                    
                    Transport.send(msg);
                    System.out.println("이메일 전송");
                    ShareVar_login sv = ShareVar_login.getInstance();
        			sv.authEmailCode = AuthenticationKey;
        			authEmailCode = AuthenticationKey;
        			System.out.println(sv.authEmailCode + " uuid 확인 입니덩");
                    
                }catch (Exception e) {
                    e.printStackTrace();// TODO: handle exception
                }
                

    }
      
}
