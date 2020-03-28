package com.kh.wassupSeoul.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.admin.model.dao.AdminDAO;
import com.kh.wassupSeoul.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	
	@Override
	public List<Member> selectMemberList() throws Exception {
		
		return adminDAO.selectMemberList();
	}
}
