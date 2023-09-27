package com.advik.divine.service;

import java.util.List;
import java.util.Map;

import com.advik.divine.model.FinancialYearModel;
import com.advik.divine.model.StateModel;
import com.advik.divine.model.VendorModel;

public interface CommonService {

	String saveFinancialYr(FinancialYearModel fm);

	List<FinancialYearModel> getAllFinYr();

	FinancialYearModel getFinancialYearModel(Long id);
	
	String addOrUpdateVendor(VendorModel vm);
	
	List<VendorModel> getAllVendor();
	
	VendorModel getVendorById(Long id);

	List<StateModel> getAllState();

	Map<Long, String> getDistByStateId(Long stateId);

}
