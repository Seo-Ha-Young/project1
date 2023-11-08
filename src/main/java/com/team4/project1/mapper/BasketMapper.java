package com.team4.project1.mapper;

import java.util.List;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.domain.ProductVO;

public interface BasketMapper {

	public List<BasketVO> getList(String memeberId);

	public Long deleteB_no(Long b_no);

	public BasketVO checkBasket(BasketVO vo);

	public int addBasket(BasketVO vo) throws Exception;

}
