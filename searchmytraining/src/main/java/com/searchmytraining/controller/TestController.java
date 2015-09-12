package com.searchmytraining.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.searchmytraining.dto.StudentDTO;
import com.searchmytraining.service.IGroupTrainingRequestService;

@Controller
public class TestController {
	
	static Logger logger = Logger.getLogger(TestController.class.getName());

	@Autowired
	private IGroupTrainingRequestService testService;

	@RequestMapping(value = "/studentcount", method = RequestMethod.GET)
	public ResponseEntity<String> getStudentCount() {
		System.out.println("Hello Swagatika");		
		int count = testService.retrieveStudentCount();
		logger.info("student count : "+ count);
		return new ResponseEntity<String>("Number of students in Student Table is  : "+count, HttpStatus.OK);

	}
	
	
	@RequestMapping(value = "/savestudent", method = RequestMethod.GET)
	public ResponseEntity<String> saveStudent() {
		StudentDTO studentDto = new StudentDTO();
		studentDto.setAge(12);
		studentDto.setName("abc1");
		testService.saveStudent(studentDto);
		return new ResponseEntity<String>("savedstudent : "+studentDto.getName(),HttpStatus.OK);

	}
	
	@RequestMapping("/tt1")
	public String doAction()
	{
		return "pages/Trainee/TrainSetting";
	}
}
