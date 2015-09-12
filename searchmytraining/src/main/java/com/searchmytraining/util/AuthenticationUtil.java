package com.searchmytraining.util;

import java.security.SecureRandom;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class AuthenticationUtil {
	
	//@Value("${otp.maxrange}")
	private int max=999999 ;
	//@Value("${otp.minrange}")
	private int min=100000;
	//@Value("${appUrl}")
	private String appUrl;
	

	@Autowired
	private BCryptPasswordEncoder encoder;

	public static String getServerPath(HttpServletRequest request) {
		String path = null;
		String contextPath = request.getServletPath();
		String requestURL = request.getRequestURL().toString();
		int indexOf = StringUtils.indexOf(requestURL, contextPath);
		if (indexOf != -1) {
			path = StringUtils.substring(requestURL, 0, indexOf);
		}
		return path;
	}

	public boolean verifyAccountState(UserDetails user) {

		if (user != null) {
			if (user.isAccountNonLocked() && user.isAccountNonExpired()
					&& user.isCredentialsNonExpired() && user.isEnabled()) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}

	}

	public int generateRandomNumber() {
		Random rand = new Random();
		int randomNum = rand.nextInt((max - min) + 1) + min;
		return randomNum;
	}

	public static String generatePassword() {
		String chars = "abcdefghijklmnopqrstuvwxyz"
				+ "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789!@%$%&^?|~'\"#+="
				+ "\\*/.,:;[]()-_<>";

		final int PW_LENGTH = 20;
		Random rnd = new SecureRandom();
		StringBuilder pass = new StringBuilder();
		for (int i = 0; i < PW_LENGTH; i++)
			pass.append(chars.charAt(rnd.nextInt(chars.length())));
		return pass.toString();
	}
		
	public static String generateVerificationToken(String user){
		
		return UUID.randomUUID().toString();
	}
	
}
