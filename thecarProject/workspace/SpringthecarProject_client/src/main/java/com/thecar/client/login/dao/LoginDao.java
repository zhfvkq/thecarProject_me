package com.thecar.client.login.dao;

import com.thecar.client.login.vo.LoginVO;

public interface LoginDao {
	
	public LoginVO loginSelect(LoginVO lvo);
	public LoginVO loginFindIdSelect(LoginVO lvo);
	public LoginVO loginFindPwSelect(LoginVO lvo);

}
