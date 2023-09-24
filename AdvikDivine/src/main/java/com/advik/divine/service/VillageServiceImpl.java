package com.advik.divine.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.advik.divine.entity.Block;
import com.advik.divine.entity.VillageEntity;
import com.advik.divine.exception.AdvikDivineException;
import com.advik.divine.model.VillageModel;
import com.advik.divine.repository.BlockRepository;
import com.advik.divine.repository.VillageRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class VillageServiceImpl implements VillageService{

	@Autowired
	private VillageRepository villageRepository; 
	
	@Autowired
	private BlockRepository blockRepository;
	
	@Override
	public String saveNupdateVillage(VillageModel vm) {
		String result = "";
		VillageEntity v =null;
		try {
			Optional<Block> block = blockRepository.findById(vm.getBlockId());
			if(Optional.ofNullable(vm.getVillageId()).isEmpty() && block.isPresent()) {
				v = new VillageEntity();
				BeanUtils.copyProperties(vm, v);
				v.setBlock(block.get());
				result="Village Save Successfully .";
			}else {
				//update case
				Optional<VillageEntity> vlg = villageRepository.findById(vm.getVillageId());
				v = vlg.get();
				BeanUtils.copyProperties(vm, v);
				result="Villaage Update Successfully .";
			}
			villageRepository.save(v);
			return result;
		} catch (Exception e) {
			log.error("VillageSserviceImpl -> saveNupdateVillage()");
			e.printStackTrace();
			throw new AdvikDivineException("Save Or Update Error");
		}
	}

	@Override
	public List<VillageModel> getAllVillage() {
		try {
			List<VillageEntity> vlgList = villageRepository.findAll();
			return vlgList.stream().map(vlg -> {
				VillageModel vm = new VillageModel();
				BeanUtils.copyProperties(vlg, vm);
				return vm;
			}).collect(Collectors.toList());
		} catch (Exception e) {
			log.error("VillageSserviceImpl -> getAllVillage()");
			e.printStackTrace();
			throw new AdvikDivineException("get all village error");
		}
	}
	
	@Override
	public VillageModel getVillageModel(Long id) {
		try {
			Optional<VillageEntity> vlg = villageRepository.findById(id);
			VillageModel vm = new VillageModel();
			if(vlg.isPresent()) {
				BeanUtils.copyProperties(vlg.get(), vm);
				vm.setDistId(vlg.get().getBlock().getDistrict().getDistId());
			}
			return vm;
		} catch (Exception e) {
			log.error("VillageSserviceImpl -> getVillageModel()");
			e.printStackTrace();
			throw new AdvikDivineException("get all village error");
		}
	}

	@Override
	public String checkVillagePresent(String villageName) {
		// TODO Auto-generated method stub
		return null;
	}

}
