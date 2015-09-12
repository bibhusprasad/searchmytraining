package com.searchmytraining.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.searchmytraining.dao.IPhoneDAO;
import com.searchmytraining.dao.IPhoneTypeDAO;
import com.searchmytraining.dto.TrainerDTO;
import com.searchmytraining.dto.TrainingCategoryDTO;
import com.searchmytraining.entity.ActorDetails;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.ClientEntity;
import com.searchmytraining.entity.ContactInfoEntity;
import com.searchmytraining.entity.InstituteEntity;
import com.searchmytraining.entity.LocationEntity;
import com.searchmytraining.entity.PhoneEntity;
import com.searchmytraining.entity.ProfessionalAssociationEntity;
import com.searchmytraining.entity.StateEntity;
import com.searchmytraining.entity.TrainerEntity;
import com.searchmytraining.entity.TrainingCategoryEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.ICityService;
import com.searchmytraining.service.IContactInfoService;
import com.searchmytraining.service.ICountryService;
import com.searchmytraining.service.IIndustrySubCategoryService;
import com.searchmytraining.service.IInstituteServiceDetails;
import com.searchmytraining.service.ILocationService;
import com.searchmytraining.service.IStateService;
import com.searchmytraining.service.ITrainingProviderService;
import com.searchmytraining.service.IUserService;
import com.searchmytraining.wrapper.RespnoseWrapper;

@Controller
public class TrainingProviderController 
{
	@Autowired
	public WebApplicationContext context;
	@Autowired
	public ITrainingProviderService trainerservice;
	@Autowired
	public IUserService userservice;
	@Autowired
	public IInstituteServiceDetails instituteservice;
	@Autowired
	public IContactInfoService contactinfoservice;
	@Autowired
	public ILocationService locservice;
	@Autowired
	public IStateService stateservice;
	@Autowired
	public ICityService cityservice;
	@Autowired
	public ICountryService countryservice;
	@Autowired
	public IPhoneDAO phonedao;
	@Autowired
	public IPhoneTypeDAO phonetypedao;
	@Autowired
	public IIndustrySubCategoryService subcatservice;
	
	@RequestMapping(value = "/trainingprovider_reg", method = RequestMethod.POST, produces = { "application/json" }, consumes = { "application/json" })
	@ResponseBody
	public RespnoseWrapper TrainingProviderRegistration(
			@RequestBody @Valid TrainerDTO trainerdto, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		RespnoseWrapper response1 = (RespnoseWrapper)context.getBean("respnoseWrapper");
		response1.setValidation_error(true);
		response1.setId(501);
		if (result.hasErrors()) {
			response1.setId(101);
			response1.setValidation_error(true);

			List<FieldError> errors = result.getFieldErrors();
			Map<String, String> errorMsg = new HashMap<String, String>();
			for (FieldError error : errors) {
				System.out.println(error.getField() + " :-: "
						+ error.getDefaultMessage());
				errorMsg.put(error.getField(), error.getDefaultMessage());
			}
			response1.setErrorMsg(errorMsg);
		} else {
			response1.setValidation_error(false);
			Integer userid = trainerservice.registerTrainer(trainerdto);
			session.setAttribute("userid",userid);
		}
		return response1;
	}

	@RequestMapping(value="/trainingprovider_updateprofile",method=RequestMethod.POST)
	public String TrainingProviderProfileMapping(@RequestParam("username") String username,ModelMap model, HttpSession session) {
		UserEntity user = userservice.getUser(username);
		session.setAttribute("userid", user.getUserId());
		System.out.println("userid: "+user.getUserId());
		TrainerEntity trainer = trainerservice.getTrainerByUserid(user.getUserId().longValue());
		if(trainer!=null)
		{
			session.setAttribute("trainer", trainer);
		}
		InstituteEntity instituteinfo = instituteservice.getInstituteInfo(trainer.getUser().getUserId().longValue());
		ActorDetails actordetails = (ActorDetails)context.getBean("actorDetails");
		if(instituteinfo!=null)
		{
			actordetails.setName(instituteinfo.getCompanyName());
			actordetails.setUser(instituteinfo.getUser());
			actordetails.setPicture(instituteinfo.getInstitutelogo());
			session.setAttribute("actordetails", actordetails);
		}
		return "pages/TrainingProvider/TrainingProviderProfile";
	}

