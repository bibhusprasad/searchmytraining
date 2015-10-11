package com.searchmytraining.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.json.CDL;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.searchmytraining.dto.SearchCalendarDTO;
import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.entity.ChartEntity;
import com.searchmytraining.entity.CountryEntity;
import com.searchmytraining.entity.IndustryEntity;
import com.searchmytraining.service.IAdminChartService;
import com.searchmytraining.service.ICalenderService;
import com.searchmytraining.service.ICountryService;
import com.searchmytraining.service.IIndustrySerivice;

@Controller
public class AdminController 
{
	@Autowired
	private ICountryService countryservice;
	@Autowired
	private IIndustrySerivice industryservice;
	@Autowired
	private IAdminChartService chartservice;
	@Autowired
	private ICalenderService calservice;
	
	@RequestMapping("/adminLogin")
	public String adminlogin()
	{		
		return "pages/AdminLogin";		
	}
	@RequestMapping("/AdminPages")
	public String adminPage(ModelMap model)
	{		
		return "pages/admin/AdminPages";		
	}
	@RequestMapping("/accountSetting")
	public String acntSetting()
	{		
		return "pages/admin/AccountSetting";		
	}
	@RequestMapping("/manageCalender")
	public String magCalender(ModelMap model)
	{		
		List<CountryEntity> countrylist = countryservice.getAllCountries();
		List<IndustryEntity> industrylist = industryservice.getIndustries();
		model.addAttribute("countries",countrylist);
		model.addAttribute("industries",industrylist);
		return "pages/admin/ManageCalender";		
	}
	@RequestMapping("/manageAdd")
	public String manAdd()
	{
		return "pages/admin/ManageAdd";
	}
	@RequestMapping("/providerRanking")
	public String provRanking()
	{
		return "pages/admin/ProviderRanking";
	}
	
	@RequestMapping("view")
	public String view()
	{		
		return "pages/admin/view";		
	}
	@RequestMapping("/charts")
	public String manCharts(ModelMap model)
	{
		List<ChartEntity> chartstpf = chartservice.tpfRegistered();
		List<ChartEntity> chartstpi = chartservice.tpiRegistered();
		
		JSONArray jsontpf = new JSONArray(chartstpf);
		File file = new File("D:/mycsv.csv");
		String csv = CDL.toString(jsontpf);
		try {
			FileUtils.writeStringToFile(file, csv, "UTF-8");
		} catch (IOException e) {
			System.out.println("IOExcetoin raised...");
			e.printStackTrace();
		};
		
		model.addAttribute("chartstpf", new JSONArray(chartstpf));
		model.addAttribute("chartstpi", new JSONArray(chartstpi));
		
		return "pages/admin/Charts";
	}
	
	@RequestMapping(value = "/searchCalendar", method = RequestMethod.POST, produces = { "application/json" }, consumes = { "application/json" })
	@ResponseBody
	public List<CalenderEntity> searchCalendar(@RequestBody SearchCalendarDTO searchcalendardto,ModelMap model)
	{
		System.out.println(searchcalendardto);
		return calservice.getCalendersOnSearch(searchcalendardto);
	}
	@RequestMapping("/uploadAdvertise")
	public void uploadAdvertise(@RequestParam CommonsMultipartFile fileUpload)
	{
		String fileName = fileUpload.getOriginalFilename();
		System.out.println("Adv File name: "+fileName);
	}
	
	@RequestMapping(value="/showReports")
	public String showReports()
	{
		System.out.println("hi..");
		return "pages/admin/ShowReport";
	}
	
	@RequestMapping(value="/tpreports")
	public String showTPReports(ModelMap model)
	{
		//List<CalenderEntity> callist = calservice.getAllCalender();
		//model.addAttribute("callist",callist);
		return "pages/admin/tpreport";
	}
}
