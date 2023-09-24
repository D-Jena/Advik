package com.advik.divine.service;

import java.util.List;

import com.advik.divine.entity.ProductTypeConfig;

public interface ProductConfigService {

	String saveproductType(ProductTypeConfig ptc);

	List<ProductTypeConfig> getAllProductType();

	ProductTypeConfig getProductType(Long id);

	String checkDuplicateType(String type);

}
