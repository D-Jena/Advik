package com.advik.divine.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.advik.divine.entity.FinancialYear;
import com.advik.divine.entity.StateEntity;
import com.advik.divine.entity.VendorEntity;
import com.advik.divine.exception.AdvikDivineException;
import com.advik.divine.model.FinancialYearModel;
import com.advik.divine.model.StateModel;
import com.advik.divine.model.VendorModel;
import com.advik.divine.repository.DistrictRepository;
import com.advik.divine.repository.FinancialYearRepository;
import com.advik.divine.repository.StateRepository;
import com.advik.divine.repository.VendorRepository;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired
	private FinancialYearRepository finRepo;
	@Autowired
	private StateRepository stateRepo;
	@Autowired
	private DistrictRepository distRepo;
	@Autowired
	private VendorRepository vendorRepo;
	
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-YYYY");
	
	@Override
	public String saveFinancialYr(FinancialYearModel fm) {
		String msg = "";
		FinancialYear fy = new FinancialYear();;
		try {
			Date sDate = sdf.parse(fm.getStartDate());
			Date eDate = sdf.parse(fm.getEndDate());
			if(Optional.ofNullable(fm.getFinancialYearId()).isEmpty()) {
				fy.setFinancialYear(fm.getFinancialYear());
				fy.setStartDate(sDate);
				fy.setEndDate(eDate);
				fy.setIsActive(fm.getIsActive());
				msg="Save Successfully";
			}else {
				fy.setFinancialYearId(fm.getFinancialYearId());
				fy.setFinancialYear(fm.getFinancialYear());
				fy.setStartDate(sDate);
				fy.setEndDate(eDate);
				fy.setIsActive(fm.getIsActive());
				msg="Update Successfully";
			}
			finRepo.save(fy);
			return msg;
		} catch (ParseException e) {
			e.printStackTrace();
			throw new AdvikDivineException("Financial Year ServiceImpl");
		}
	}
	
	@Override
	public List<FinancialYearModel> getAllFinYr() {
		List<FinancialYear> finList = finRepo.findAll();
		List<FinancialYearModel> fmList = new ArrayList<>();
		finList.forEach(fy -> {
			FinancialYearModel fm = new FinancialYearModel();
			fm.setFinancialYearId(fy.getFinancialYearId());
			fm.setFinancialYear(fy.getFinancialYear());
			fm.setStartDate(sdf.format(fy.getStartDate()));
			fm.setEndDate(sdf.format(fy.getEndDate()));
			fm.setIsActive(fy.getIsActive());
			fmList.add(fm);
		});
		return fmList;
	}
	
	@Override
	public FinancialYearModel getFinancialYearModel(Long id) {
		FinancialYear fy = finRepo.findById(id).get();
		FinancialYearModel fm = new FinancialYearModel();
		fm.setFinancialYearId(fy.getFinancialYearId());
		fm.setFinancialYear(fy.getFinancialYear());
		fm.setStartDate(sdf.format(fy.getStartDate()));
		fm.setEndDate(sdf.format(fy.getEndDate()));
		fm.setIsActive(fy.getIsActive());
		return fm;
	}

	@Override
	public String addOrUpdateVendor(VendorModel vendorModel) {
		String result = "";
		VendorEntity vendorEntity =new VendorEntity();
		vendorEntity.setDistrict(distRepo.findById(vendorModel.getDistId()).get());
		vendorEntity.setState(stateRepo.findById(vendorModel.getStateId()).get());
		if(Optional.ofNullable(vendorModel.getVendorId()).isEmpty()) {
			//add vendor
			BeanUtils.copyProperties(vendorModel, vendorEntity);
			result="Vendor Saved successfully with name - "+vendorEntity.getVendorName();
		}else {
			//update vendor
			BeanUtils.copyProperties(vendorModel, vendorEntity);
			result="Vendor Updated successfully with name - "+vendorEntity.getVendorName();
		}
		vendorRepo.save(vendorEntity);
		
		return result;
	}

	@Override
	public List<VendorModel> getAllVendor() {
		
		return null;
	}

	@Override
	public List<StateModel> getAllState() {
		try {
			List<StateEntity> entities = stateRepo.findAll();
			return entities.stream().map(entity -> {
				StateModel stateModel = new StateModel();
				BeanUtils.copyProperties(entity, stateModel);
				return stateModel;
			}).collect(Collectors.toList());
		} catch (Exception e) {
			e.printStackTrace();
			throw new AdvikDivineException("failed to get all State.");
		}
	}
	
	@Override
	public Map<Long, String> getDistByStateId(Long stateId) {

		Map<Long, String> map = new LinkedHashMap<Long, String>();
		Optional<StateEntity> stateOptional = stateRepo.findById(stateId);

		if (stateOptional.isPresent()) {
			StateEntity stateEntity = stateOptional.get();

			stateEntity.getDistricts().forEach(dist -> {
				map.put(dist.getDistId(), dist.getDistName());
			});
			return map;
		}
		return map;
	}
	
}
