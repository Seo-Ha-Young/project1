package com.team4.project1.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.service.BasketService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/home/*")
public class ShoppingBasketController {

	@Autowired
	private BasketService basketService;

	@GetMapping({ "/shoppingBasket", "/shoppingBasket/" })
	public void inShoppingBasket(Model model) {
		log.info("장바구니로 이동");

		model.addAttribute("list", basketService.getList());
	}

	@PostMapping("/delete")
    public String delete(Long b_no) {
		log.info("dlelte : "+b_no);
		basketService.delete(b_no);
		return "redirect:/home/shoppingBasket/";
	}
	
//	@PostMapping("/shoppingBasket/add")
//	@ResponseBody
//	public String addCartPOST(CartDTO cart, HttpServletRequest request) {
//
//		// 카트 등록
//		
//		int result = cartService.addCart(cart);
//		
//		return result + "";
//	}	

}
