package com.kh.wassupSeoul.admin.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.member.model.vo.Member;

@Service
public interface AdminService {

	
	public abstract List<Member> selectMemberList() throws Exception;

}
