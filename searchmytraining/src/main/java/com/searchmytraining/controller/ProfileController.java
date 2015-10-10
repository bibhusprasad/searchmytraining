package com.searchmytraining.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.searchmytraining.common.constant.CalenderType;
import com.searchmytraining.dto.ClientDetailsDTO;
import com.searchmytraining.dto.ContactDTO;
import com.searchmytraining.dto.EmploymentDTO;
import com.searchmytraining.dto.InstituteDTO;
import com.searchmytraining.dto.LocationDTO;
import com.searchmytraining.dto.ProfessionalAssociationDTO;
import com.searchmytraining.entity.LocationEntity;
import com.searchmytraining.entity.TrainerEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.ICityService;
import com.searchmytraining.service.IContactInfoService;
import com.searchmytraining.service.IEmploymentService;
import com.searchmytraining.service.IInstituteServiceDetails;
import com.searchmytraining.service.ILocationService;
import com.searchmytraining.service.IStateService;
import com.searchmytraining.service.ITrainingProviderService;
import com.searchmytraining.service.IUserService;
import com.searchmytraining.service.impl.IndustryService;
import com.searchmytraining.wrapper.RespnoseWrapper;

@Controller
public class ProfileController {

	@Autowired
	private IInstituteServiceDetails instituteservice;

	@Autowired
	private ITrainingProviderService trainerservice;

	@Autowired
	private ILocationService iLocationService;
	@Autowired
	private ICityService iCityService;
	@Autowired
	private IStateService iStateService;
	@Autowired
	private IndustryService industryservice;

	@Autowired
	private IUserService userService;

	@Autowired
	private ILocationService locservice;

	@Autowired
	private IEmploymentService emplservice;

	@Autowired
	private IContactInfoService contactinfoservice;

	@RequestMapping(value = "/updateinstitutedetails", method = RequestMethod.POST, produces = { "application/json" }, consumes = { "application/json" })
	@ResponseBody
	public InstituteDTO updateInstituteDetails(
			@RequestBody InstituteDTO institutedto) {
		System.out.println(institutedto.getUserid());
		instituteservice.updateInstituteDetails(institutedto);
		return null;
		/* return institutedto; */
	}

	@RequestMapping(value = "/updatecontactinfo", method = RequestMethod.POST, produces = { "application/json" }, consumes = { "application/json" })
	@ResponseBody
	public void updateContactInfo(@RequestBody @Valid ContactDTO contactdto) {
		System.out.println("in updateContactInfo...");
		System.out.println(contactdto);
		contactinfoservice.updateContactInfoDet(contactdto);
	}

	@RequestMapping(value = "/updatelocinfo", method = RequestMethod.POST, produces = { "application/json" }, consumes = { "application/json" })
	@ResponseBody
	public void updateLocInfo(@RequestBody LocationDTO instlocdto) {
		System.out.println("in updateLocInfo...");
		locservice.updateLocationInfo(instlocdto);
	}

	@RequestMapping(value = "/updateassociationinfo", method = RequestMethod.POST, produces = { "application/json" }, consumes = { "application/json" })
	@ResponseBody
	public void updateProfessionalAssociation(
			@RequestBody ProfessionalAssociationDTO associationdto) {
		instituteservice.updateProfessionalAssociations(associationdto);
	}

	@RequestMapping(value = "/updateclientdetails", method = RequestMethod.POST, produces = { "application/json" }, consumes = { "application/json" })
	@ResponseBody
	public void updateClientDetails(
			@RequestBody ClientDetailsDTO clientdetailsdto) {
		instituteservice.updateClientDetails(clientdetailsdto);
	}

	@RequestMapping(value = "/updateFreedetails", method = RequestMethod.POST, produces = { "application/json" }, consumes = { "application/json" })
	/* @ResponseBody */
	public void updateFreeDetails(@RequestBody Object obj) {
		System.out.println("In UpdateFreeDetails " + obj.getClass());
		/* instituteservice.updateClientDetails(clientdetailsdto); */
	}

	@RequestMapping("/TPcalender")
	public String TPcalender(ModelMap model, HttpSession session) {
		model.addAttribute("industries",
				new JSONArray(industryservice.getIndustries()));
		model.addAttribute("cities", new JSONArray(iCityService.getAllCities()));
		model.addAttribute("states",
				new JSONArray(iStateService.getAllStates()));
		List<LocationEntity> address = new ArrayList<LocationEntity>();
		address.add(iLocationService.findLocDet((Integer) session
				.getAttribute("userid")));
		model.addAttribute("address", new JSONArray(address));
		List<String> calType = new ArrayList<String>();
		UserEntity user = null;
		Integer userId = (Integer) session.getAttribute("userid");
		user = userService.getUser(userId);
		if (null != user) {
			session.setAttribute("userid", user.getUserId());
			TrainerEntity trainer = trainerservice.getTrainerByUserid(user
					.getUserId().longValue());
			if (trainer != null) {
				session.setAttribute("trainer", trainer);
			}
		}
		for (CalenderType cal : CalenderType.values()) {
			calType.add(cal.getVal());
		}
		model.addAttribute("calenderTypes", new JSONArray(calType));
		// return "pages/TrainingProvider/TPcalender";
		return "pages/TrainingProvider/PostCalender";
	}

	@RequestMapping(value = "/updateempdet", method = RequestMethod.POST, produces = { "application/json" }, consumes = { "application/json" })
	@ResponseBody
	public RespnoseWrapper updateEmploymentdet(
			@RequestBody @Valid EmploymentDTO empldto, BindingResult result,
			ModelMap model) {
		RespnoseWrapper responsewrapper = new RespnoseWrapper();
		if (result.hasErrors()) {
			responsewrapper.setValidationError(true);
			List<FieldError> errors = result.getFieldErrors();
			Map<String, String> errorMsg = new HashMap<String, String>();
			for (FieldError error : errors) {
				errorMsg.put(error.getField(), error.getDefaultMessage());
			}
			responsewrapper.setErrorMsg(errorMsg);
			return responsewrapper;
		} else {
			responsewrapper.setValidationError(false);
			emplservice.updateEmpldet(empldto);
			return responsewrapper;
		}
	}

	@RequestMapping("/MPcalender")
	public String manageCalender(ModelMap model, HttpSession session) {
		List<String> calType = new ArrayList<String>();
		for (CalenderType cal : CalenderType.values()) {
			calType.add(cal.getVal());
		}
		model.addAttribute("calenderTypes", new JSONArray(calType));
		UserEntity user = null;
		Integer userId = (Integer) session.getAttribute("userid");
		user = userService.getUser(userId);
		if (null != user) {
			session.setAttribute("userid", user.getUserId());
			TrainerEntity trainer = trainerservice.getTrainerByUserid(user
					.getUserId().longValue());
			if (trainer != null) {
				session.setAttribute("trainer", trainer);
			}
		}
		return "pages/TrainingProvider/manageCalender";
	}
}
