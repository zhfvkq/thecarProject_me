package com.thecar.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.admin.login.dao.LoginDao;
import com.thecar.admin.login.vo.LoginVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginDao loginDao;

	@Override
	public LoginVO adminLoginSelect(String a_id, String a_pw) {
			LoginVO vo = null;
			
			LoginVO lvo = new LoginVO();
			lvo.setA_id(a_id);
			lvo.setA_pw(a_pw);

			vo = loginDao.adminLoginSelect(lvo);
			
		return vo;
	}

}
