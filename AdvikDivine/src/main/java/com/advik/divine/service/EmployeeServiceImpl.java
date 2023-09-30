package com.advik.divine.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.advik.divine.entity.EmployeeEntity;
import com.advik.divine.exception.AdvikDivineException;
import com.advik.divine.model.BlockModel;
import com.advik.divine.model.EmployeeModel;
import com.advik.divine.repository.BlockRepository;
import com.advik.divine.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private BlockRepository blockRepo;
	@Autowired
	private EmployeeRepository empRepo;

	@Override
	public String addOrUpdateEmployee(EmployeeModel eModel) {
		String result = "";
		EmployeeEntity eEntity =new EmployeeEntity();
		eEntity.setBlock(blockRepo.findById(eModel.getBlock().getBlockId()).get());
		if(Optional.ofNullable(eModel.getEmpId()).isEmpty()) {
			//add Employee
			BeanUtils.copyProperties(eModel, eEntity);
			result="Employee Saved successfully with name - "+eEntity.getName();
		}else {
			//update Employee
			BeanUtils.copyProperties(eModel, eEntity);
			result="Employee Updated successfully with name - "+eEntity.getName();
		}
		empRepo.save(eEntity);
		
		return result;
	}

	@Override
	public List<EmployeeModel> getAllEmployee() {
		try {
			List<EmployeeEntity> employeeList = empRepo.findAll();
			return employeeList.stream().map(emp -> {
				EmployeeModel eModel = new EmployeeModel();
				BlockModel bm = new BlockModel();
				eModel.setBlock(bm);
				BeanUtils.copyProperties(emp, eModel);
				BeanUtils.copyProperties(emp.getBlock(), eModel.getBlock());
				return eModel;
			}).collect(Collectors.toList());
		} catch (Exception e) {
			e.printStackTrace();
			throw new AdvikDivineException("Get all Employee error.");
		}//try-catch
	}
	
	@Override
	public EmployeeModel getEmployeeById(Long id) {
		try {
			Optional<EmployeeEntity> optional= empRepo.findById(id);
			EmployeeModel eModel = new EmployeeModel();
			if(optional.isPresent()) {
				BeanUtils.copyProperties(optional.get(), eModel);
			}
			return eModel;
		} catch (Exception e) {
			e.printStackTrace();
			throw new AdvikDivineException("get Employee error");
		}
		
	}

}
