package com.searchmytraining.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.searchmytraining.common.constant.SearchMyTrainingConstant;
import com.searchmytraining.dto.CalenderDetailsDTO;
import com.searchmytraining.dto.TrainingProviderCalenderDTO;
import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.entity.TrainerEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.exception.SearchMyTrainingException;
import com.searchmytraining.service.ICalenderService;
import com.searchmytraining.service.ITrainingProviderService;
import com.searchmytraining.service.IUserService;
import com.searchmytraining.wrapper.ResponseWrapper;

/*import com.searchmytraining.service.IKeywordService;*/

@Controller
public class UploadFileController {

	@Autowired
	private ICalenderService calnderService;
	
	@Autowired
	private IUserService userService;

	@Autowired
	private ITrainingProviderService trainerservice;

	@Autowired
	private ICalenderService iCalenderService;

	@Autowired
	private ResponseWrapper respnoseWrapper;

	private final Logger log = Logger.getLogger(this.getClass().getName());

	@RequestMapping(value = "/calender/postCalender", method = RequestMethod.POST, produces = SearchMyTrainingConstant.APPLICATION_JSON_CHARSET_UTF_8, consumes = SearchMyTrainingConstant.APPLICATION_JSON_CHARSET_UTF_8)
	@ResponseBody
	public ResponseWrapper postCalenderRegistration(
			@RequestBody @Valid TrainingProviderCalenderDTO trainingProviderCalenderDTO,
			BindingResult result, ModelMap model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws SearchMyTrainingException {
		Map<String, String> errorMsg = new HashMap<>();
		try {
			if (result.hasErrors()) {
				respnoseWrapper.setResponseWrapperId((long) Math.random());
				respnoseWrapper.setValidationError(true);
				List<FieldError> errors = result.getFieldErrors();
				for (FieldError error : errors) {
					errorMsg.put(error.getField(), error.getDefaultMessage());
					log.error(error.getField() + " : "
							+ error.getDefaultMessage());
				}
				respnoseWrapper.setErrorMsg(errorMsg);
				respnoseWrapper.setSuccessMessage(false);
				return respnoseWrapper;
			} else {
				UserEntity user = userService.getUser((Long) session
						.getAttribute("userid"));
				if(trainingProviderCalenderDTO.isEdit()){
					calnderService.updateCalender(trainingProviderCalenderDTO,user);
				}else{
					calnderService.savePostCalenser(trainingProviderCalenderDTO,user);
				}
				
				respnoseWrapper.setValidationError(false);
				respnoseWrapper.setSuccessMessage(true);
			}
		} catch (SMTException smtException) {
			log.error("exception occured", smtException);
		} catch (Exception e) {
			log.error("exception occured", e);
		}
		return respnoseWrapper;
	}

	@RequestMapping(value = "/calender/previewCalender", method = RequestMethod.POST, produces = SearchMyTrainingConstant.APPLICATION_JSON_CHARSET_UTF_8, consumes = SearchMyTrainingConstant.APPLICATION_JSON_CHARSET_UTF_8)
	@ResponseBody
	public ResponseWrapper previewCalenderRegistration(
			@RequestBody @Valid TrainingProviderCalenderDTO trainingProviderCalenderDTO,
			ModelMap model, HttpServletRequest request, BindingResult result,
			HttpServletResponse response, HttpSession session)
			throws SearchMyTrainingException {
		Map<String, String> errorMsg = new HashMap<>();
		try {
			if (result.hasErrors()) {
				respnoseWrapper.setResponseWrapperId((long) Math.random());
				respnoseWrapper.setValidationError(true);
				List<FieldError> errors = result.getFieldErrors();
				for (FieldError error : errors) {
					errorMsg.put(error.getField(), error.getDefaultMessage());
					log.error(error.getField() + " : "
							+ error.getDefaultMessage());
				}
				respnoseWrapper.setErrorMsg(errorMsg);
				respnoseWrapper.setSuccessMessage(false);
				return respnoseWrapper;
			} else {
				UserEntity user = null;
				Long userId = (Long) session.getAttribute("userid");
				user = userService.getUser(userId);
				if (null != user) {
					session.setAttribute("userid", user.getUserId());
					TrainerEntity trainer = trainerservice
							.getTrainerByUserid(user.getUserId().longValue());
					if (trainer != null) {
						session.setAttribute("trainer", trainer);
						session.setAttribute("trainingProviderCalenders",
								trainingProviderCalenderDTO);
					}
				}
				respnoseWrapper.setSuccessMessage(true);
				respnoseWrapper.setPreviewCal(true);
				return respnoseWrapper;
			}
		} catch (Exception e) {
			log.error("exception occured", e);
		}
		return null;
	}

	@RequestMapping(value = "/calender/getCalenderDetails", method = RequestMethod.POST, produces = SearchMyTrainingConstant.APPLICATION_JSON_CHARSET_UTF_8, consumes = SearchMyTrainingConstant.APPLICATION_JSON_CHARSET_UTF_8)
	@ResponseBody
	public ResponseWrapper getCalenderDetails(
			@RequestBody @Valid CalenderDetailsDTO calenderDetailsDTO,
			ModelMap model, HttpServletRequest request, BindingResult result,
			HttpServletResponse response, HttpSession session)
			throws SearchMyTrainingException {
		Map<String, String> errorMsg = new HashMap<>();
		try {
			if (result.hasErrors()) {
				respnoseWrapper.setResponseWrapperId((long) Math.random());
				respnoseWrapper.setValidationError(true);
				List<FieldError> errors = result.getFieldErrors();
				for (FieldError error : errors) {
					errorMsg.put(error.getField(), error.getDefaultMessage());
					log.error(error.getField() + " : "
							+ error.getDefaultMessage());
				}
				respnoseWrapper.setErrorMsg(errorMsg);
				respnoseWrapper.setSuccessMessage(false);
				return respnoseWrapper;
			} else {
				UserEntity user = null;
				Long userId = (Long) session.getAttribute("userid");
				user = userService.getUser(userId);
				if (null != user) {
					session.setAttribute("userid", user.getUserId());
				}
				List<CalenderEntity> calEntities = null;
				calEntities = iCalenderService.getUserCalenderDetails(userId,
						calenderDetailsDTO);
				if (null != calEntities) {
					respnoseWrapper.setSuccessMessage(true);
					respnoseWrapper.setData((Serializable) calEntities);
				} else {
					respnoseWrapper.setSuccessMessage(false);
					respnoseWrapper.setData("no record found");
				}
				return respnoseWrapper;
			}
		} catch (Exception e) {
			log.error("exception occured", e);
		}
		return null;
	}

	@RequestMapping("/success/calender")
	public String previewCalender(ModelMap model, HttpSession session) {
		session.removeAttribute("trainingProviderCalenders");
		UserEntity user = null;
		Long userId = (Long) session.getAttribute("userid");
		user = userService.getUser(userId);
		if (null != user) {
			session.setAttribute("userid", user.getUserId());
			TrainerEntity trainer = trainerservice.getTrainerByUserid(user
					.getUserId().longValue());
			if (trainer != null) {
				session.setAttribute("trainer", trainer);
			}
		}
		return "pages/TrainingProvider/uploadCalender";
	}

	@RequestMapping("/uploadCalender")
	public String uploadInstituteLogo(
			@RequestParam CommonsMultipartFile fileUpload, HttpSession session) {
		try {
			UserEntity user = null;
			Long userId = (Long) session.getAttribute("userid");
			user = userService.getUser(userId);
			if (null != user) {
				session.setAttribute("userid", user.getUserId());
				TrainerEntity trainer = trainerservice.getTrainerByUserid(user
						.getUserId().longValue());
				if (trainer != null) {
					session.setAttribute("trainer", trainer);
				}
			}
			String fileName = null;
			String fileExtension = null;
			String path = null;
			fileName = fileUpload.getOriginalFilename();
			fileExtension = fileName.substring(fileName.indexOf(".") + 1,
					fileName.length());
			if (null != fileExtension && fileExtension.equalsIgnoreCase("pdf")) {
				InputStream inputStream = null;
				OutputStream outputStream = null;
				if (fileUpload.getSize() > 0) {
					inputStream = fileUpload.getInputStream();
					outputStream = new FileOutputStream(path
							+ fileUpload.getOriginalFilename());
					int readBytes = 0;
					byte[] buffer = new byte[10000];
					while ((readBytes = inputStream.read(buffer, 0, 10000)) != -1) {
						outputStream.write(buffer, 0, readBytes);
					}
					outputStream.close();
					inputStream.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/TrainingProvider/TrainingProviderProfile";
	}
	
	@RequestMapping(value = "/calender/editCalender", method = RequestMethod.POST, produces = SearchMyTrainingConstant.APPLICATION_JSON_CHARSET_UTF_8, consumes = SearchMyTrainingConstant.APPLICATION_JSON_CHARSET_UTF_8)
	@ResponseBody
	public ResponseWrapper editCalender(@RequestBody Integer calId,ModelMap model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		try{
			UserEntity user = null;
			Long userId = (Long) session.getAttribute("userid");
			user = userService.getUser(userId);
			if (null != user) {
				session.setAttribute("userid", user.getUserId());
				TrainerEntity trainer = trainerservice.getTrainerByUserid(user
						.getUserId().longValue());
				if (trainer != null) {
					session.setAttribute("trainer", trainer);
				}
			}
			List<CalenderEntity> calEntities = null;
			calEntities = iCalenderService.getCalenderDetailByCalId(userId,calId);
			if (null != calEntities) {
				respnoseWrapper.setData((Serializable) calEntities);
				respnoseWrapper.setSuccessMessage(true);
				session.setAttribute("editcalDetails", calEntities);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return respnoseWrapper;
	}
	
	@RequestMapping("/calender/deleteCalender/{calId}")
	public ResponseWrapper deleteCalender(@PathVariable(value = "calId") Integer calId,ModelMap model, HttpSession session) {
		try{
			UserEntity user = null;
			Long userId = (Long) session.getAttribute("userid");
			user = userService.getUser(userId);
			if (null != user) {
				session.setAttribute("userid", user.getUserId());
				TrainerEntity trainer = trainerservice.getTrainerByUserid(user
						.getUserId().longValue());
				if (trainer != null) {
					session.setAttribute("trainer", trainer);
				}
			}
			iCalenderService.removeCalender(calId, userId);
			model.addAttribute("deletecalId", calId);
			respnoseWrapper.setSuccessMessage(true);
		}catch(Exception e){
			e.printStackTrace();
		}
		return respnoseWrapper;
	}
	
}
