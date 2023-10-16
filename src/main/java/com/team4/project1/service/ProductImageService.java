package com.team4.project1.service;

import java.util.List;

import com.team4.project1.domain.ProductImageVO;

public interface ProductImageService {
	/* 이미지 데이터 반환 */
	public List<ProductImageVO> getImageList(Long p_no);
}
