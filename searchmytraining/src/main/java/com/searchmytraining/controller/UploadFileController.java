package com.searchmytraining.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.searchmytraining.common.constant.SearchMyTrainingConstant;
import com.searchmytraining.dto.TrainingProviderCalenderDTO;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.exception.SearchMyTrainingException;
import com.searchmytraining.service.ICalenderService;
import com.searchmytraining.service.IUserService;
import com.searchmytraining.wrapper.RespnoseWrapper;

/*import com.searchmytraining.service.IKeywordService;*/

@Controller
public class UploadFileController {

	@Autowired
	public ICalenderService calnderService;

	@Autowired
	private IUserService userService;
	
	@Autowired
	private RespnoseWrapper respnoseWrapper;

	private final Logger log = Logger.getLogger(this.getClass().getName());

	@RequestMapping(value = "/calender/postCalender", method = RequestMethod.POST,
			produces = SearchMyTrainingConstant.APPLICATION_JSON_CHARSET_UTF_8,consumes ="application/x-www-form-urlencoded")
	@ResponseBody
	public RespnoseWrapper postCalenderRegistration(
			@RequestBody /*@Valid*/ TrainingProviderCalenderDTO trainingProviderCalenderDTO, BindingResult result,
			ModelMap model, HttpServletRequest request,
			@RequestParam (required = false) CommonsMultipartFile fileUpload,
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
				respnoseWrapper.setValidationError(false);
				UserEntity user=userService.getUser((Integer)session.getAttribute("userid"));
				calnderService.savePostCalenser(trainingProviderCalenderDTO, user);
			}
		} catch (SMTException smtException) {
			log.error("exception occured", smtException);
		}catch(Exception e){
			log.error("exception occured", e);
		}
		return null;
	}

	/*
	 * @RequestMapping(method = RequestMethod.POST) public String
	 * create(HttpServletRequest request,
	 * 
	 * @RequestParam CommonsMultipartFile fileUpload, HttpSession session)
	 * throws Exception {
	 * 
	 * String path = null; String fileName = null; String fileExtension = null;
	 * String ctitle = null; String Fdate = null; String Tdate = null; String
	 * Ctype = null; Double cPrice = null; String place = null; String keyCode =
	 * null; String keyword = null; String CDesc = null; Integer userid = 0;
	 * Integer trnIndstrSubCatId = 0; if
	 * (request.getServletContext().getInitParameter("uploadpath") != null) {
	 * path = request.getServletContext().getInitParameter("uploadpath");
	 * 
	 * }
	 * 
	 * fileName = fileUpload.getOriginalFilename(); fileExtension =
	 * fileName.substring(fileName.indexOf(".") + 1, fileName.length());
	 * 
	 * CalenderEntity entity = new CalenderEntity(); UserEntity usrEntity =
	 * userService
	 * .getUser(Integer.parseInt(session.getAttribute("userid").toString()));
	 * IndustrySubCategoryEntity industrySubCat = new
	 * IndustrySubCategoryEntity();
	 * 
	 * Calendar calendar = Calendar.getInstance(); Timestamp currentTime = new
	 * Timestamp(calendar.getTime().getTime());
	 * 
	 * try {
	 * 
	 * ctitle = request.getParameter("ctitle"); Fdate =
	 * request.getParameter("Fdate"); Tdate = request.getParameter("Tdate");
	 * Ctype = request.getParameter("Ctype"); cPrice =
	 * Double.parseDouble(request.getParameter("cPrice")); CDesc =
	 * request.getParameter("CDesc"); place = request.getParameter("place");
	 * keyCode = request.getParameter("tags-field"); userid =
	 * Integer.parseInt(session.getAttribute("userid").toString());
	 * trnIndstrSubCatId = Integer.parseInt(request.getParameter("Itype"));
	 * usrEntity.setUserId(userid);
	 * industrySubCat.setTrnIndstrSubCatId(trnIndstrSubCatId); String
	 * keyString[]=null; if(null != keyCode && keyCode.indexOf(",") != -1){
	 * keyString=keyCode.split(","); }else{ keyString=new String[1];
	 * keyString[0]=keyCode; } StringBuilder stringBuilder=new StringBuilder();
	 * for (String element : keyString) { stringBuilder =
	 * stringBuilder.append(element.trim()).append(","); }
	 * 
	 * entity.setBrochure(path + fileUpload.getOriginalFilename());
	 * entity.setTitle(ctitle); entity.setCode("keyCode");
	 * entity.setContenttype("" + fileUpload.getContentType());
	 * entity.setCreatedBy(usrEntity.getUserName());
	 * entity.setCreatedOn(currentTime); entity.setDescription(CDesc);
	 * entity.setStartDate(Fdate); entity.setEndDate(Tdate);
	 * entity.setStatus("New");
	 * 
	 * CityEntity city = cityservice.getCity(Integer.parseInt(place));
	 * //entity.setCity(city); entity.setType(Ctype); entity.setPrice(cPrice);
	 * entity.setTitle(ctitle); entity.setUpdatedBy(""); entity.setRank(0);
	 * entity.setvFlag("Not Varified"); entity.setUpdatedOn(currentTime);
	 * entity.setKeyword(stringBuilder.substring(0,
	 * stringBuilder.length()-1).toString());
	 * 
	 * // Mapping Entity entity.setUser(usrEntity);
	 * entity.setIndstrySubcat(industrySubCat);
	 * 
	 * if (null != fileExtension && fileExtension.equalsIgnoreCase("pdf")) {
	 * 
	 * InputStream inputStream = null; OutputStream outputStream = null; if
	 * (fileUpload.getSize() > 0) { inputStream = fileUpload.getInputStream();
	 * outputStream = new FileOutputStream(path +
	 * fileUpload.getOriginalFilename());
	 * 
	 * int readBytes = 0; byte[] buffer = new byte[10000]; while ((readBytes =
	 * inputStream.read(buffer, 0, 10000)) != -1) { outputStream.write(buffer,
	 * 0, readBytes); } outputStream.close(); inputStream.close(); }
	 * calnderService.addCalender(entity); } } catch (Exception e) {
	 * e.printStackTrace(); } if
	 * (userService.getUserRole(usrEntity).equalsIgnoreCase("freelancer")) {
	 * return "pages/FreeLancer/FreeLancerProfile"; } else { return
	 * "pages/TrainingProvider/TrainingProviderProfile"; }
	 * 
	 * }
	 */
}
