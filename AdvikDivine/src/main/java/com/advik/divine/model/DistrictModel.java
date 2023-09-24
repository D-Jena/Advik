package com.advik.divine.model;

import lombok.Data;

@Data
public class DistrictModel {
	private Long distId;
	private String distName;
	private String distCode;
	private String stateName;
	private Long StateId;
	private Boolean isActive;

}
