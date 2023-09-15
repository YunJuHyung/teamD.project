package teamD.project.password;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.google.common.hash.Hashing;

public class PasswordSecret {
	
	public String secret(String password) {
		password = Hashing.sha256()					//적용할 해시함수 실행
				.hashString(password, StandardCharsets.UTF_8)   //평문, 인코딩 형식
				.toString();
		
		return password;
	}
	
}
