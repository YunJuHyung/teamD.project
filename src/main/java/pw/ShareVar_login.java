package pw;

public class ShareVar_login {	
	
	public String authEmailCode;
	private static ShareVar_login instance;
	public String[] info() {
		/*********************************** 중요 ************************/
		String[] info= {"witmrv1@naver.com","iclass0419!"};
		return info;
	}

	public ShareVar_login() {
       
    }
	 
	public static ShareVar_login getInstance() {
        if (instance == null) {
            instance = new ShareVar_login(); // 인스턴스가 없는 경우에만 생성
        }
        return instance;
	}
}
