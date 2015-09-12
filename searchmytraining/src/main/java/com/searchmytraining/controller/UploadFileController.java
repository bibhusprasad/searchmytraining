package com.searchmytraining.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.IndustrySubCategoryEntity;
/*import com.searchmytraining.entity.KeywordEntity;*/
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.ICalenderService;
import com.searchmytraining.service.ICityService;

/*import com.searchmytraining.service.IKeywordService;*/

@Controller
@RequestMapping("/uploadFile")
public class UploadFileController {
	
	@Autowired
	public WebApplicationContext context;
	
	@Autowired
	public ICalenderService calnderService;
	
	@Autowired
	public ICityService cityservice;
	
	
	/*
	 * @Autowired IKeywordService keywordService;
	 */
	
	@RequestMapping(method = RequestMethod.POST)
	public String create(HttpServletRequest request,
			@RequestParam CommonsMultipartFile fileUpload, HttpSession session)
			throws Exception {

		String path = null;
		String userType = null;
		String fileName = null;
		String fileExtension = null;
		String ctitle = null;
		String Fdate = null;
		String Tdate = null;
		String Ctype = null;
		Double cPrice = null;
		Integer place = null;
		String[] keyCode = null;
		String keyword = null;
		String CDesc = null;
		Integer userid = 0;
		Integer trnIndstrSubCatId = 0;

		if (request.getServletContext().getInitParameter("uploadpath") != null) {
			path = request.getServletContext().getInitParameter("uploadpath");

		}

		fileName = fileUpload.getOriginalFilename();
		fileExtension = fileName.substring(fileName.indexOf(".") + 1,
				fileName.length());

		CalenderEntity entity = (CalenderEntity)context.getBean("calenderEntity");
		UserEntity usrEntity = (UserEntity)context.getBean("userEntity");
		IndustrySubCategoryEntity industrySubCat = (IndustrySubCategoryEntity)context.getBean("industrySubCategoryEntity");

		Calendar calendar = Calendar.getInstance();
		Timestamp currentTime = new Timestamp(calendar.getTime().getTime());

		try {

			ctitle = request.getParameter("ctitle");
			Fdate = request.getParameter("Fdate");
			Tdate = request.getParameter("Tdate");
			Ctype = request.getParameter("Ctype");
			cPrice = Double.parseDouble(request.getParameter("cPrice"));
			CDesc = request.getParameter("CDesc");
			place = Integer.parseInt(request.getParameter("place"));
			keyCode = request.getParameterValues("tags[]");
			userType = request.getParameter("userType");
			userid = Integer
					.parseInt(session.getAttribute("userid").toString());
			trnIndstrSubCatId = Integer.parseInt(request.getParameter("Itype"));
			usrEntity.setUserId(userid);
			industrySubCat.setTrnIndstrSubCatId(trnIndstrSubCatId);

			for (String element : keyCode) {

				keyword = keyword + "," + element.trim();
			}

			entity.setBrochure(path + fileUpload.getOriginalFilename());
			entity.setTitle(ctitle);
			entity.setCode("keyCode");
			entity.setContenttype("" + fileUpload.getContentType());
			entity.setCreatedBy("aaa");
			entity.setCreatedOn(currentTime);
			entity.setDescription(CDesc);
			entity.setStart_date(Fdate);
			entity.setEnd_date(Tdate);
			entity.setStatus("New");
			
			CityEntity city = cityservice.getCity(place);
			entity.setCity(city);
			entity.setType(Ctype);
			entity.setPrice(cPrice);
			entity.setTitle(ctitle);
			entity.setUpdatedBy("");
			entity.setRank(0);
			entity.setvFlag("Not Varified");
			entity.setUpdatedOn(currentTime);
			entity.setKeyword(keyword.substring(1));

			// Mapping Entity
			entity.setUser(usrEntity);
			entity.setIndstrySubcat(industrySubCat);

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
				calnderService.addCalender(entity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (userType.equalsIgnoreCase("freelancer")) {
			return "pages/FreeLancer/FreeLancerProfile";
		} else {
			return "pages/TrainingProvider/TrainingProviderProfile";
		}

	}
}
