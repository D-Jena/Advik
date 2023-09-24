package com.advik.divine.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.advik.divine.entity.District;

public interface DistrictRepository extends JpaRepository<District,Long> {

	District findByDistNameOrDistCode(String distName,String distCode);

}
