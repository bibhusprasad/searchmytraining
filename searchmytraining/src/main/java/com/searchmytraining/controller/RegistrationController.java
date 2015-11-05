package com.searchmytraining.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
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

import com.searchmytraining.common.constant.SearchMyTrainingConstant;
import com.searchmytraining.dto.TraineeDTO;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.EmploymentEntity;
import com.searchmytraining.entity.IndustryCategoryEntity;
import com.searchmytraining.entity.IndustrySubCategoryEntity;
import com.searchmytraining.entity.LocationEntity;
import com.searchmytraining.entity.StateEntity;
import com.searchmytraining.entity.TraineeEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.exception.SearchMyTrainingException;
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
import com.searchmytraining.wrapper.ResponseWrapper;

@Controller
@SessionAttributes("userid")
public class RegistrationController {

	@Autowired
	private ResponseWrapper respnoseWrapper;
	
	@Autowired
	private ITraineeService iTraineeService;

	private final Logger log = Logger.getLogger(this.getClass().getName());

	@Autowired
	private IUserService userservice;

	@Autowired
	private IIndustrySerivice industryservice;

	@Autowired
	private IIndustryCategoryService industrycategoryser;

	@Autowired
	private IIndustrySubCategoryService indsubcatindservice;

	@Autowired
	private IEmploymentService employmentservice;

	@Autowired
	private ILocationService locservice;

	@Autowired
	private IStateService stateservice;
	
	@Autowired
	private ICityService cityservice;
	
	@Autowired
	private ICountryService countryservice;

	@RequestMapping(value = "/registration/trainee" ,method = RequestMethod.POST, produces = SearchMyTrainingConstant.APPLICATION_JSON_CHARSET_UTF_8)
	@ResponseBody
	public ResponseWrapper traineeRegistration(@RequestBody @Valid TraineeDTO traineedto, BindingResult bindingResult,
			ModelMap model, HttpServletRequest request,Locale locale,HttpSession session) throws SearchMyTrainingException{
		Map<String, String> errorMsg = new HashMap<String, String>();
		try{
			if (bindingResult.hasErrors()) {
				respnoseWrapper.setResponseWrapperId((long) Math.random());
				respnoseWrapper.setValidationError(true);
				List<FieldError> errors = bindingResult.getFieldErrors();
				for (FieldError error : errors) {
					errorMsg.put(error.getField(), error.getDefaultMessage());
					log.error(error.getField() + " : "+ error.getDefaultMessage());
				}
				respnoseWrapper.setErrorMsg(errorMsg);
				respnoseWrapper.setSuccessMessage(false);
				return respnoseWrapper;
			} else {
				respnoseWrapper.setValidationError(false);
				Map<Long, Boolean> statusmap = iTraineeService.registerTrainee(traineedto);
				session.setAttribute("userid", statusmap.keySet().iterator().next());
				if(!statusmap.values().iterator().next()){
					respnoseWrapper.setSuccessMessage(false);
					errorMsg.put(SearchMyTrainingConstant.DUPLICATE_USER,SearchMyTrainingConstant.USER_EXIST);
					respnoseWrapper.setErrorMsg(errorMsg);
				}else{
					respnoseWrapper.setSuccessMessage(true);
				}
				return respnoseWrapper;
			}	
		}catch(SearchMyTrainingException searchMyTrainingException){
			errorMsg.put(searchMyTrainingException.getErrorCode().toString(), searchMyTrainingException.getMessage());
			respnoseWrapper.setErrorMsg(errorMsg);
			respnoseWrapper.setSuccessMessage(false);
		}catch (Exception exception) {
			errorMsg.put(exception.getMessage(),exception.getMessage());
			respnoseWrapper.setErrorMsg(errorMsg);
			respnoseWrapper.setSuccessMessage(false);
		}
		return respnoseWrapper;
	}

	@RequestMapping(value = "/trainee/login" ,method = RequestMethod.POST, produces = SearchMyTrainingConstant.APPLICATION_JSON_CHARSET_UTF_8)
	public String traineeProfileMapping(@RequestParam("username") String username, ModelMap model, HttpServletRequest request,Locale locale,HttpSession session) {
		TraineeEntity trainee = null;
		UserEntity userEntity = userservice.getUser(username);
		if(null != userEntity){
			trainee = iTraineeService.getTrainee(userEntity.getUserId());
		}
		session.setAttribute("trainee", trainee);
		return "pages/Trainee/TraineeProfile";
	}

	@RequestMapping("/trainee/profile")
	public String updateTraineeProfile(ModelMap model, HttpSession session) {
		TraineeEntity trainee = (TraineeEntity) session.getAttribute("trainee");
		Integer indSubCatId = 0;
		try {
			EmploymentEntity emplentity = employmentservice.findEmplDet(trainee.getUser().getUserId());
			if (emplentity != null) {
				indSubCatId = emplentity.getIndsubcat().getIndustrycategory().getTrnIndstrCatId();
				List<IndustrySubCategoryEntity> indsubsubcatlist = indsubcatindservice.getIndustrySubCategories(indSubCatId);
				Integer trainingIndId = emplentity.getIndsubcat().getIndustrycategory().getIndustry().getTrnIndstrId();
				List<IndustryCategoryEntity> indcatlist = industrycategoryser.getIndustryCategories(trainingIndId);
				model.addAttribute("industrycategories", new JSONArray(indcatlist));
				model.addAttribute("industrysubcat", new JSONArray(indsubsubcatlist));
				model.addAttribute("employmentdetails", emplentity);
			}
			LocationEntity location = locservice.findLocDet(trainee.getUser().getUserId());
			System.out.println(location);
			if (location != null) {
				List<StateEntity> states = stateservice.getStates(location.getCity().getState().getCountry().getCountryId());
				List<CityEntity> cities = cityservice.getCities(location.getCity().getState().getStateId());
				Integer country_value = location.getCity().getState().getCountry().getCountryId();
				model.addAttribute("country_value", country_value);
				model.addAttribute("locentity", location);
				model.addAttribute("states", new JSONArray(states));
				model.addAttribute("cities", new JSONArray(cities));
			}
		} catch (Exception e) {
			model.addAttribute("industrycategories", new JSONArray(industrycategoryser.getIndustryCategories()));
			model.addAttribute("industry_value", 0);
			model.addAttribute("industry_cat_value", 0);
			model.addAttribute("industry_subcat_value", 0);
		} finally {
			model.addAttribute("industries",new JSONArray(industryservice.getIndustries()));
			model.addAttribute("countries", countryservice.getAllCountries());
		}
		return "pages/Trainee/Trainprofile";
	}

	
	@RequestMapping(value = "/regitrationConfirm", method = RequestMethod.GET)
	public String confirmRegistration(@RequestParam("token") String token) {
		return null;
	}

}
