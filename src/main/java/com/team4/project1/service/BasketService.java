package com.team4.project1.service;

import java.util.List;


import com.team4.project1.domain.BasketVO;
import com.team4.project1.domain.ProductVO;

public interface BasketService {
	
	public List<BasketVO> getList(String memberId);
	
	public Long delete(Long b_no);

	public int addBasket(BasketVO basket);
	
	
}
