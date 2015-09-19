package com.searchmytraining.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.searchmytraining.dto.ClientDetailsDTO;
import com.searchmytraining.dto.ContactDTO;
import com.searchmytraining.dto.EmploymentDTO;
import com.searchmytraining.dto.InstituteDTO;
import com.searchmytraining.dto.LocationDTO;
import com.searchmytraining.dto.ProfessionalAssociationDTO;
import com.searchmytraining.service.IContactInfoService;
import com.searchmytraining.service.IEmploymentService;
import com.searchmytraining.service.IInstituteServiceDetails;
import com.searchmytraining.service.ILocationService;
import com.searchmytraining.service.impl.IndustryService;
import com.searchmytraining.wrapper.RespnoseWrapper;

@Controller
public class ProfileController {
	
	@Autowired
	public IInstituteServiceDetails instituteservice;
	
	@Autowired
	private IndustryService industryservice;
	
	@Autowired
	public ILocationService locservice;
	
	@Autowired
	public IEmploymentService emplservice;
	
	@Autowired
	public IContactInfoService contactinfoservice;
	
	@RequestMapping(value="/updateinstitutedetails",method = RequestMethod.POST, produces={"application/json"}, consumes={"application/json"})
	@ResponseBody
	public InstituteDTO updateInstituteDetails(@RequestBody InstituteDTO institutedto)
	{
		System.out.println(institutedto.getUserid());
		instituteservice.updateInstituteDetails(institutedto);
		return null;
		/*return institutedto;*/
	}
	
	@RequestMapping(value="/updatecontactinfo",method = RequestMethod.POST, produces={"application/json"}, consumes={"application/json"})
	@ResponseBody
	public void updateContactInfo(@RequestBody @Valid ContactDTO contactdto)
	{
		System.out.println("in updateContactInfo...");
		System.out.println(contactdto);
		contactinfoservice.updateContactInfoDet(contactdto);
	}
	
	@RequestMapping(value="/updatelocinfo",method = RequestMethod.POST, produces={"application/json"}, consumes={"application/json"})
	@ResponseBody
	public void updateLocInfo(@RequestBody LocationDTO instlocdto)
	{
		System.out.println("in updateLocInfo...");
		locservice.updateLocationInfo(instlocdto);
	}
	
	@RequestMapping(value="/updateassociationinfo",method = RequestMethod.POST, produces={"application/json"}, consumes={"application/json"})
	@ResponseBody
	public void updateProfessionalAssociation(@RequestBody ProfessionalAssociationDTO associationdto)
	{
		instituteservice.updateProfessionalAssociations(associationdto);
	}
	
	@RequestMapping(value="/updateclientdetails",method = RequestMethod.POST, produces={"application/json"}, consumes={"application/json"})
	@ResponseBody
	public void updateClientDetails(@RequestBody ClientDetailsDTO clientdetailsdto)
	{
		instituteservice.updateClientDetails(clientdetailsdto);	
	}
	
	@RequestMapping(value="/updateFreedetails",method = RequestMethod.POST, produces={"application/json"}, consumes={"application/json"})
	/*@ResponseBody*/
	public void updateFreeDetails(@RequestBody  Object obj)
	{
		System.out.println("In UpdateFreeDetails "+obj.getClass());
		/*instituteservice.updateClientDetails(clientdetailsdto);	*/
	}

	@RequestMapping("/TPcalender")
	public String TPcalender(ModelMap model)
	{
		model.addAttribute("industries",
				new JSONArray(industryservice.getIndustries()));
		return "pages/TrainingProvider/TPcalender";
	}
	
	@RequestMapping(value="/updateempdet",method = RequestMethod.POST,produces={"application/json"}, consumes={"application/json"})
	@ResponseBody
	public RespnoseWrapper updateEmploymentdet(@RequestBody @Valid EmploymentDTO empldto,BindingResult result,ModelMap model)
	{
		RespnoseWrapper responsewrapper = new RespnoseWrapper();
		if(result.hasErrors())
		{
			responsewrapper.setValidationError(true);
			List<FieldError> errors=result.getFieldErrors();
			Map<String,String> errorMsg = new HashMap<String, String>();
			for(FieldError error: errors)
			{
				errorMsg.put(error.getField(), error.getDefaultMessage());
			}
			responsewrapper.setErrorMsg(errorMsg);
			return responsewrapper;
		}
		else
		{
			responsewrapper.setValidationError(false);
			emplservice.updateEmpldet(empldto);
			return responsewrapper;
		}
	}
}
