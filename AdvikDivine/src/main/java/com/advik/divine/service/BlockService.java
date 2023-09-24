package com.advik.divine.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.advik.divine.model.BlockModel;

@Service
public interface BlockService {

    String addBlock(BlockModel blockModel);

    List<BlockModel> getAllBlocks();

	List<BlockModel> getBlocksByDistId(Long distId);
    
    String getBlockByBlockCode(String blockCode);

	String getBlockByBlockName(String blockName);

}

