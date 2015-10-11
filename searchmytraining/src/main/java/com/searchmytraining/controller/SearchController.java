package com.searchmytraining.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.enquiry.training.SuggestTraining;
import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.entity.InstituteSearchEntity;
import com.searchmytraining.service.ICalenderService;
import com.searchmytraining.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	private WebApplicationContext context;
	
	@Autowired
	private ICalenderService calendarservice;
	
	@Autowired
	private SearchService searchservice;
	
	
	@RequestMapping(value="/dosearch",method = RequestMethod.GET)
	@ResponseBody
	public List<String> doSearch(@RequestParam("tagName") String tagName)
	{
		SuggestTraining suggesttraining = (SuggestTraining)context.getBean("suggestTraining");
		List<String> result = suggesttraining.doAutoSuggest(tagName);
		/*Iterator<String> itr = result.iterator();
		while(itr.hasNext())
			System.out.println(itr.next());*/
		return result;
	}
	
	@RequestMapping(value = "/getCalendars")/*, produces = { "application/json" }, consumes = { "application/json" })*/
	public String getCalendars(@RequestParam("inputkeyword") String inputkeyword,ModelMap model, HttpServletRequest request) throws Exception
	{
		System.out.println("original keyword: "+inputkeyword);
		inputkeyword = inputkeyword.toLowerCase();
		InputStream in = request.getSession().getServletContext().getResourceAsStream("/whitelist.txt");
		InputStreamReader inr = new InputStreamReader(in);
		BufferedReader bfr = new BufferedReader(inr);
		String str_whitelist = bfr.readLine();
		
		String [] whitelist = str_whitelist.split(",");
		
		for(String str:whitelist)
		{
			if(inputkeyword.contains(" "+str+" "))
				inputkeyword = inputkeyword.replace(" "+str, "").trim();
			if(inputkeyword.endsWith(str))
				inputkeyword = inputkeyword.replace(str, "").trim();
			if(inputkeyword.startsWith(str+" "))
				inputkeyword = inputkeyword.replace(str, "").trim();
		}

		String keywords = inputkeyword.replace(" ", ",");
		if(keywords.endsWith(","))
			System.out.println(keywords.substring(0,keywords.length()-1));
		System.out.println("final keyword: "+keywords);
		List<CalenderEntity> calendars =calendarservice.getCalendersByKeyword(keywords); 
		model.addAttribute("calendars", calendars);
		return "pages/CodePages/calenderdiv";
	}
	
	@RequestMapping("/institutediv")
	public String doAction3(@RequestParam("inputkeyword") String inputkeyword,@RequestParam("city") String city,ModelMap model) {
		System.out.println("from /institutediv city:"+city);
		List<InstituteSearchEntity> institutesearch = searchservice.getAllInstitutes();
		model.addAttribute("institutesearch", institutesearch);
		model.addAttribute("test", inputkeyword);
		return "pages/CodePages/institutediv";
	}
}
