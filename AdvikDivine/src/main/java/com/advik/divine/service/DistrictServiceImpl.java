package com.advik.divine.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.advik.divine.entity.District;
import com.advik.divine.model.DistrictModel;
import com.advik.divine.repository.DistrictRepository;

@Service
public class DistrictServiceImpl implements DistrictService {

	@Autowired
	private DistrictRepository districtRepository;
	
	@Override
	public String saveNupdade(DistrictModel dm) {
		String result = "";
		District d =null;
		if(Optional.ofNullable(dm.getDistId()).isEmpty()) {
			d = new District();
			BeanUtils.copyProperties(dm, d);
			result="District Save Successfully .";
		}else {
			//update case
			Optional<District> dist = districtRepository.findById(dm.getDistId());
			d = dist.get();
			BeanUtils.copyProperties(dm, d);
			result="District Update Successfully .";
		}
		districtRepository.save(d);
		
		return result;
	}
	
	@Override
	public List<DistrictModel> getAllDist() {
		List<DistrictModel> list = new ArrayList<>();
		List<District> distList = districtRepository.findAll();
		distList.forEach(dl -> {
			DistrictModel dm = new DistrictModel();
			dm.setDistCode(dl.getDistCode());
			dm.setDistId(dl.getDistId());
			dm.setDistName(dl.getDistName());
			dm.setIsActive(dl.getIsActive());
			dm.setStateName(dl.getStateName());
			list.add(dm);
		});
		return list;
	}

	@Override
	public DistrictModel getDistrictModel(Long id) {
		DistrictModel dm = new DistrictModel();
		if(id != null) {
			Optional<District> dist = districtRepository.findById(id);
			if(dist.isPresent()) {
				BeanUtils.copyProperties(dist.get(), dm);
			}
		}
		return dm;
	}
	
	@Override
	public String checkDistPresent(String distNameAndCode) {
		String result="";
		District d = districtRepository.findByDistNameOrDistCode(distNameAndCode,distNameAndCode);
		if(Optional.ofNullable(d).isPresent()) {
			result="Present";
		}
		return result;
	}
	
	
}
