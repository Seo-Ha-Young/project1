package com.team4.project1.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.mapper.BasketMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BasketServiceImpl implements BasketService {

	@Setter(onMethod_ = @Autowired)
	private BasketMapper mapper;

	@Override
	public List<BasketVO> getList() {
		log.info("basket list");
		return mapper.getList();
	}
	
	@Override
	public Long delete(Long b_no) {
		log.info("delete basket b_no");
		return mapper.deleteB_no(b_no);
	}

	@Override
	public int addBasket(BasketVO basket) {
		BasketVO checkBasket = mapper.checkBasket(basket);
		
		if(checkBasket != null) {
			return 2;
		}
		
		// 장바구니 등록 & 에러 시 0반환
		try {
			return mapper.addBasket(basket);
		} catch (Exception e) {
			return 0;
		}	
		
	}

}
