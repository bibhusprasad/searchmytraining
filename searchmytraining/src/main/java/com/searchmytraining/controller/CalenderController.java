package com.searchmytraining.controller;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.service.ICalenderService;

@Controller
public class CalenderController {
	@Autowired
	ICalenderService iCalnder;
	Integer userId;
	HttpSession session;

	Calendar calendar = Calendar.getInstance();
	Timestamp currentTime = new Timestamp(calendar.getTime().getTime());

	@RequestMapping("/getRecentelyAdded")
	public String getRecentelyAdded(ModelMap model,HttpSession session) {
		List<CalenderEntity> recentelyAdded = null;
		userId = Integer.parseInt(session.getAttribute("userid").toString());
		recentelyAdded = iCalnder.getRecentelyAdded(userId, currentTime);
		for (CalenderEntity entity : recentelyAdded) {
			System.out.println("Brouchre " + entity.getBrochure() + ": Title "
					+ entity.getCourseTitle() + ": Training Type " + entity.getCalenderType()
					+ ": TCreated ON" + entity.getCreatedOn());
		}
		model.addAttribute("recentelyAdded",recentelyAdded);
		return "pages/FreeLancer/Resentcalender";
	}

	@RequestMapping("/getAllCalender")
	public void getAllCalender(HttpSession session) {
		List<CalenderEntity> list = null;
		//list = iCalnder.getAllCalender();
		for (CalenderEntity entity : list) {
			System.out.println("Brouchre " + entity.getBrochure() + ": Title "
					+ entity.getCourseTitle() + ": Training Type " + entity.getCalenderType()
					+ ": TCreated ON" + entity.getCreatedOn());
		}
	}

	@RequestMapping("/getUserCalender")
	public String getUserCalender(ModelMap model,HttpSession session) {

		List<CalenderEntity> userAllCalender = null;
		userId = Integer.parseInt(session.getAttribute("userid").toString());
		System.out.println("userId==== "+userId);
		userAllCalender = iCalnder.getUserCalender(userId);
		for (CalenderEntity entity : userAllCalender) {
			System.out.println("Brouchre " + entity.getBrochure() + ": Title "
					+ entity.getCourseTitle() + ": Training Type " + entity.getCalenderType()
					+ ": TCreated ON" + entity.getCreatedOn());
		}
		model.addAttribute("userAllCalender",userAllCalender);
		return "pages/FreeLancer/AllCalender";

	}

	@RequestMapping("/updateCalender")
	public void updateCalender(CalenderEntity entity) {
		iCalnder.updateCalender(entity);
	}

	@RequestMapping(value="/getContacted",method=RequestMethod.GET)
	public void getContacted(@RequestParam("trngId") Integer trngId)
	{
		System.out.println("geContacted id: "+trngId);
	}
	
	@RequestMapping(value="/getContacted",method=RequestMethod.POST)
	public void getContacted1(@RequestParam("trngId") Integer trngId,ModelMap model)
	{
		
		System.out.println("geContacted1 id: "+trngId);
	}

}
