package com.thecar.client.member.dao;

import com.thecar.client.member.vo.MemberSecurity;
import com.thecar.client.member.vo.MemberVO;

public interface MemberDao {

	int securityInsert(MemberSecurity set);

	MemberSecurity securitySelect(String m_id);

	int securityDelete(String m_id);

	MemberVO memberSelect(String m_id);

	int memberInsert(MemberVO mvo);

	int memberUpdate(MemberVO mvo);

	int memberDelete(String m_id);

}
