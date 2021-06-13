package com.thecar.client.member.service;

import com.thecar.client.member.vo.MemberVO;

public interface MemberService {
	public int userIdConfirm(String m_id);

	public MemberVO memberSelect(String m_id);

	public int memberInsert(MemberVO mvo);

	public boolean memberUpdate(MemberVO mvo);

	public int memberDelete(String m_id);

}
