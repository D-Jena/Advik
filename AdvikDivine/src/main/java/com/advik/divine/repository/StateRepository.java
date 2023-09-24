package com.advik.divine.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.advik.divine.entity.StateEntity;

public interface StateRepository extends JpaRepository<StateEntity, Serializable> {

}
