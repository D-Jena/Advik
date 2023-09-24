package com.advik.divine.model;

import lombok.Data;

@Data
public class BlockModel {

    private Long blockId;

    private String blockName;

    private String blockCode;

    private Boolean isActive;

    private Long distId;
    
    private DistrictModel districtModel;

}

