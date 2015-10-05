package com.searchmytraining.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.searchmytraining.dto.CertificationAwardDTO;
import com.searchmytraining.dto.EducationDTO;
import com.searchmytraining.dto.FreelancerDTO;
import com.searchmytraining.entity.ActorDetails;
import com.searchmytraining.entity.CertificationAwardEntity;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.ContactInfoEntity;
import com.searchmytraining.entity.EducationEntity;
import com.searchmytraining.entity.FreeLancerProfileEntity;
import com.searchmytraining.entity.LocationEntity;
import com.searchmytraining.entity.PhoneEntity;
import com.searchmytraining.entity.StateEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.ICityService;
import com.searchmytraining.service.IContactInfoService;
import com.searchmytraining.service.ICountryService;
import com.searchmytraining.service.IFreelancerService;
import com.searchmytraining.service.ILocationService;
import com.searchmytraining.service.IStateService;
import com.searchmytraining.service.IUserService;
import com.searchmytraining.wrapper.RespnoseWrapper;

@Controller
@RequestMapping(value="/freelancer")
public class FreeLancerController {
	
	@Autowired
	public WebApplicationContext context;
	@Autowired
	public IFreelancerService freelancerservice;
	@Autowired
	public IUserService userservice;
	@Autowired
	public ILocationService locservice;
	@Autowired
	public IStateService stateservice;
	@Autowired
	public ICityService cityservice;
	@Autowired
	public ICountryService countryservice;
	@Autowired
	public IContactInfoService contactservice;
	
	@RequestMapping(value = "/flregister", method = RequestMethod.POST, produces = { "application/json" }, consumes = { "application/json" })
	@ResponseBody
	public FreelancerDTO flRegistration(@RequestBody FreelancerDTO freelancerDto,HttpSession session) throws Exception {
		Integer userid = freelancerservice.registerFreelancer(freelancerDto);
		UserEntity user = userservice.getUser(userid);
		session.setAttribute("user", user);
		return freelancerDto;
	}
	
	@RequestMapping(value="/mapFLUpdateProfile", method=RequestMethod.POST)
	public String flUpdateProfile(@RequestParam String username,ModelMap model,HttpSession session) {
		System.out.println("FL username: "+username);
		UserEntity user = userservice.getUser(username);
		System.out.println(user.getUserId());
		session.setAttribute("user", user);
		FreeLancerProfileEntity flProfEntity = freelancerservice.getFLProfileDet(user.getUserId().longValue());
		ActorDetails actordetails = (ActorDetails)context.getBean("actorDetails");
		if(flProfEntity!=null)
		{
			actordetails.setName(flProfEntity.getFullname());
			actordetails.setUser(flProfEntity.getUser());
			actordetails.setPicture(flProfEntity.getPhotograph());
			session.setAttribute("actordetails", actordetails);
			session.setAttribute("flProfEntity",flProfEntity);
		}
			
		return "pages/FreeLancer/FreeLancerProfile";
	}
	
