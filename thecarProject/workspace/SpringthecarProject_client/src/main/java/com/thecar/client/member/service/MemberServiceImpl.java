package com.thecar.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.client.member.dao.MemberDao;
import com.thecar.client.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public int userIdConfirm(String m_id) {
		int result;
		if (memberDao.memberSelect(m_id) != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Override
	public int memberInsert(MemberVO mvo) {

		System.out.println("m_id : " + mvo.getM_id());
		/* try { */
		if (memberDao.memberSelect(mvo.getM_id()) != null) {
			return 1;
		} else {
			memberDao.memberInsert(mvo);
			return 2;
		}
		/*
		 * } catch (Exception e) { return 1; }
		 */

	}

	@Override
	public MemberVO memberSelect(String m_id) {
		MemberVO vo = memberDao.memberSelect(m_id);
		return vo;
	}

	@Override
	public boolean memberUpdate(MemberVO mvo) {
		try {
			memberDao.memberUpdate(mvo);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public int memberDelete(String m_id) {
		int mCode, sCode, isSucessCode = 3;
		try {
			mCode = memberDao.memberDelete(m_id);
			if (mCode == 1) {
				sCode = memberDao.securityDelete(m_id);
				if (sCode == 1) {
					isSucessCode = 2;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			isSucessCode = 3;
		}
		return isSucessCode;
	}
}
