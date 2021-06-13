package com.thecar.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thecar.admin.member.vo.AdminMemberVO;
import com.thecar.common.vo.Paging;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int selectMemberListCnt(Paging paging) {
		return (Integer)session.selectOne("selectMemberListCnt", paging);
	}
	
	@Override
	public List<AdminMemberVO> selectMemberList(Paging paging) {
		return session.selectList("selectMemberList", paging);
	}

	@Override
	public int countSearchedArticles(AdminMemberVO search) throws Exception {
		return session.selectOne("Search", search);
	}

	
}
