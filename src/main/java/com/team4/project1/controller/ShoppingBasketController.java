package com.team4.project1.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.team4.project1.domain.ProductVO;
import com.team4.project1.service.BasketService;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Log4j
@Controller
@RequestMapping("/home/*")
public class ShoppingBasketController {

	@Autowired
	private BasketService basketService;

	@GetMapping({ "/shoppingBasket", "/shoppingBasket/" })
	public void inShoppingBasket(Model model) {
		System.out.println("장바구니로 이동");

		model.addAttribute("list", basketService.getList());
	}

	@PostMapping("/delete")
    @ResponseBody
    public int deleteB_no() throws Exception{
		List<String> grpList = new ArrayList<String>();
		List<BasketVO> vo =basketService.getList();
		String[] grpCode = vo.get("grpList").toString().split(",");

		for(int i=0; i < grpCode.length; i++){
			grpList.add(grpCode[i].toString());
		}
       }


}
