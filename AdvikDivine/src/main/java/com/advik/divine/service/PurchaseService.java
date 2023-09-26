package com.advik.divine.service;

import java.util.List;

import com.advik.divine.model.PurchaseEntryModel;

public interface PurchaseService {

	String savePurchaseEntry(PurchaseEntryModel pem);
	List<PurchaseEntryModel> getAllPurchaseHistory();
	

}
