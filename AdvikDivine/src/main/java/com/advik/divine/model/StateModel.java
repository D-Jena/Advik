package com.advik.divine.model;

import java.util.List;

import com.advik.divine.entity.District;

import lombok.Data;

@Data
public class StateModel {
    private Long stateId;
    private String stateName;
    private String stateCode;
    private String isActive;
    private List<District> districts;
}


