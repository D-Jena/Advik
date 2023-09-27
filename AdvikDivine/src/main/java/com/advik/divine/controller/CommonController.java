package com.advik.divine.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.advik.divine.model.FinancialYearModel;
import com.advik.divine.model.VendorModel;
import com.advik.divine.service.CommonService;
import com.advik.divine.service.DistrictService;

@Controller
@RequestMapping("/common")
public class CommonController {

	@Autowired
	private CommonService commonService;
	
	@Autowired
	private DistrictService distService;
	
	@GetMapping("/vendor")
	public String vendorPage(Model model) {
		model.addAttribute("stateList", commonService.getAllState());
    	model.addAttribute("vendorList", commonService.getAllVendor());
    	model.addAttribute("distList", distService.getAllDist());
		return"site.addVendor";
	}
	
	@GetMapping("/vendorEdit")
	public String vendorEdit(@RequestParam("id") Long id,RedirectAttributes attr) {
    	VendorModel vendor = commonService.getVendorById(id);
		attr.addFlashAttribute("vendor", vendor);
		return "redirect:/common/vendor";
	}
	
	@PostMapping("/addNupdateVendor")
    public String handleSbmtBtn(VendorModel vendor, RedirectAttributes attr) {
    	String result = commonService.addOrUpdateVendor(vendor);
    	System.out.println("CommonController.handleSbmtBtn()");
    	if(result != null)
    		attr.addFlashAttribute("success_msg", result);
    	else 
    		attr.addFlashAttribute("error_msg", "Failed to add Vendor.");
    	
    	return "redirect:/common/vendor";
    }
	
	@ResponseBody
	@GetMapping("/distsByStateId")
	public Map<Long, String> getDistsByStateId(@RequestParam("stateId") Long stateId, Model model) {
		
		return commonService.getDistByStateId(stateId);
	}
	
	@GetMapping("/reward")
	public String rewardPage() {
		
		return"site.addReward";
	}
	
	@GetMapping("/financialYr")
	public String finYrPage(Model model) {
		model.addAttribute("finList", commonService.getAllFinYr());
		return"site.addFinancialYr";
	}
	
	@PostMapping("/finYrSaveNupdate")
	public String saveFinyr(FinancialYearModel fm,RedirectAttributes attr) {
		String result = commonService.saveFinancialYr(fm);
		attr.addFlashAttribute("success_msg", result);
		return"redirect:/common/financialYr";
	}
	
	@GetMapping("/finYrEdit")
	public String finYrEdit(@RequestParam("id")Long id,RedirectAttributes attr) {
		attr.addFlashAttribute("finYrMdl", commonService.getFinancialYearModel(id));
		return"redirect:/common/financialYr";
	}
}
