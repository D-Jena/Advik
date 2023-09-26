package com.advik.divine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.advik.divine.entity.ProductTypeConfig;
import com.advik.divine.service.ProductConfigService;

/*
 * This controller is meant for how many variety of product is maintained
 * 
 * */

@Controller
@RequestMapping("/prodConfig")
public class ProductConfigController {

	@Autowired
	private ProductConfigService productConfigService;
	
	@GetMapping("/")
	public String productConfigPage(Model model) {
		model.addAttribute("prodTypeList", productConfigService.getAllProductType());
		return"site.productConfig";
	}
	
	@PostMapping("/saveTypeConfig")
	public String saveNupdateProductTypeConfig(ProductTypeConfig ptc,RedirectAttributes attr) {
		String result = productConfigService.saveproductType(ptc);
		attr.addFlashAttribute("success_msg", result);
		return"redirect:/prodConfig/";
	}
	
	@GetMapping("/editProductType/{id}")
	public String editProductType(@PathVariable("id")Long id,RedirectAttributes attr) {
		attr.addFlashAttribute("prodTypeCnfg", productConfigService.getProductType(id));
		return"redirect:/prodConfig/";
	}
	
	@GetMapping("/checkDuplicateProdType")
	public @ResponseBody String checkDuplicateProdType(@RequestParam("type")String type) {
		return productConfigService.checkDuplicateType(type);
	}
	
	@GetMapping("/config")
	public String brandConfigPage(Model model) {
		model.addAttribute("prodTypeList", productConfigService.getAllProductType());
		return"site.productConfiguration";
	}
	@PostMapping("/saveConfig")
	public String saveNupdateBrand(ProductTypeConfig ptc,RedirectAttributes attr) {
		String result = productConfigService.saveproductType(ptc);
		attr.addFlashAttribute("success_msg", result);
		return"redirect:/prodConfig/";
	}
	
	@GetMapping("/editConfig/{id}")
	public String editBrand(@PathVariable("id")Long id,RedirectAttributes attr) {
		attr.addFlashAttribute("prodTypeCnfg", productConfigService.getProductType(id));
		return"redirect:/prodConfig/";
	}
	
	@GetMapping("/checkDuplicateConfig")
	public @ResponseBody String checkDuplicateBrand(@RequestParam("type")String type) {
		return productConfigService.checkDuplicateType(type);
	}
	
}
