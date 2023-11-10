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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.domain.MemberVO;
import com.team4.project1.domain.ProductVO;
import com.team4.project1.service.BasketService;
import com.team4.project1.service.MemberService;
import com.team4.project1.service.ProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/home/*")
public class ShoppingBasketController {
	@Autowired
	private ProductService productService;
	@Autowired
	private BasketService basketService;
	@Autowired
	private MemberService memberService;
	
	
	
	  @GetMapping({ "/shoppingBasket", "/shoppingBasket/" })
	  public void inShoppingBasket(Model model, HttpServletRequest request) {
	  log.info("장바구니로 이동"); HttpSession session = request.getSession(); String
	  member_id = (String) session.getAttribute("member_id");
	  log.info("로그인 아이디:"+member_id); model.addAttribute("list",
	  basketService.getBasket(member_id)); log.info("바구니 정보: "+model);
	  }
	 
	 
	 
	
	
//	  @GetMapping("/shoppingBasket/{memberid}")
//	  public String inShoppingBasket(Model model, HttpServletRequest request) {
//		  log.info("장바구니로 이동");
//		  HttpSession session = request.getSession();
//		  String member_id = (String) session.getAttribute("member_id");
//		  log.info("로그인 아이디:"+member_id);
//		  model.addAttribute("list", basketService.getBasket(member_id));
//		  log.info("바구니 정보: "+model);
//	  return "/home/shoppingBasket";
//	  }
//	 

	@PostMapping("/delete")
    public String delete(Long b_no) {
		log.info("dlelte : "+b_no);
		basketService.delete(b_no);
		return "redirect:/home/shoppingBasket/";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public String addBasketPOST(ProductVO vo, BasketVO basket) {
		log.info(vo.getP_no());
		
		ProductVO product = productService.getProductInfo(vo.getP_no());
		log.info("product :"+product);
		// 카트 등록
		basket.setProductVO(product);
		log.info("장바구니 등록 내용 : "+basket);
		int result = basketService.addBasket(basket);
		return result + "";
	}	

}
