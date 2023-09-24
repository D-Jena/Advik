package com.advik.divine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cust")
public class CustomerController {

	@GetMapping("/")
	public String custPage(Model model) {
		
		return "site.addCustomer";
	}
}
