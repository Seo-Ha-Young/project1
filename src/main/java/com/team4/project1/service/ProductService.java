package com.team4.project1.service;

import java.util.List;

import com.team4.project1.domain.ProductImageVO;
import com.team4.project1.domain.ProductVO;

public interface ProductService {
	
	public void register(ProductVO productVO);
	

	// 상품 리스트
	public List<ProductVO> getList();
	
	public List<ProductVO> getP_no(Long p_no);
	
	public List<ProductImageVO> getImageList(Long p_no);


	public ProductVO getProductInfo(Long p_no);


	public Long delete(Long p_no);

}
