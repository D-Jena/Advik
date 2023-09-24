package com.advik.divine.model;

import com.advik.divine.entity.StateEntity;

import lombok.Data;

@Data
public class VendorModel {
    private Long vendorId;
    private String vendorName;
    private String vendorType;
    private Long mobile;
    private StateEntity state;
    private Long stateId;
    private DistrictModel district;
    private Long distId;
    private String area;
    private String landmark;
    private Long pin;
    private String isActive;
}

