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
@Table(name="t_mst_district",schema="advik")
public class District {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="dist_id")
	private Long distId;
	
	@Column(name="dist_name")
	private String distName;
	
	@Column(name="dist_code")
	private String distCode;
	
	@Column(name="state_name")
	private String stateName;
	
	@ManyToOne
	@JoinColumn(name = "state_id")	    
	private StateEntity state;	 
	
	@Column(name="is_active")
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
	
}
