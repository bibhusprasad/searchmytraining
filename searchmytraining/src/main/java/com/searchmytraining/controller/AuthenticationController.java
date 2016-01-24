package com.searchmytraining.controller;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/rest/security")
public class AuthenticationController {

	public HttpHeaders getJsonHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		return headers;
	}
	@RequestMapping("/login")
	public String login(ModelMap model) {
		
		return "pages/LogIn";
		
	}

	@RequestMapping(value = "/authentication-failure", method = RequestMethod.GET)
	public ResponseEntity<String> authenticationFailure(
			HttpServletRequest request) {
		System.out.println("in...authentication-failure");
		String errorMessage = ((Exception) request.getSession().getAttribute(
				"SPRING_SECURITY_LAST_EXCEPTION")).getMessage();
		System.out.println("errorMessage: "+errorMessage);
		return new ResponseEntity<String>(
				"{\"success\" : false, \"message\" : \"" + errorMessage + "\"}",
				getJsonHeaders(), HttpStatus.OK);
	}

	@RequestMapping(value = "/authentication-success", method = RequestMethod.GET)
	public ResponseEntity<String> authenticationSuccess(
			HttpServletRequest request) {
		Authentication authentication = SecurityContextHolder.getContext()
				.getAuthentication();

		Set<String> roles = AuthorityUtils.authorityListToSet(authentication
				.getAuthorities());
		String page = null;
		if (roles.contains("ROLE_ADMIN")) {
			page = "/admin_updateprofile";

		} else if (roles.contains("ROLE_TPI")) {
			page = "/trainingprovider_updateprofile";
		} else if (roles.contains("ROLE_TPF")) {
			page = "/freelancer/mapFLUpdateProfile";

		} else if (roles.contains("ROLE_TRAINEE")) {
			page = "/trainee/login";
		}

		return new ResponseEntity<String>("{\"success\" : true, \"page\" : \""
				+ page + "\"}", getJsonHeaders(), HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/logout-success", method = RequestMethod.GET)
	public String logoutSuccess(HttpServletRequest request) {
		
		return "pages/LogIn";
		
	}
	
	
	public static void main(String[] args) {
		org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println(encoder.encode("123456"));
	}
}