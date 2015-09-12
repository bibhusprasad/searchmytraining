package com.searchmytraining.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.dto.TrainingEnquiryDTO;
import com.searchmytraining.entity.GroupRequestEntity;
import com.searchmytraining.service.EmailNotificationService;
import com.searchmytraining.service.IGroupTrainingRequestService;
import com.searchmytraining.service.ITrainingEnquiryService;
import com.searchmytraining.service.IUserService;

@Controller
//@RequestMapping("/request")
public class RequestController {

	@Autowired
	public WebApplicationContext context;
	@Autowired
	public IGroupTrainingRequestService groupTrainingService;
	@Autowired
	public ITrainingEnquiryService trainingService;
	@Autowired
	public EmailNotificationService emailNotificationService;
	@Autowired
	public ITrainingEnquiryService trainingenquiryservice;
	@Autowired
	public IUserService userserice;
	
	
	@RequestMapping(value = "/requesttraining", method = RequestMethod.POST, produces="application/json")	
	public String requestTraining(@RequestParam("Name") String name,
			@RequestParam("CompanyName") String companyname,
			@RequestParam("title") String title,
			@RequestParam("Email") String email,
			@RequestParam("contact") String phone,
			@RequestParam("cityid") Long cityid,
			@RequestParam("requirements") String requirements,ModelMap model) {
		
	
	/*public String requestTraining(@RequestBody GroupRequestEntity grouprequest,ModelMap model) {*/
		System.out.println("Caught in requestTraining...");
		
		GroupRequestEntity grouprequest = new GroupRequestEntity();
		grouprequest.setContactname(name);
		grouprequest.setCompanyname(companyname);
		grouprequest.setCourse(title);
		grouprequest.setEmail(email);
		grouprequest.setPhone(phone);
		grouprequest.setTrainingneeds(requirements);
		//grouprequest.setCityid(3001L);
		grouprequest.setCityid(cityid);
		groupTrainingService.saveGroupRequest(grouprequest);
		model.addAttribute("requested_success_msg", "Thank you for your interest, we will get backto you very soon.");
		return "index";
		/*return "requesttraining";*/
	}

	@RequestMapping(value = "/trainingenquiry", method = RequestMethod.POST, produces={"application/json"}, consumes={"application/json"})
	public ResponseEntity<String> trainingEnquiry(@RequestBody TrainingEnquiryDTO trainingenquirydto, ModelMap model) {

		System.out.println("caught by trainingEnquiry :-)");
		System.out.println(trainingenquirydto);
		trainingenquiryservice.saveTrainingEnquiry(trainingenquirydto);
		return new ResponseEntity<String>("{\"success\" : true}", HttpStatus.OK);
	}
	
	@RequestMapping("email/send")
	public void sendMail()
	{
		System.out.println("Sending mail...");
		GroupRequestEntity grouprequestentity = (GroupRequestEntity)context.getBean("groupRequestEntity");
		grouprequestentity.setContactname("Chetan H Lohar");
		grouprequestentity.setEmail("chetanlohar@outlook.com");
		grouprequestentity.setPhone("+918446448344");
		grouprequestentity.setTrainingneeds("We need a very specific and real time oriented training for Spring Framework");
		emailNotificationService.sendGroupTrainingRequestNotification(grouprequestentity);
	}
	
	@RequestMapping("verify/sendemail")
	@ResponseBody
	public String sendVerificationLink(@RequestParam("data") String email)
	{
		emailNotificationService.sendVerificationLinkEmail(email);
		return "Email verification link has been send to give Email";
	}
	
	@RequestMapping("verify/email")
	public String verifyEmail(@RequestParam("username") String username,@RequestParam("c") String c, ModelMap model)
	{
		System.out.println(username);
		System.out.println(c);
		boolean isVerified = userserice.verifyEmail(username, c);
		boolean emailVerifiedStatus;
		if(!isVerified)
			emailVerifiedStatus=false;
		else
			emailVerifiedStatus=true;
		model.addAttribute("emailVerifiedStatus", emailVerifiedStatus);
		return "/pages/emailVerifiled";
	}
	
	@RequestMapping("login/auth")
	public String signIn(@RequestParam boolean emailVerifiedStatus)
	{
		System.out.println("emailVerifiedStatus: "+emailVerifiedStatus);
		return "/pages/LogIn";
	}
}
