package com.searchmytraining.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TraineeController {
	
	@RequestMapping("/TrainSetting")
	public String doActionTrSetting()
	{
		return "pages/Trainee/TrainSetting";
	}

}