	@RequestMapping("/FLUpdateProfile")
	public String freeLancerProfile(ModelMap model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		model.addAttribute("userid", user.getUserId());
		System.out.println("from /Flprofile userid: "+user.getUserId());
		
		// Location Information
		LocationEntity location = locservice.findLocDet(user.getUserId());
		if(location!=null)
		{
			List<StateEntity> states = stateservice.getStates(location.getCity().getState().getCountry().getCountryId());
			List<CityEntity> cities = cityservice.getCities(location.getCity().getState().getStateId());
			Integer country_value = location.getCity().getState().getCountry().getCountryId();
			model.addAttribute("country_value",country_value);
			model.addAttribute("location", location);
			model.addAttribute("states",new JSONArray(states));
			model.addAttribute("cities",new JSONArray(cities));
		}
		
		// Certification or Award Information
		CertificationAwardEntity certification = freelancerservice.getCertificationDetByUserId(user.getUserId().longValue());
		if(certification!=null)
			model.addAttribute("certification",certification);
		
		// Profile Information with Photograph
		
		FreeLancerProfileEntity flProfEntity = freelancerservice.getFLProfileDet(user.getUserId().longValue());
		if(flProfEntity!=null)
			model.addAttribute("flProfEntity",flProfEntity);
		
		// Phone Information
		
		List<PhoneEntity> phones = freelancerservice.getFLPhoneDetails(user.getUserId().longValue());
		if(phones!=null)
			model.addAttribute("phones", phones);
		
		// Website Information
		
		ContactInfoEntity contactwebdetails = contactservice.getContactInfoDetailsByUserId(user.getUserId().longValue());
		if(contactwebdetails!=null)
			model.addAttribute("contactwebdetails", contactwebdetails);
		
		EducationEntity education = freelancerservice.getEducationDetails(user.getUserId().longValue());
		if(education!=null)
			model.addAttribute("education", education);
		// AllEducationDegrees
		model.addAttribute("Educations",freelancerservice.getAllEduDetails());
		
		// Country Details
		model.addAttribute("countries",countryservice.getAllCountries());
		
		return "pages/FreeLancer/FLprofile";
	}
	
	@RequestMapping(value="/freelcertiawardDet",method=RequestMethod.POST)
	@ResponseBody
	public RespnoseWrapper updateCertifactionAwrdDet(@RequestBody CertificationAwardDTO certidto, ModelMap model)
	{
		System.out.println(certidto.getAwrdDetails());
		freelancerservice.updateCertiAndAwardInfo(certidto);
		return null;
	}
	
	@RequestMapping(value="/updateflprofdet")
	public String updateFlProfileDetails(@RequestParam CommonsMultipartFile picture, @RequestParam("fname61") String fullname, @RequestParam("email64") String email,HttpSession session, RedirectAttributes ra)
	{
		UserEntity user = (UserEntity)session.getAttribute("user");
		FreeLancerProfileEntity profentity = freelancerservice.getFLProfileDet(user.getUserId().longValue());
		profentity.setFullname(fullname);
		profentity.setEmail(email);
		if(picture!=null)
		{
			profentity.setPhotograph(picture.getBytes());
		}
		profentity.setUser(user);
		freelancerservice.updateFlProfDet(profentity);
		if(profentity!=null)
		{
			session.removeAttribute("flProfEntity");
			session.setAttribute("flProfEntity",profentity);
		}
		return "pages/FreeLancer/FreeLancerProfile";
	}
	
	/*@RequestMapping("/downloadFLPhotograph/{userId}")
	public String downloadFLPhotograph(@PathVariable("userId") Integer userId, HttpServletResponse response)
	{
		FreeLancerProfileEntity flprofentity = freelancerservice.getFLProfileDet(userId.longValue());
		System.out.println(flprofentity.getEmail());
		try
		{
			if(flprofentity.getPhotograph()!=null)
			{
				response.setHeader("Content-Disposition", "inline;filename=\""+flprofentity.getFullname()+"\"");
				OutputStream out = response.getOutputStream();
				response.setContentType("image/gif");
				ByteArrayInputStream bis = new ByteArrayInputStream(flprofentity.getPhotograph());
				IOUtils.copy(bis, out);
				out.flush();
				out.close();
			}
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		return null;
	}*/
	
	@RequestMapping(value="/updateedudetails/{chetan}",  method = RequestMethod.POST, produces={"application/json"}, consumes ={"application/json"})
	@ResponseBody
	public RespnoseWrapper updateEduDetails(@PathVariable("chetan") Integer userId,@RequestBody EducationDTO edudto,ModelMap model)
	{
		System.out.println("userId: "+userId);
		System.out.println(edudto);
		freelancerservice.updateEduDetails(edudto, userId);
		return null;
	}
	
	
	
	
}
