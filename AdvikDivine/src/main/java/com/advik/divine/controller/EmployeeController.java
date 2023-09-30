package com.advik.divine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.advik.divine.model.EmployeeModel;
import com.advik.divine.service.BlockService;
import com.advik.divine.service.CommonService;
import com.advik.divine.service.DistrictService;
import com.advik.divine.service.EmployeeService;

@Controller
@RequestMapping("/emp")
public class EmployeeController {
	
	@Autowired
	private CommonService commonService;
	@Autowired
	private DistrictService distService;
	@Autowired
	private BlockService blockService;
	@Autowired
	private EmployeeService empService;

	@GetMapping("/employee")
	public String employeePage(Model model) {
		model.addAttribute("stateList", commonService.getAllState());
    	model.addAttribute("employeeList", empService.getAllEmployee());
    	model.addAttribute("distList", distService.getAllDist());
    	model.addAttribute("blockList", blockService.getAllBlocks());
		return"site.addEmployee";
	}
	
	@GetMapping("/employeeEdit")
	public String employeeEdit(@RequestParam("id") Long id,RedirectAttributes attr) {
    	EmployeeModel employee = empService.getEmployeeById(id);
		attr.addFlashAttribute("employee", employee);
		return "redirect:/emp/employee";
	}
	
	@PostMapping("/addNupdateEmployee")
    public String handleSbmtBtn(EmployeeModel employee, RedirectAttributes attr) {
    	String result = empService.addOrUpdateEmployee(employee);
    	System.out.println("empController.handleSbmtBtn()");
    	if(result != null)
    		attr.addFlashAttribute("success_msg", result);
    	else 
    		attr.addFlashAttribute("error_msg", "Failed to add employee.");
    	
    	return "redirect:/emp/employee";
    }
	
}
