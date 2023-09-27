package com.advik.divine.model;

import lombok.Data;

@Data
public class VendorModel {
    private Long vendorId;
    private String vendorName;
    private String vendorType;
    private Long mobile;
    private StateModel state;
    private Long stateId;
    private DistrictModel district;
    private Long distId;
    private String area;
    private String landmark;
    private Long pin;
    private String isActive;
}

