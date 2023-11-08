package com.team4.project1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String login(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
		HttpSession session = request.getSession();
		String pw = "";
		String encodePw = "";

		MemberVO vo = memberservice.memberLogin(member);
		
		if(vo != null) {
			log.info("시도한 사람 정보:"+vo);
			pw = member.getPw();
			encodePw = vo.getPw();
			if(true == pwEncoder.matches(pw, encodePw)) {
				vo.setPw("");
				session.setAttribute("member_id", vo.getId());
				session.setAttribute("member_name", vo.getName());
				session.setAttribute("member_authority", vo.getAuthority());
				log.info("로그인 성공");
				log.info("로그인 한 사람 정보 :"+vo);
				return "redirect:/home/list";
			} else {
				rttr.addFlashAttribute("result", 0);
				log.info("비밀번호 틀림");
				return "redirect:/member/login";
			}	
		} else {
			rttr.addFlashAttribute("result", 0);
			log.info("가입정보 없음");
			return "redirect:/member/login";
		}
	}
	
//계정 생성
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
//회원가입계정 중복검사
	@PostMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChk(String id, Model model) throws Exception {
		log.info("아이디 중복 검사");
		int resultNum = memberservice.idCheck(id);
		log.info("결과 : "+resultNum);
		String result = "";
		if(resultNum == 0) {
			result = "success";
			model.addAttribute("result", result);
			log.info(result);
		} else {
			result = "fail";
			model.addAttribute("result", result);
			log.info(result);
		}
		return result;
	}
//로그아웃
	@PostMapping("/logout")
	@ResponseBody
	public String Logout(HttpServletRequest request) throws Exception {
		log.info("logout");
 	HttpSession session = request.getSession();
    	
    	session.invalidate();
    	log.info(session);
    	return "redirect:/home/list";
	}
	
}
