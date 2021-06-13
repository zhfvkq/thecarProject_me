package com.thecar.client.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thecar.client.member.vo.MemberSecurity;
import com.thecar.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;

	@Override
	public int securityInsert(MemberSecurity set) {
		return session.insert("securityInsert", set);
	}

	@Override
	public MemberSecurity securitySelect(String m_id) {
		return (MemberSecurity) session.selectOne("securitySelect", m_id);
	}

	@Override
	public int securityDelete(String m_id) {
		return session.delete("securityDelete", m_id);
	}

	@Override
	public MemberVO memberSelect(String m_id) {
		return (MemberVO) session.selectOne("memberSelect", m_id);
	}

	@Override
	public int memberInsert(MemberVO mvo) {
		return session.insert("memberInsert", mvo);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		return session.update("memberUpdate", mvo);
	}

	@Override
	public int memberDelete(String m_id) {
		return session.delete("memberDelete", m_id);
	}
}
