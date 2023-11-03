package com.team4.project1.service;

import com.team4.project1.domain.MemberVO;

public interface MemberService {
	public void addMember(MemberVO vo);

	public MemberVO memberLogin(MemberVO member) throws Exception;

	public int idCheck(String id);

}
