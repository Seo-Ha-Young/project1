package com.team4.project1.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.team4.project1.domain.ProductVO;

public interface ProductMapper {
	

	List<ProductVO> getP_no(Long p_no);

	public void insert(ProductVO productVO);
	
	public void insertSelectKey(ProductVO productVO);
	
	//@Select("select * from product where p_no >0")
	public List<ProductVO> getList();

	/* 상품 정보 */
	public ProductVO getProductInfo(Long p_no);
	
}
