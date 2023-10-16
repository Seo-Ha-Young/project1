package com.team4.project1.controller;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.mapper.ProductMapper;
import com.team4.project1.mapper.ProductMapperTest;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class shoppingBasketTests {
	@Setter(onMethod_ = @Autowired)
	private BasketVO vo;

	public void testPrices() {
		int price = vo.getTotalPrice();
		if(vo.getU_id().equals("u_id")) {
			if(!vo.getP_no().equals(vo.getP_no())) {
				
			}
	}
	}
}
