package com.team4.project1.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.domain.MemberVO;
import com.team4.project1.domain.ProductImageVO;
import com.team4.project1.domain.ProductVO;
import com.team4.project1.mapper.BasketMapper;
import com.team4.project1.mapper.MemberMapper;
import com.team4.project1.mapper.ProductImageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BasketServiceImpl implements BasketService {

	@Setter(onMethod_ = @Autowired)
	private BasketMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ProductImageMapper imageMapper;
	
	
	@Override
	public List<BasketVO> getList() {
		log.info("basket list");
		List<BasketVO> basketVOs = mapper.getList();

		return basketVOs;
	}
	@Override
	public List<BasketVO> getBasket(String u_id) {
		log.info("basket list");
		
		List<BasketVO> basketVOs = mapper.getBasket(u_id);
		for(BasketVO vo : basketVOs) {
			Long p_no = vo.getP_no();
			List<ProductImageVO> imageVOs = imageMapper.getImageList(p_no);
			
		}
		return basketVOs;
	}
	
	
	@Override
	public Long delete(Long b_no) {
		log.info("delete basket "+b_no);
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
	@Override
	public List<BasketVO> chkBasket(Long p_no) {
		log.info("장바구니에 있는 상품인지 확인");
		return mapper.checkBasketP_no(p_no);
	}

}
