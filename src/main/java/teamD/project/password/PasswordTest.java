package teamD.project.password;

public class PasswordTest {
	public static void main(String[] args) {
		
		String pass="astaldod!!@@";
		PasswordSecret pss= new PasswordSecret();
		System.out.println(pss.secret(pass));
		
	}
}
