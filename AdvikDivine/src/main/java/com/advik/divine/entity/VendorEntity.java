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
@Table(name = "vendor", schema = "advik")
public class VendorEntity {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long vendorId;

    @Column(name = "name", nullable = false)
    private String vendorName;

    @Column(name = "type", nullable = false)
    private String vendorType;
    
    @Column(name = "mobile", nullable = false)
    private Long mobile;

    @ManyToOne
    @JoinColumn(name = "state_id")
    private StateEntity state;

    @ManyToOne
    @JoinColumn(name = "dist_id")
    private District district;
    
    @Column(name = "area")
    private String area;
    
    @Column(name = "landmark")
    private String landmark;

    @Column(name = "pin")
    private Long pin;

    @Column(name = "is_active")
    private String isActive;
    
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
