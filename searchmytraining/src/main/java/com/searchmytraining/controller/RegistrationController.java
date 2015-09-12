package com.searchmytraining.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.dto.TraineeDTO;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.EmploymentEntity;
import com.searchmytraining.entity.IndustryCategoryEntity;
import com.searchmytraining.entity.IndustrySubCategoryEntity;
import com.searchmytraining.entity.LocationEntity;
import com.searchmytraining.entity.StateEntity;
import com.searchmytraining.entity.TraineeEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.ICityService;
import com.searchmytraining.service.ICountryService;
import com.searchmytraining.service.IEmploymentService;
import com.searchmytraining.service.IIndustryCategoryService;
import com.searchmytraining.service.IIndustrySerivice;
import com.searchmytraining.service.IIndustrySubCategoryService;
import com.searchmytraining.service.ILocationService;
import com.searchmytraining.service.IStateService;
import com.searchmytraining.service.ITraineeService;
import com.searchmytraining.service.IUserService;
import com.searchmytraining.wrapper.RespnoseWrapper;

@Controller
@SessionAttributes("userid")
public class RegistrationController {

	@Autowired
	public WebApplicationContext context;
	@Autowired
	public ITraineeService traineeservice;
	@Autowired
	public IUserService userservice;
	@Autowired
	public IIndustrySerivice industryservice;
	@Autowired
	public IIndustryCategoryService industrycategoryser;
	@Autowired
	public IIndustrySubCategoryService indsubcatindservice;
	@Autowired
	public IEmploymentService employmentservice;
	@Autowired
	public ILocationService locservice;
	@Autowired
	public IStateService stateservice;
	@Autowired
	public ICityService cityservice;
	@Autowired
	public ICountryService countryservice;

	// Trainee Registration

	@RequestMapping("/trainee_reg")
	@ResponseBody
	public RespnoseWrapper traineeRegistration(
			@RequestBody @Valid TraineeDTO traineedto, BindingResult result,
			ModelMap model, HttpSession session) {
		RespnoseWrapper response1 = new RespnoseWrapper();
		if (result.hasErrors()) {
			response1.setId(101);
			response1.setValidation_error(true);
			List<FieldError> errors = result.getFieldErrors();
			Map<String, String> errorMsg = new HashMap<String, String>();
			for (FieldError error : errors)
			{
				errorMsg.put(error.getField(), error.getDefaultMessage());
				System.out.println(error.getField() + " :-: "+ error.getDefaultMessage());
			}
			response1.setErrorMsg(errorMsg);
			return response1;
		} else {
			response1.setValidation_error(false);
			ITraineeService traineeser = (ITraineeService)context.getBean("traineeService");
			System.out.println("traineeser ref: "+traineeser);
			Integer userid = traineeservice.registerTrainee(traineedto);
			System.out.println("trainee userid: "+userid);
			session.setAttribute("userid", userid);
			return response1;
		}
	}

	@RequestMapping(value="/trainee_updateprofile",method=RequestMethod.POST)
	public String traineeProfileMapping(@RequestParam("username") String username, ModelMap model, HttpSession session) {
		
		UserEntity user=userservice.getUser(username);
		TraineeEntity trainee = traineeservice.getTrainee(user.getUserId());
		System.out.println("traineeid : "+trainee.getTraineeId());
		session.setAttribute("trainee", trainee);
		return "pages/Trainee/TraineeProfile";
	}

	@RequestMapping("/trainprofile")
	public String updateTraineeProfile(ModelMap model, HttpSession session) {
		
		TraineeEntity trainee = (TraineeEntity) session.getAttribute("trainee");
		Integer indcatid=0;
		try
		{
			//Employement Details
			
			System.out.println("userid is: "+trainee.getUser().getUserId());
			EmploymentEntity emplentity = employmentservice.findEmplDet(trainee.getUser().getUserId());
			if(emplentity!=null)
			{
				indcatid=emplentity.getIndsubcat().getIndustrycategory().getTrnIndstrCatId();
				List<IndustrySubCategoryEntity> indsubsubcatlist = indsubcatindservice.getIndustrySubCategories(indcatid);
				Integer indid = emplentity.getIndsubcat().getIndustrycategory().getIndustry().getTrnIndstrId();
				List<IndustryCategoryEntity> indcatlist = industrycategoryser.getIndustryCategories(indid);
				for(IndustryCategoryEntity indcatName:indcatlist)
					System.out.println(indcatName.getIndstrCatName());
				model.addAttribute("industrycategories", new JSONArray(indcatlist));
				model.addAttribute("industrysubcat",new JSONArray(indsubsubcatlist));
				model.addAttribute("employmentdetails", emplentity);
			}
			
			//Location Details
			
			LocationEntity location = locservice.findLocDet(trainee.getUser().getUserId());
			System.out.println(location);
			if(location!=null)
			{
				List<StateEntity> states = stateservice.getStates(location.getCity().getState().getCountry().getCountryId());
				List<CityEntity> cities = cityservice.getCities(location.getCity().getState().getStateId());
				Long country_value = location.getCity().getState().getCountry().getCountryId();
				model.addAttribute("country_value",country_value);
				model.addAttribute("locentity",location);
				model.addAttribute("states",new JSONArray(states));
				model.addAttribute("cities",new JSONArray(cities));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("New User... No result available");
			model.addAttribute("industrycategories",new JSONArray(industrycategoryser.getIndustryCategories()));
			model.addAttribute("industry_value",0);
			model.addAttribute("industry_cat_value",0);
			model.addAttribute("industry_subcat_value",0);
		}
		finally
		{
			model.addAttribute("industries",new JSONArray(industryservice.getIndustries()));
			model.addAttribute("countries",countryservice.getAllCountries());
		}
		return "pages/Trainee/Trainprofile";
	}
	
	/**
	 * Common method
	 * @param request
	 * @param model
	 * @param token
	 * @return
	 */
	@RequestMapping(value = "/regitrationConfirm", method = RequestMethod.GET)
	public String confirmRegistration( @RequestParam("token") String token) {	         
	    //if no match or expired redirect to baduser.html else set email verified true and redirect to login/main page
	
	    return null;
	}

}
