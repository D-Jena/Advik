package com.advik.divine.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.advik.divine.entity.PurchaseEntryEntity;

public interface PurchaseEntryRepository extends JpaRepository<PurchaseEntryEntity, Long> {

}
