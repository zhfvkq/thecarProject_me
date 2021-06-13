package com.thecar.client.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.client.login.dao.LoginDao;
import com.thecar.client.login.vo.LoginVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginDao loginDao;
	
	@Override
	public LoginVO loginSelect(String m_id, String m_pw) {
			LoginVO vo = null;
			
			LoginVO lvo = new LoginVO();
			lvo.setM_id(m_id);
			lvo.setM_pw(m_pw);

			vo = loginDao.loginSelect(lvo);
			
		return vo;
	}
	
	// 아이디 찾기
	@Override
	public LoginVO loginFindIdSelect(String m_name, String m_email) {
		LoginVO vo = null;
		
		LoginVO lvo = new LoginVO();
		lvo.setM_name(m_name);
		lvo.setM_email(m_email);

		vo = loginDao.loginFindIdSelect(lvo);
	return vo;
	}
	// 비밀번호 찾기
	@Override
	public LoginVO loginFindPwSelect(String m_id, String m_name, String m_email) {
		LoginVO vo = null;
		
		LoginVO lvo = new LoginVO();
		lvo.setM_id(m_id);
		lvo.setM_name(m_name);
		lvo.setM_email(m_email);
		

		vo = loginDao.loginFindPwSelect(lvo);
	return vo;
	}	

}
