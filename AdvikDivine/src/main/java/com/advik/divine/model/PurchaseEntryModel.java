package com.advik.divine.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PurchaseEntryModel {

	private Long purchaseId;
	private Long prodTypeId;
	private String brandName;
	private String type;
	private String productCode;
	private String color;
	private String size;
	private Double price;
	private Integer quantity;
	private Double totalPrice;
	private Double discount;
	private Double finalPrice;
	private Long vendorId;
	private String purchaseDate;
	
	List<PurchaseEntryModel> PurchaseEntryModelList = new ArrayList<>();
	
}
