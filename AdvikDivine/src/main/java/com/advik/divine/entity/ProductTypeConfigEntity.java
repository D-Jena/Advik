package com.advik.divine.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;

@Data
@Entity
@Table(name="product_type_config",schema="advik")
public class ProductTypeConfigEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ptype_id")
	private Long prodTypeId;
	
	@Column(name="prod_type")
	private String prodType;
	
	@Column(name="prod_code")
	private String prodCode;
	
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
