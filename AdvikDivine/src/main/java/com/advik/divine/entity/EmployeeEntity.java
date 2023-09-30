package com.advik.divine.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;

@Data
@Entity
@Table(name = "advik_employee", schema = "advik")
public class EmployeeEntity {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "emp_id")
    private Long empId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "designation")
    private String designation;
    
    @Column(name = "contact_no", nullable = false)
    private Long contactNo;

    @ManyToOne
    @JoinColumn(name = "block_id")
    private Block block;
    
    @Column(name = "village")
    private String village;
    
    @Column(name = "mail_id")
    private String mail;

    @Column(name = "pin")
    private Long pin;

    @Column(name = "is_active")
    private Boolean isActive;
    
    @Column(name="created_by")
	private Long createdBy;

	@Temporal(TemporalType.DATE)
	@CreationTimestamp
	@Column(name="created_on",updatable = false)
	private Date createdOn;
	
	@Column(name="updated_by")
	private Long updatedBy;
	
	@Temporal(TemporalType.DATE)
	@UpdateTimestamp
	@Column(name="updated_on",insertable = false)
	private Date updatedOn;
	
	@Column(name = "salary")
    private Double salary;

    @Column(name = "joining_date")
    private Date joinDate;

    @Column(name = "resign_date")
    private Date resignDate;

    @Column(name = "aadhaar")
    private String aadhaar;

    @Column(name = "photo")
    private String photo;
	
}
