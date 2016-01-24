package com.searchmytraining.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.searchmytraining.service.ICityService;

@Controller
public class MyController {
	
	@Autowired
	private ICityService cityservice;
	

	@RequestMapping("/")
	public String displayFiles(HttpServletRequest request,ModelMap model) {
		
		//Images for Vertical Left pane
		
		String AdsImagesPath_leftvertical = request.getServletContext().getInitParameter(
				"ads_verticalleftscroller");
		String webapppath = request.getServletContext().getRealPath("/");
		List<String> verticalLeftImageList = new ArrayList<String>();
		File verticalLeftImageDir = new File(webapppath+AdsImagesPath_leftvertical);
		for (File imageFile : verticalLeftImageDir.listFiles()) {
			verticalLeftImageList.add(imageFile.getName());
		}
		request.setAttribute("verticalLeftImageList", verticalLeftImageList);
		
		//Images for Vertical Right pane
		
		String AdsImagesPath_rightvertical = request.getServletContext().getInitParameter(
				"ads_verticalrightscroller");
		List<String> verticalRightImageList = new ArrayList<String>();
		File verticalRightImageDir = new File(webapppath+AdsImagesPath_rightvertical);
		for (File imageFile : verticalRightImageDir.listFiles()) {
			verticalRightImageList.add(imageFile.getName());
		}
		request.setAttribute("verticalRightImageList", verticalRightImageList);
		
		//Images for Horizontal main banner

		String AdsImagesPath_HorizontalMainBanner = request.getServletContext().getInitParameter(
				"ads_horizontalmainbanner");
		List<String> horizontalMainImageList = new ArrayList<String>();
		File horizontalMainImageDir = new File(webapppath+AdsImagesPath_HorizontalMainBanner);
		for (File imageFile : horizontalMainImageDir.listFiles()) {
			horizontalMainImageList.add(imageFile.getName());
		}
		request.setAttribute("horizontalMainImageList", horizontalMainImageList);
		
		//model.addAttribute("cities", cityservice.getAllCities());
		return "index";
	}

	@RequestMapping("/tt")
	public String doAction() {
		return "pages/FreeLancer/FLprofile";
	}

	@RequestMapping("/calenderdiv")
	public String doAction2() {
		return "pages/CodePages/calenderdiv";
	}

	@RequestMapping("/freelancerdiv")
	public String doAction4() {
		return "pages/CodePages/freelancerdiv";
	}

	@RequestMapping("/seminardiv")
	public String doAction5() {
		return "pages/CodePages/seminardiv";
	}
	@RequestMapping("/Institueview")
	public String Institueview() {
		return "pages/CodePages/Viewdetail";
	}

	@RequestMapping("/FLinsights")
	public String doAction6() {
		return "pages/FreeLancer/FLinsights";
	}

	@RequestMapping("/FLsetting")
	public String doAction7() {
		return "pages/FreeLancer/FLsetting";
	}

	@RequestMapping("/Resent")
	public String doAction9() {
		return "pages/FreeLancer/Resentcalender";
	}

	@RequestMapping("/View")
	public String doAction10() {
		return "pages/FreeLancer/AllCalender";
	}

	@RequestMapping("/index")
	public String doAction8() {
		return "index";
	}

	@RequestMapping("/downlodCal")
	public String GetCalenderDownload() {
		return "pages/downlodCalender";
	}

	@RequestMapping("/LOG")
	public String GeLOG() {
		return "pages/LogIn";
	}

	@RequestMapping("/about")
	public String About() {
		return "pages/InternalPages/AboutUs";
	}

	@RequestMapping("/contact")
	public String Contact() {
		return "pages/InternalPages/ContactUs";
	}
	@RequestMapping("/Team")
	public String Team() {
		return "pages/InternalPages/MeetOurTeam";
	}
	@RequestMapping("/Benefit")
	public String Benefit() {
		return "pages/InternalPages/Benifits";
	}
	@RequestMapping("/TPBenefit")
	public String TPBenefit() {
		return "pages/InternalPages/TPbenifits";
	}
	@RequestMapping("/FLBenefit")
	public String FLBenefit() {
		return "pages/InternalPages/FLBenifits";
	}
	@RequestMapping("/Career")
	public String Career() {
		return "pages/InternalPages/Career";
	}
	@RequestMapping("/News")
	public String News() {
		return "pages/InternalPages/SMTnews";
	}
	@RequestMapping("/Blog")
	public String Blog() {
		return "pages/InternalPages/Blog";
	}
	
	@RequestMapping("/AdvSearch")
	public String Advanc() {
		return "pages/AdvSearch";
	}

	@RequestMapping("/searchview")
	public String searchview() {
		return "searchcalender";
	}
	
	@RequestMapping("/FLR")
	public String FLR(ModelMap model) {
		model.addAttribute("cities", cityservice.getAllCities());	
		return "pages/FreeLancer/FreelancerResistration";
	}
	@RequestMapping("/TR")
	public String TR() {
		return "pages/Trainee/TraineeRegistration";
	}
	@RequestMapping("/TPR")
	public String TPR(ModelMap model) {
		model.addAttribute("cities", cityservice.getAllCities());		
		return "pages/TrainingProvider/TrainingProviderRegistration";
	}
	@RequestMapping("/GTR")
	public String GTR(ModelMap model) {
		model.addAttribute("cities", cityservice.getAllCities());
		return "pages/GroupTrainingRequest";
	}
	@RequestMapping("/TER")
	public String TER(ModelMap model) {
		model.addAttribute("cities", cityservice.getAllCities());
		return "pages/TrainingEnquiry";
	}
	
	@RequestMapping("/sign")
	public String sign() {
		return "core/signIn";
	}
	@RequestMapping("/LoginH")
	public String LoginH() {
		return "core/defaultLogin";
	}
	
	/*@RequestMapping("/forgotpassword")
	public String forgotPass(@RequestParam String username,ModelMap model) {
		System.out.println("username: "+username);
		model.addAttribute("username", username);
		return "pages/ForgotPassword";
	}*/

}
