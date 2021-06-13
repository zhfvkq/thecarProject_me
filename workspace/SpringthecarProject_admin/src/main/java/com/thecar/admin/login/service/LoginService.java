package com.thecar.admin.login.service;
import com.thecar.admin.login.vo.LoginVO;

public interface LoginService {
	
	public LoginVO adminLoginSelect(String a_id, String a_pw);
}

