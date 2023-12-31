package com.team4.project1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.project1.domain.MemberVO;
import com.team4.project1.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper membermapper;
	
	
	@Override
	public void addMember(MemberVO vo) {
		vo.setAuthority("user");
		membermapper.addMember(vo);

	}


	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return membermapper.memberLogin(member);
	}


	@Override
	public int idCheck(String id) {
		return membermapper.idCheck(id);
	}


	@Override
	public String getId(String id) {
		log.info("get id");
		return membermapper.getId(id);
	}

}
