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
@Table(name="t_mst_purchase", schema="advik")
public class PurchaseEntryEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="purchase_id")
	private Long purchaseId;
	
	@Column(name="brand_name")
	private String brandName;
	
	@Column(name="product_type")
	private String type;
	
	@Column(name="product_code")
	private String productCode;
	
	@Column(name="color")
	private String color;
	
	@Column(name="product_size")
	private String size;
	
	@Column(name="price_per_unit")
	private Double price;
	
	@Column(name="quantity")
	private Integer quantity;
	
	@Column(name="total_price")
	private Double totalPrice;
	
	@Column(name="discount")
	private Integer discount;
	
	@Column(name="final_price")
	private Double finalPrice;
	
//	@ManyToOne
//	@JoinColumn(name="vendor_id")
//	private VendorEntity VendorEntity;
	
	@Column(name="purchase_date")
	private String purchaseDate;
	
	@ManyToOne
	@JoinColumn(name="product_type_id")
	private ProductTypeConfigEntity prodTypeId;
	
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
}
