package com.team4.project1.mapper;

import java.util.List;

import com.team4.project1.domain.BasketVO;

public interface BasketMapper {

	public List<BasketVO> getList();

	public Long deleteB_no(Long b_no);

	public BasketVO checkBasket(BasketVO basket);

	public int addBasket(BasketVO basket) throws Exception;

}
