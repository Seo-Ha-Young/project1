package com.team4.project1.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team4.project1.domain.MemberVO;
import com.team4.project1.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
public class HeaderViewController {
	@Autowired
	private MemberService memberService;
	@GetMapping()
	public void list(Model model, MemberVO vo) {
		log.info("header, menu view setting");
		model.addAttribute("id", vo.getId());
	}
}
