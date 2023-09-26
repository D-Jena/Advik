package com.advik.divine.model;


import lombok.Data;

@Data
public class VillageModel {
	
	private Long villageId;
	private String villageName;
	private Boolean isActive;
	private Long blockId;
	private String blockName;
	private Long distId;
	private String distName;
	private BlockModel blockModel;
}
