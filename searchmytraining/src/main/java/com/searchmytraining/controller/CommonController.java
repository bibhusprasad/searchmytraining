package com.searchmytraining.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.entity.ActorDetails;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.FreeLancerProfileEntity;
import com.searchmytraining.entity.IndustryCategoryEntity;
import com.searchmytraining.entity.IndustrySubCategoryEntity;
import com.searchmytraining.entity.InstituteEntity;
import com.searchmytraining.entity.RoleEntity;
import com.searchmytraining.entity.StateEntity;
import com.searchmytraining.service.ICityService;
import com.searchmytraining.service.ICommonService;
import com.searchmytraining.service.IFreelancerService;
import com.searchmytraining.service.IIndustryCategoryService;
import com.searchmytraining.service.IIndustrySubCategoryService;
import com.searchmytraining.service.IInstituteServiceDetails;
import com.searchmytraining.service.IStateService;

@Controller
@RequestMapping(value="/common")
public class CommonController {
	
	@Autowired
	public WebApplicationContext context;
	@Autowired
	public IIndustryCategoryService industrycatservice;
	@Autowired
	public IIndustrySubCategoryService industrysubcatservice;
	@Autowired
	public IStateService state;
	@Autowired
	public ICityService city;
	@Autowired
	public ICommonService commonservice;
	@Autowired
	public IInstituteServiceDetails instituteservice;
	@Autowired
	public IFreelancerService freelancerservice;
	
	@RequestMapping("/getIndustryCategory")
	@ResponseBody
	public List<IndustryCategoryEntity> getIndustryCategory(@RequestParam("id") Integer industryid, ModelMap model)
	{
		List<IndustryCategoryEntity> l = industrycatservice.getIndustryCategories(industryid);
		model.addAttribute("industrycategories", l);
		return l;
	}
	
	@RequestMapping("/getIndustrySubCategory")
	@ResponseBody
	public List<IndustrySubCategoryEntity> getIndustrySubCategory(@RequestParam("subid") Integer industrysubid, ModelMap model)
	{
		System.out.println("caughed by getIndustrySubCategory method... subid:"+industrysubid);
		return industrysubcatservice.getIndustrySubCategories(industrysubid);
	}
	
	@RequestMapping("/getstates")
	@ResponseBody
	public List<StateEntity> getStates(@RequestParam("countryid") Integer countryid)
	{
		System.out.println("in getStates(...)");
		return state.getStates(countryid.longValue());
	}
	
	@RequestMapping("/getCities")
	@ResponseBody
	public List<CityEntity> getCitites(@RequestParam("stateid") Integer stateid)
	{
		return city.getCities(stateid.longValue());
	}
	
	@RequestMapping("/downloadPicture/{userId}")
	public String downloadPicture(@PathVariable("userId") Integer userId, HttpServletResponse response)
	{
		RoleEntity role = commonservice.getRoleByUserId(userId.longValue());
		ActorDetails actordetails = (ActorDetails)context.getBean("actorDetails");
		if(role.getROLE().equalsIgnoreCase("TPF"))
		{
			FreeLancerProfileEntity flprofentity = freelancerservice.getFLProfileDet(userId.longValue());
			actordetails.setUser(flprofentity.getUser());
			actordetails.setName(flprofentity.getFullname());
			actordetails.setPicture(flprofentity.getPhotograph());
		}
		else if(role.getROLE().equalsIgnoreCase("TPI"))
		{
			InstituteEntity institute = instituteservice.getInstituteInfo(userId.longValue());
			if(institute.getInstitutelogo()!=null)
			{
				actordetails.setUser(institute.getUser());
				actordetails.setName(institute.getCompanyName());
				actordetails.setPicture(institute.getInstitutelogo());
			}
		}
		try
		{
			response.setHeader("Content-Disposition", "inline;filename=\""+actordetails.getName()+"\"");
			OutputStream out = response.getOutputStream();
			response.setContentType("image/gif");
			ByteArrayInputStream bis = new ByteArrayInputStream(actordetails.getPicture());
			IOUtils.copy(bis, out);
			out.flush();
			out.close();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		return null;
	}

}
