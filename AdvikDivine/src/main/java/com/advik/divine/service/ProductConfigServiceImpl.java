package com.advik.divine.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.advik.divine.entity.ProductTypeConfig;
import com.advik.divine.exception.AdvikDivineException;
import com.advik.divine.repository.ProductTypeConfigRepository;

@Service
public class ProductConfigServiceImpl implements ProductConfigService{

	@Autowired
	private ProductTypeConfigRepository ptcRepo;
	
	@Override
	public String saveproductType(ProductTypeConfig ptc) {
		String msg = "";
		try {
			if(Optional.ofNullable(ptc.getProdTypeId()).isEmpty()) {
				ptcRepo.save(ptc);
				msg="Saved Successfully";
			}else {
				ptcRepo.save(ptc);
				msg ="Update Successfully";
			}
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			throw new AdvikDivineException("Product Type Configuration");
		}
	}
	
	@Override
	public List<ProductTypeConfig> getAllProductType() {
		List<ProductTypeConfig> findAll = ptcRepo.findAll();
		return findAll;
	}
	
	@Override
	public ProductTypeConfig getProductType(Long id) {
		return ptcRepo.findById(id).get();
	}
	
	@Override
	public String checkDuplicateType(String type) {
		ProductTypeConfig findByProdType = ptcRepo.findByProdType(type);
		return Optional.ofNullable(findByProdType).isPresent()?"Yes":"No";
	}

}
