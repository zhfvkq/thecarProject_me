package com.thecar.client.member.vo;

import java.util.Date;

import com.thecar.client.login.vo.LoginVO;

public class MemberVO extends LoginVO {
	private int m_no;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_gender;
	private String m_brd;
	private String m_phone;
	private String m_add;
	private String m_email;
	private String m_dlnum; // 운전 면허증
	private String m_stDate; // 면허증 발급일자
	private String m_enDate; // 면허증 만료일자
	private Date m_joindate; // 가입일
	private String m_exit; // 탈퇴유무

	private String OldUserPw; // modify

	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(int m_no, String m_id, String m_pw, String m_name, String m_gender, String m_brd, String m_phone,
			String m_add, String m_email, String m_dlnum, String m_stDate, String m_enDate, Date m_joindate,
			String m_exit, String oldUserPw) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_gender = m_gender;
		this.m_brd = m_brd;
		this.m_phone = m_phone;
		this.m_add = m_add;
		this.m_email = m_email;
		this.m_dlnum = m_dlnum;
		this.m_stDate = m_stDate;
		this.m_enDate = m_enDate;
		this.m_joindate = m_joindate;
		this.m_exit = m_exit;
		OldUserPw = oldUserPw;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_brd() {
		return m_brd;
	}

	public void setM_brd(String m_brd) {
		this.m_brd = m_brd;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_add() {
		return m_add;
	}

	public void setM_add(String m_add) {
		this.m_add = m_add;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_dlnum() {
		return m_dlnum;
	}

	public void setM_dlnum(String m_dlnum) {
		this.m_dlnum = m_dlnum;
	}

	public String getM_stDate() {
		return m_stDate;
	}

	public void setM_stDate(String m_stDate) {
		this.m_stDate = m_stDate;
	}

	public String getM_enDate() {
		return m_enDate;
	}

	public void setM_enDate(String m_enDate) {
		this.m_enDate = m_enDate;
	}

	public Date getM_joindate() {
		return m_joindate;
	}

	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}

	public String getM_exit() {
		return m_exit;
	}

	public void setM_exit(String m_exit) {
		this.m_exit = m_exit;
	}

	public String getOldUserPw() {
		return OldUserPw;
	}

	public void setOldUserPw(String oldUserPw) {
		OldUserPw = oldUserPw;
	}

}
