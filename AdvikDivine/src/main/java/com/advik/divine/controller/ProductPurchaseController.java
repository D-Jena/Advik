package com.advik.divine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.advik.divine.model.PurchaseEntryModel;
import com.advik.divine.service.CommonService;
import com.advik.divine.service.ProductConfigService;
import com.advik.divine.service.PurchaseService;

@Controller
@RequestMapping("/product")
public class ProductPurchaseController {
	
	@Autowired
	private ProductConfigService productConfigService;
	
	@Autowired
	private PurchaseService purchaseService; 
	
	@Autowired
	private CommonService commonService;
	
	
	@GetMapping("/")
	public String productConfigPage(Model model) {
		model.addAttribute("prodTypeList", productConfigService.getAllProductType());
		model.addAttribute("vendorList", commonService.getAllVendor());
		return"site.productHome";
	}
	
	@PostMapping("/")
	public String productConfig(PurchaseEntryModel pem ,RedirectAttributes attr) {
		String result = purchaseService.savePurchaseEntry(pem);
		return"redirect:/product";
	}
}
