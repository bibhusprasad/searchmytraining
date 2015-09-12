package com.searchmytraining.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.searchmytraining.form.ForgotPasswordBean;
import com.searchmytraining.security.SMTUser;
import com.searchmytraining.service.EmailNotificationService;
import com.searchmytraining.service.IPasswordMgntService;
import com.searchmytraining.service.impl.SMTUserDetailsService;
import com.searchmytraining.util.AuthenticationUtil;

@Controller

public class PasswordController {
	static Logger logger = Logger.getLogger(PasswordController.class.getName());

	@Value("${forgotpwd.mailsub.otp}")
	private String mailSubOtp;
	
	@Value("${forgotpwd.msgfilename.otp}")
	private String msgFileNameOtp;
	
	@Value("${forgotpwd.mailsub.confm}")
	private String mailSubConfirmation;
	
	@Value("${forgotpwd.msgfilename.confm}")
	private String MsgfileNameConfirmation;
	
	@Autowired
	private AuthenticationUtil authenticationUtil;
	@Autowired
	private EmailNotificationService  emailService;
	
	@Autowired
	@Qualifier("userDetailsService")
	private SMTUserDetailsService userDetailsService;
	
	

	@Autowired
	private IPasswordMgntService passwordMgntService;
	
	@RequestMapping(value = "/forgotPwd")
	public String forgotPwd(HttpServletRequest request,Model model) {		
		model.addAttribute("forgotPasswordBean", new ForgotPasswordBean());
		request.setAttribute("validationErrs", false);
		request.setAttribute("error", false);
		return "pages/ForgotPassword";
	}
	

	@RequestMapping(value = "/sendOTP" , method = RequestMethod.POST)
	public ResponseEntity<String> sendOTP(HttpServletRequest request, @RequestParam("userName")String email) throws Exception {
		logger.debug("sendOTP Starts: "+email);
		// verify Account
		SMTUser user = null;
		try {
			user = (SMTUser) userDetailsService.loadUserByUsername(email);
			request.getSession().setAttribute(email, user);
		} catch (Exception ae) {
			logger.error("user not found : "+ email);
			user = null;
			throw new SMTException("user not found");
			//return new ResponseEntity<String>("{\"success\" : false}", getJsonHeaders(), HttpStatus.OK);
		}
		if (authenticationUtil.verifyAccountState(user)) {

			int otp = authenticationUtil.generateRandomNumber();

			logger.debug("*******otp********" + otp);
			Map<String, Object> emailData = new HashMap<String, Object>();
			emailData.put(FlowConstant.OTP, otp);
			//TODO uncomment the send mail call
			/*emailService.sendMail(email, mailSubOtp,
					msgFileNameOtp, emailData);*/
			
			passwordMgntService.saveOTP(user.getUserId(), otp, new Date());
			
			logger.debug("sendOTP Ends ");
			
			
		}
		return new ResponseEntity<String>("{\"success\" : true}", getJsonHeaders(), HttpStatus.OK);

	}

	@RequestMapping(value = "/resendOTP", method = RequestMethod.POST)
	public ResponseEntity<String> resendOTP(HttpServletRequest request, @RequestParam("userName")String email) throws Exception{
		
		logger.debug("inside resendOTP" + email);
		// verify Account		
		SMTUser user = null;
		boolean saveOTP = false;
		try {
			user = (SMTUser)request.getSession().getAttribute(email);
			if(user == null){
				user = (SMTUser) userDetailsService.loadUserByUsername(email);
			}
		} catch (Exception ae) {

			logger.error("user not found : "+ email);
			user = null;
			throw new SMTException("user not found");
		}
		if (authenticationUtil.verifyAccountState(user)) {

			int otp = passwordMgntService.getOTP(user.getUserId());
			if (otp == 0) {
				otp = authenticationUtil.generateRandomNumber();
				saveOTP = true;

			}
			logger.debug("*******otp********" + otp);
			Map<String, Object> emailData = new HashMap<String, Object>();
			emailData.put(FlowConstant.OTP, otp);

		/*	emailService.sendMail(email, forgotPwdMailSubject,
					forgotPwdMsgFileName, emailData);*/
			if (saveOTP) {
				passwordMgntService.saveOTP(user.getUserId(), otp, new Date());
			}
		}
		
		return new ResponseEntity<String>("{\"success\" : true}", getJsonHeaders(), HttpStatus.OK);
	}
		
	
	@RequestMapping("/handleForgotPwd")
	//public String handleForgotPwd(HttpServletRequest request, @RequestParam("usremail")String email, @RequestParam("otp")int otp,@RequestParam("Newpass")String password) {
	public String handleForgotPwd(HttpServletRequest request, @Valid ForgotPasswordBean forgotPasswordBean,
            BindingResult bindingResult, Model model){
		SMTUser user = null;	
		boolean error = false;
		
		if (bindingResult.hasErrors()) {
			request.setAttribute("validationErrs", true);
            logger.info("Returning ForgotPassword");
            return "pages/ForgotPassword";
        }
		String email = forgotPasswordBean.getUserName();
		try {
			
			user = (SMTUser)request.getSession().getAttribute(email);
			if(user == null){
				user = (SMTUser) userDetailsService.loadUserByUsername(email);
			}
		} catch (Exception ae) {
			logger.error("user not found : "+ email);
			user = null;
			
		}
		if(null != user){
			int otpFromDB = passwordMgntService.getOTP(user.getUserId());
			if (otpFromDB == 0 ) {
				logger.error("OTP expired");
				 error = true;
			}else if(otpFromDB != forgotPasswordBean.getOtp()){
				logger.error("OTP does not match");
				 error = true;
			}else{
				passwordMgntService.savePassword(user.getUserId(), forgotPasswordBean.getPassword());
				emailService.sendMail(email, mailSubConfirmation,
						MsgfileNameConfirmation, null);
			}
		}
		if(error){ 
			request.setAttribute("error", true);
			return "pages/ForgotPassword";
		}else
		 return "redirect:/";
		
	}

	@RequestMapping("/handleChangePwd")
	public String handleChangePwd() {
		return "pages/ChangePassword";
	}

	@RequestMapping(value = "/changePwd")
	public void changePwd() {

	}
	
	public HttpHeaders getJsonHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		return headers;
	}

}
