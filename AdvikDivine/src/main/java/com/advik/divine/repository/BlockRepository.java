package com.advik.divine.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.advik.divine.entity.Block;

public interface BlockRepository extends JpaRepository<Block, Long> {
	
	Optional<Block> findByBlockCode(String blockCode);

	Optional<Block> findByBlockName(String blockName);
	
	List<Block> findAllByDistrictDistId(Long distId);

}
