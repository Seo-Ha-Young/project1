package com.team4.project1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team4.project1.domain.MemberVO;
import com.team4.project1.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	@Autowired
	private MemberService memberservice;
	

//회원 가입 페이지로 이동
	@RequestMapping(value= "/index", method = RequestMethod.GET)
	public void joinGET() {
		
		log.info("회원가입 페이지 진입");
	}
	
//로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {
		 
		log.info("로그인 페이지 진입");

	}
//로그인
	@PostMapping("/login")
	public void login(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
		HttpSession session = request.getSession();
		
//		MemberVO vo = memberservice.memberLogin(member);
//		
//		if(vo != null) {
//			
//		}
	}
	
	@PostMapping("/userRegister")
	public String addMember(MemberVO member) throws Exception{
		String pw = "";
		String encodePw = "";
		pw = member.getPw();
		encodePw = pwEncoder.encode(pw);
		member.setPw(encodePw);
		log.info("가입 정보 :" + member);
		memberservice.addMember(member);
		
		return "return:/project1/member/login";
	}
}
