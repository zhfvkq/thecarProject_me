package com.thecar.admin.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thecar.admin.login.vo.LoginVO;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSession session;
	
	
	@Override
	public LoginVO adminLoginSelect(LoginVO lvo) {
		return (LoginVO) session.selectOne("adminLoginSelect", lvo);
	}
	
}