	@RequestMapping("/trainerprofile")
	public String trainerProfile(ModelMap model,HttpSession session) {
		
		TrainerEntity trainer = (TrainerEntity)session.getAttribute("trainer");
		if(trainer!=null)
		{
			// Institute Information
			
			InstituteEntity instituteinfo = instituteservice.getInstituteInfo(trainer.getUser().getUserId().longValue());
			if(instituteinfo!=null)
				model.addAttribute("instituteinfo", instituteinfo);
			
			// Contact Inforamtion
			
			ContactInfoEntity contactinfo = contactinfoservice.getContactInfoDetailsByUserId(trainer.getUser().getUserId().longValue());
			if(contactinfo!=null)
				model.addAttribute("contactinfo", contactinfo);
			
			// Phone Information
			List<PhoneEntity> phones = phonedao.getPhoneByUserId(trainer.getUser().getUserId().longValue());
			if(phones.size()>0)
				model.addAttribute("phones", phones);
			// Location Information
			
			LocationEntity location = locservice.findLocDet(trainer.getUser().getUserId());
			if(location!=null)
			{
				List<StateEntity> states = stateservice.getStates(location.getCity().getState().getCountry().getCountryId());
				List<CityEntity> cities = cityservice.getCities(location.getCity().getState().getStateId());
				Long country_value = location.getCity().getState().getCountry().getCountryId();
				model.addAttribute("country_value",country_value);
				model.addAttribute("location", location);
				model.addAttribute("states",new JSONArray(states));
				model.addAttribute("cities",new JSONArray(cities));
			}
			
			// Professional Association
			
			List<ProfessionalAssociationEntity> profassoc = instituteservice.getProfAssocByUserId(trainer.getUser().getUserId().longValue());
			if(profassoc!=null)
				model.addAttribute("profassoc", profassoc);
			else
			{
				ProfessionalAssociationEntity profentity = new ProfessionalAssociationEntity();
				profassoc = new ArrayList<ProfessionalAssociationEntity>();
				profassoc.add(profentity);
				model.addAttribute("profassoc", profassoc);
			}
				
			// Key Client Details
			
			List<ClientEntity> clientlist = instituteservice.getClientDetailsByUserId(trainer.getUser().getUserId().longValue());
			if(clientlist!=null)
				model.addAttribute("clientlist", clientlist);
			else
			{
				ClientEntity client = new ClientEntity();
				clientlist = new ArrayList<ClientEntity>();
				clientlist.add(client);
				model.addAttribute("clientlist", clientlist);
			}
			
			model.addAttribute("phonetypes", phonetypedao.getAllPhoneTypes());
			model.addAttribute("countries",countryservice.getAllCountries());
		}
		else
		{
			System.out.println("Please Login again...");
			return "pages/Sign-In";
		}
			
		return "pages/TrainingProvider/TPprofile";
	}
	
	@RequestMapping("/uploadInstituteLogo")
	public String uploadInstituteLogo(@RequestParam CommonsMultipartFile picture,@RequestParam("userid") Integer userId,HttpSession session)
	{
		InstituteEntity institute = instituteservice.getInstituteInfo(userId.longValue());
		if(institute!=null)
		{
			institute.setInstitutelogo(picture.getBytes());
			instituteservice.uploadInstituteLogo(institute);
		}
		InstituteEntity instituteinfo = instituteservice.getInstituteInfo(userId.longValue());
		ActorDetails actordetails = (ActorDetails)context.getBean("actorDetails");
		if(instituteinfo!=null)
		{
			actordetails.setName(instituteinfo.getCompanyName());
			actordetails.setUser(instituteinfo.getUser());
			actordetails.setPicture(instituteinfo.getInstitutelogo());
			session.setAttribute("actordetails", actordetails);
		}
		return "pages/TrainingProvider/TrainingProviderProfile";
	}
	
	@RequestMapping("/downloadInstituteLogo/{userId}")
	public String downloadInstituteLogo(@PathVariable("userId") Integer userId, HttpServletResponse response)
	{
		InstituteEntity institute = instituteservice.getInstituteInfo(userId.longValue());
		try
		{
			if(institute.getInstitutelogo()!=null)
			{
				response.setHeader("Content-Disposition", "inline;filename=\""+institute.getCompanyName()+"\"");
				OutputStream out = response.getOutputStream();
				response.setContentType("image/gif");
				ByteArrayInputStream bis = new ByteArrayInputStream(institute.getInstitutelogo());
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
	}
	
	@RequestMapping("/tp/tc")
	public String getTrainingCategories(ModelMap model)
	{
		model.addAttribute("trainings", subcatservice.getAllIndustrySubCategories());
		model.addAttribute("userId", 86);
		model.addAttribute("selectedTraningCats", instituteservice.getAllTrainingCategories(86L));
		return "pages/TrainingProvider/TrainingCategories";
	}
	
	@RequestMapping(value="/tp/addTC/{userId}")
	public @ResponseBody TrainingCategoryEntity addTrainingCategories(@RequestBody TrainingCategoryDTO trainingcategorydto,@PathVariable("userId") Integer userId,ModelMap model,HttpServletResponse response)
	{
		response.setContentType("application/json");
		System.out.println("userId: "+userId);
		System.out.println(trainingcategorydto);
		TrainingCategoryEntity trngcatentity = instituteservice.addTrainingCategoryEntity(trainingcategorydto,userId.longValue());
		System.out.println(trngcatentity);
		return trngcatentity;
	}
	
	@RequestMapping("/int")
	public String getTpInsights()
	{
		return "pages/TrainingProvider/Insights";
	}
	
	@RequestMapping("/str")
	public String getTpSettings()
	{
		return "pages/TrainingProvider/TPsetting";
	}
}
