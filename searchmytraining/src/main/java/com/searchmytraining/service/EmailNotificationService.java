package com.searchmytraining.service;

import java.util.Map;

import com.searchmytraining.entity.GroupRequestEntity;

public interface EmailNotificationService {
	
	/**
	 * Send Notification of Group Training Request
	 * @param grouprequestentity
	 */
	public void sendGroupTrainingRequestNotification(GroupRequestEntity grouprequestentity);
	public void sendVerificationLinkEmail(String email);
	public void sendMail(String email, String mailSubject,String msgTextFileName, Map<String, Object> emailData) ;

}
