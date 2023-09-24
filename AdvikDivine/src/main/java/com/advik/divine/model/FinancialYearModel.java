package com.advik.divine.model;

import lombok.Data;

@Data
public class FinancialYearModel {

	private Long financialYearId;
	private String financialYear;
	private String startDate;
	private String endDate;
	private Boolean isActive;
	
}
