package com.searchmytraining.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.searchmytraining.controller.PasswordController;
import com.searchmytraining.entity.GroupRequestEntity;
import com.searchmytraining.service.EmailNotificationService;
import com.searchmytraining.service.IUserService;

@Service
public class EmailNotificationServiceImpl implements EmailNotificationService {
	private static Logger logger = Logger.getLogger(EmailNotificationServiceImpl.class.getName());
	
	@Autowired
	private VelocityEngine velocityEngine;

	@Autowired
	@Qualifier("mailSender")
	private JavaMailSender mailSender;
	@Autowired
	public IUserService userservice;

	//SWAGATIKA : DOTO Remove not required
	@Override
	public void sendGroupTrainingRequestNotification(final GroupRequestEntity grouprequestentity) {
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
				message.setTo(grouprequestentity.getEmail());
				/*message.setBcc("job.chetanlohar@gmail.com");*/
				message.setFrom("job.chetanlohar@gmail.com");
				message.setSubject("New Request for Group Training");
				message.setSentDate(new Date());
				Map<String,Object> model = new HashMap<String, Object>();
				model.put("newMessage", grouprequestentity);
				String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "velocity/smt_grouptraining_message.vm", "UTF-8",model);
				message.setText(text,true);
			}
		};
		mailSender.send(preparator);
	}
	
	@Override
	public void sendVerificationLinkEmail(final String email) {

		final String uuid = UUID.randomUUID().toString();
		System.out.println(email);
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
				message.setTo(email);
				message.setFrom("job.chetanlohar@gmail.com");
				message.setSubject("Email Verification Link");
				message.setSentDate(new Date());
				Map<String,Object> model = new HashMap<String, Object>();
				model.put("uuid", uuid);
				model.put("toemail", email);
				String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "velocity/smt_grouptraining_emailverify.vm", "UTF-8",model);
				message.setText(text,true);
			}
		};
		mailSender.send(preparator);
		userservice.updateUserUUID(email, uuid);
	}
	
	@Override
	public void sendMail(String email, String mailSubject,
			String msgTextFileName, Map<String, Object> emailData) {
		String mailBody = VelocityEngineUtils.mergeTemplateIntoString(
				velocityEngine, getResourcePath(msgTextFileName), "UTF-8",
				emailData);

		logger.debug("*****mailBody*****" + mailBody);

		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setTo(email);
		msg.setSubject(mailSubject);
		msg.setText(mailBody);
		mailSender.send(msg);

	}

	private static String getResourcePath(String name) {
		return "mailTemplates/" + Locale.getDefault().getLanguage() + "/"
				+ name;
	}
}
