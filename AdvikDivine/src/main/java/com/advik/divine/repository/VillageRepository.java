package com.advik.divine.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.advik.divine.entity.VillageEntity;

@Repository
public interface VillageRepository extends JpaRepository<VillageEntity, Long>{

}
