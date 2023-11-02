package com.team4.project1.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private int age;
	private String gender;
	private String p_number;
	private String email;
	private String address;
	private String authority;
	private Date regDate;
	private Date modDate;
}
