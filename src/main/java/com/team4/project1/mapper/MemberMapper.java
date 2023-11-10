package com.team4.project1.mapper;

import java.util.List;

import com.team4.project1.domain.MemberVO;

public interface MemberMapper {
	public void addMember(MemberVO vo);

	public MemberVO memberLogin(MemberVO member);

	public int idCheck(String id);

	public String getId(String id);
}
