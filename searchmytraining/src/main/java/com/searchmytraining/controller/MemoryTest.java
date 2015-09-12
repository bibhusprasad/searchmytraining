package com.searchmytraining.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemoryTest {
	
		@RequestMapping("/getMemoryStatus")
		public String getMemoryinMB(ModelMap model)
		{
			String unit = " MB";
			int noofprocessors =Runtime.getRuntime().availableProcessors();
			String totalheapsize=Runtime.getRuntime().totalMemory()/1048576 + unit;
			String maxjvmmemory=Runtime.getRuntime().maxMemory()/1048576 + unit;
			String freejvmmemory=Runtime.getRuntime().freeMemory()/1048576 + unit;
			String usedjvmmemory=((Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory()) / 1048576) + unit;
			model.addAttribute("noofprocessors", noofprocessors);
			model.addAttribute("totalheapsize", totalheapsize);
			model.addAttribute("maxjvmmemory", maxjvmmemory);
			model.addAttribute("freejvmmemory", freejvmmemory);
			model.addAttribute("usedjvmmemory", usedjvmmemory);
			return "MemoryUtilized";
		}
		
		@RequestMapping("/getMemoryStatusInKB")
		public String getMemoryinKB(ModelMap model)
		{
			String unit = " KB";
			int noofprocessors =Runtime.getRuntime().availableProcessors();
			String totalheapsize=Runtime.getRuntime().totalMemory()/1024 + unit;
			String maxjvmmemory=Runtime.getRuntime().maxMemory()/1024 + unit;
			String freejvmmemory=Runtime.getRuntime().freeMemory()/1024 + unit;
			String usedjvmmemory=((Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory()) / 1024) + unit;
			model.addAttribute("noofprocessors", noofprocessors);
			model.addAttribute("totalheapsize", totalheapsize);
			model.addAttribute("maxjvmmemory", maxjvmmemory);
			model.addAttribute("freejvmmemory", freejvmmemory);
			model.addAttribute("usedjvmmemory", usedjvmmemory);
			return "MemoryUtilized";
		}
}
