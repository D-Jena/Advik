package com.advik.divine.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="product_extra_config",schema="advik")
public class ProductExtraConfigEntity {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="config_id")
	private Long configId;
	
	@ManyToOne
	@JoinColumn(name="product_type_id")
	private ProductTypeConfigEntity configType;
	
	@Column(name="color_name")
	private String colorName;
	
	@Column(name="product_size")
	private String productSize;
	
	@Column(name="is_active")
	private Boolean isActive;
	
	
}
