package com.thecar.admin.member.service;

import java.util.List;

import com.thecar.admin.member.vo.AdminMemberVO;
import com.thecar.common.vo.Paging;

public interface MemberService {
	
	public int selectMemberListCnt(Paging paging);
	public List<AdminMemberVO> selectMemberList(Paging paging);
	

	int countSearchedArticles(AdminMemberVO search) throws Exception;
	

}
