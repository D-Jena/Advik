package com.advik.divine.service;

import java.util.List;

import com.advik.divine.model.EmployeeModel;

public interface EmployeeService {

	String addOrUpdateEmployee(EmployeeModel em);
	
	List<EmployeeModel> getAllEmployee();
	
	EmployeeModel getEmployeeById(Long id);
	
}
