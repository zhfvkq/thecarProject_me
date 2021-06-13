package com.thecar.client.login.service;
import com.thecar.client.login.vo.LoginVO;

public interface LoginService {
	
	public LoginVO loginSelect(String m_id, String m_pw);
	public LoginVO loginFindIdSelect(String m_name, String m_email);
	public LoginVO loginFindPwSelect(String m_id, String m_name, String m_email);

}

