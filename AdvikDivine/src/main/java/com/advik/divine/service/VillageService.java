package com.advik.divine.service;

import java.util.List;

import com.advik.divine.model.VillageModel;

public interface VillageService {

	String saveNupdateVillage(VillageModel vm);

	VillageModel getVillageModel(Long id);

	String checkVillagePresent(String villageName);

	List<VillageModel> getAllVillage();

}
