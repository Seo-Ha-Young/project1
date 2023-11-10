package com.team4.project1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/home/*")
public class OrderController {
	
	@GetMapping("/order")
	public void orderPage() {
		log.info("주문 페이지 진입");
	}
}
