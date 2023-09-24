package com.advik.divine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductPurchaseController {

	
	
	@GetMapping("/")
	public String productConfigPage(Model model) {
		return"site.productHome";
	}
	
	@GetMapping("/brand")
	public String productConfig(Model model) {
		
		return"site.brandConfig";
	}
}
