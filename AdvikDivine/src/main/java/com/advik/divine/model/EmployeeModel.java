package com.advik.divine.model;

import java.util.Date;

import lombok.Data;

@Data
public class EmployeeModel {

	private Long empId;
    private String name;
    private String designation;
    private Long contactNo;
    private BlockModel block;
    private String village;
    private String mail;
    private Long pin;
    private Boolean isActive;
    private Long createdBy;
    private Date createdOn;
    private Long updatedBy;
    private Date updatedOn;
    private Double salary;
    private Date joinDate;
    private Date resignDate;
    private String aadhaar;
    private String photo;

	
}
