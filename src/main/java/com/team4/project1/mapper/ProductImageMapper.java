package com.team4.project1.mapper;

import java.util.List;


import com.team4.project1.domain.ProductImageVO;

public interface ProductImageMapper {

	public List<ProductImageVO> getImageList(Long p_no);

	public void insert(ProductImageVO image);


}
