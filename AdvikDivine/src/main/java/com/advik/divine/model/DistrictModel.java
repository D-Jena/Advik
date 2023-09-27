package com.advik.divine.model;

import lombok.Data;

@Data
public class DistrictModel {
	private Long distId;
	private String distName;
	private String stateName;
	private String distCode;
	private StateModel state;
	private Long StateId;
	private Boolean isActive;

}
