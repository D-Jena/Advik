package com.advik.divine.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.advik.divine.entity.ProductTypeConfig;

public interface ProductTypeConfigRepository extends JpaRepository<ProductTypeConfig, Long>{

	ProductTypeConfig findByProdType(String type);

}
