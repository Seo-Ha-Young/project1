package com.team4.project1.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.domain.ProductVO;
import com.team4.project1.mapper.BasketMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BasketServiceImpl implements BasketService {

	@Setter(onMethod_ = @Autowired)
	private BasketMapper mapper;

	@Override
	public List<BasketVO> getList(String memberId) {
		log.info("basket list");
		List<BasketVO> basketVOs = mapper.getList(memberId);
		return null;
	}
	
	
	
	@Override
	public Long delete(Long b_no) {
		log.info("delete basket b_no");
		return mapper.deleteB_no(b_no);
	}

	@Override
	public int addBasket(BasketVO vo) {
		log.info("서비스로 넘어온 장바구니 정보 : "+vo);
		BasketVO checkBasket = mapper.checkBasket(vo);
		log.info("checkBasket : "+checkBasket);
		if(checkBasket != null) {
			return 2;
		}
		// 장바구니 등록 & 에러 시 0반환
		try {
			log.info("장바구니 등록");
			 int basket = mapper.addBasket(vo);
			log.info(basket);
			return basket;
		} catch (Exception e) {
			return 0;
		}	
		
	}

}
