package com.advik.divine.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.advik.divine.entity.Block;
import com.advik.divine.exception.AdvikDivineException;
import com.advik.divine.model.BlockModel;
import com.advik.divine.model.DistrictModel;
import com.advik.divine.repository.BlockRepository;
import com.advik.divine.repository.DistrictRepository;

@Service
public class BlockServiceImpl implements BlockService {

	@Autowired
	private BlockRepository blockRepo;
	
	@Autowired
	private DistrictRepository distRepo;
	
	@Override
	public String addBlock(BlockModel blockModel) {
		String result = "";
		Block blockEntity =new Block();
		if(Optional.ofNullable(blockModel.getBlockId()).isEmpty()) {
			//add block
			BeanUtils.copyProperties(blockModel, blockEntity);
			blockEntity.setDistrict(distRepo.findById(blockModel.getDistId()).get());
			result="Block Saved successfully with Block Code - "+blockEntity.getBlockCode();
		}else {
			//update block
			BeanUtils.copyProperties(blockModel, blockEntity);
			blockEntity.setDistrict(distRepo.findById(blockModel.getDistId()).get());
			result="Block Updated successfully with Block Code - "+blockEntity.getBlockCode();
		}
		blockRepo.save(blockEntity);
		
		return result;
	}

	@Override
	public List<BlockModel> getAllBlocks() {
		try {
			List<Block> entities = blockRepo.findAll();
			return entities.stream().map(entity -> {
				BlockModel blockModel = new BlockModel();
				DistrictModel dm = new DistrictModel();
				BeanUtils.copyProperties(entity.getDistrict(), dm);
				BeanUtils.copyProperties(entity, blockModel);
				blockModel.setDistrictModel(dm);
				return blockModel;
			}).collect(Collectors.toList());
		} catch (Exception e) {
			e.printStackTrace();
			throw new AdvikDivineException("failed to get all blocks");
		}
	}
	
	public String getBlockByBlockCode(String blockCode) {
		Optional<Block> optional = blockRepo.findByBlockCode(blockCode);
		if (optional.isPresent()) {
			return "yes";
		}
		return "no";
	}

	@Override
	public String getBlockByBlockName(String blockName) {
		Optional<Block> optional = blockRepo.findByBlockName(blockName);
		if (optional.isPresent()) {
			return "yes";
		}
		return "no";
	}

	public List<BlockModel> getBlocksByDistId(Long distId) {
		try {
			List<Block> entities = blockRepo.findAllByDistrictDistId(distId);
			return entities.stream().map(entity -> {
				BlockModel blockModel = new BlockModel();
				BeanUtils.copyProperties(entity, blockModel);
				return blockModel;
			}).collect(Collectors.toList());
		} catch (Exception e) {
			throw new AdvikDivineException("get Blocks By DistID getting error");
		}
	}

}
