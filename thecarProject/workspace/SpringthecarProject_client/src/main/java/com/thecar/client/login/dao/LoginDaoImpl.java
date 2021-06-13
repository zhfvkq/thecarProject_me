package com.thecar.client.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thecar.client.login.vo.LoginVO;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSession session;
	
	
	@Override
	public LoginVO loginSelect(LoginVO lvo) {
		return (LoginVO) session.selectOne("loginSelect", lvo);
	}


	@Override
	public LoginVO loginFindIdSelect(LoginVO lvo) {
		return (LoginVO) session.selectOne("loginFindIdSelect", lvo);
	}


	@Override
	public LoginVO loginFindPwSelect(LoginVO lvo) {
		return (LoginVO) session.selectOne("loginFindPwSelect", lvo);
	}	
	
	
}
