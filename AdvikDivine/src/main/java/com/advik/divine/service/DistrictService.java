package com.advik.divine.service;

import java.util.List;

import com.advik.divine.model.DistrictModel;

public interface DistrictService {

	List<DistrictModel> getAllDist();

	String saveNupdade(DistrictModel dm);

	DistrictModel getDistrictModel(Long id);

	String checkDistPresent(String distNameAndCode);

}
