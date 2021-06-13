package com.thecar.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thecar.admin.member.dao.MemberDAO;
import com.thecar.admin.member.vo.AdminMemberVO;
import com.thecar.common.vo.Paging;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	//전체 레코드수 구현
	@Override
	public int selectMemberListCnt(Paging paging) {
		return memberDAO.selectMemberListCnt(paging);
	}
		
	@Override
	public List<AdminMemberVO> selectMemberList(Paging paging) {
		return memberDAO.selectMemberList(paging);
	}

	@Override
	public int countSearchedArticles(AdminMemberVO search) throws Exception{
		return memberDAO.countSearchedArticles(search);
	}

	
}
