package com.advik.divine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sale")
public class SaleController {

	@GetMapping("/")
	public String salePage(Model model) {
		
		return"site.addSale";
	}
}
