package com.advik.divine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.advik.divine.model.BlockModel;
import com.advik.divine.model.DistrictModel;
import com.advik.divine.model.VillageModel;
import com.advik.divine.service.BlockService;
import com.advik.divine.service.DistrictService;
import com.advik.divine.service.VillageService;

@Controller
@RequestMapping("/mst")
public class MasterController {

	@Autowired
	private DistrictService districtService;
	
	@Autowired
	private VillageService villageService;
	
	@Autowired
	private BlockService blockService;
	
	@GetMapping("/dist")
	public String districtPage(Model model) {
		model.addAttribute("distlst", districtService.getAllDist());
		return "site.addDistrict";
	}
	@PostMapping("/addNupdate")
	public String saveDist(@ModelAttribute("DistrictModel") DistrictModel dm, RedirectAttributes attr) {
		String result = districtService.saveNupdade(dm);
		attr.addFlashAttribute("success_msg",result);
		return "redirect:/mst/dist";
	}

	@GetMapping("/distEdit")
	public String districtEdit(@RequestParam("id") Long id,RedirectAttributes attr) {
		attr.addFlashAttribute("dm", districtService.getDistrictModel(id));
		return "redirect:/mst/dist";
	}
	
	@GetMapping("/checkDistNameAndCode")
	public @ResponseBody String checkDist(@RequestParam("distNameAndCode") String distNameAndCode) {
		return districtService.checkDistPresent(distNameAndCode);
	}
	
    @GetMapping("/addBlock")
    public String addBlock(Model model) {
    	model.addAttribute("distList", districtService.getAllDist());
    	model.addAttribute("blockList", blockService.getAllBlocks());
    	return "site.addBlock";
    }
    
    @PostMapping("/addNupdateBlock")
    public String handleSbmtBtn(BlockModel blockModel, RedirectAttributes attr) {
    	String result = blockService.addBlock(blockModel);
    	if(result != null)
    		attr.addFlashAttribute("success_msg", result);
    	else 
    		attr.addFlashAttribute("error_msg", "Failed to add block.");
    	
    	return "redirect:/mst/addBlock";
    }

    @GetMapping("/validateUniqueBlockCode")
	@ResponseBody
	public String validateUniqueBlockCode(@RequestParam("blockCode") String blockCode) {
		return blockService.getBlockByBlockCode(blockCode);
	}
    
    @GetMapping("/validateUniqueBlockName")
	@ResponseBody
	public String validateUniqueBlockName(@RequestParam("blockName") String blockName) {
		return blockService.getBlockByBlockName(blockName);
    }
    
	@GetMapping("/village")
    public String villagePage(Model model) {
    	model.addAttribute("villageList", villageService.getAllVillage());
    	model.addAttribute("distlist", districtService.getAllDist());
    	return"site.addVillage";
    }
    
    @PostMapping("/saveNupdateVillage")
    public String saveVillage(VillageModel vm,RedirectAttributes attr) {
    	String result = villageService.saveNupdateVillage(vm);
    	attr.addFlashAttribute("success_msg",result);
    	return"redirect:/mst/village";
    }
    
    @GetMapping("/villageEdit")
	public String villageEdit(@RequestParam("id") Long id,RedirectAttributes attr) {
    	VillageModel v = villageService.getVillageModel(id);
		attr.addFlashAttribute("villageData", v);
		attr.addFlashAttribute("blockList", blockService.getBlocksByDistId(v.getDistId()));
		return "redirect:/mst/village";
	}
	
	@GetMapping("/checkVillageName")
	public @ResponseBody String checkVillage(@RequestParam("villageName") String villageName) {
		return villageService.checkVillagePresent(villageName);
	}
	
	@GetMapping("/blockList")
	public @ResponseBody List<BlockModel> blockList(@RequestParam("distId") Long distId) {
		return blockService.getBlocksByDistId(distId);
	}
	
}

