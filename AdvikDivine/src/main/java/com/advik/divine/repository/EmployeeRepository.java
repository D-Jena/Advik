package com.advik.divine.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.advik.divine.entity.EmployeeEntity;

public interface EmployeeRepository extends JpaRepository<EmployeeEntity, Serializable> {

}
