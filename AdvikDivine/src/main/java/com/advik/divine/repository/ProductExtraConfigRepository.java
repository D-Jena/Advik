package com.advik.divine.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.advik.divine.entity.ProductExtraConfigEntity;

public interface ProductExtraConfigRepository extends JpaRepository<ProductExtraConfigEntity, Long> {

	Optional<ProductExtraConfigEntity> findByConfigTypeProdTypeId(Long id);

}
