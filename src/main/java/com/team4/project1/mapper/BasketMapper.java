package com.team4.project1.mapper;

import java.util.List;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.domain.ProductVO;

public interface BasketMapper {

	public List<BasketVO> getList();
	public List<BasketVO> getBasket(String memeberId);

	public Long deleteB_no(Long b_no);

	//상품 추가 전 이미 있는 상품인지 점검
	public BasketVO checkBasket(BasketVO vo);

	//상품 장바구니에 추가
	public int addBasket(BasketVO vo) throws Exception;

	//상품이 장바구니에 하나라도 있는지 확인
	public List<BasketVO> checkBasketP_no(Long p_no);
}
