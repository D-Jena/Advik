package com.advik.divine.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.advik.divine.entity.VillageEntity;

@Repository
public interface VillageRepository extends JpaRepository<VillageEntity, Long>{

	Optional<VillageEntity> findByVillageName(String villageName);
}
