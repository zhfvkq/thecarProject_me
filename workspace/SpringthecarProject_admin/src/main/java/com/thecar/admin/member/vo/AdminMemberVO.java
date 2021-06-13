package com.thecar.admin.member.vo;

import java.util.Date;

import com.thecar.common.vo.MemberCommonVO;
public class AdminMemberVO extends MemberCommonVO {

	/*
	 * 관리자 회원정보 조회VO -- 회원테이블(회원번호, 아이디, 비밀번호, 이름, 성별(M/F), 생년월일, 전화번호, 주소, 이메일,
	 * 운전면허증, 회원가입일, 탈퇴유무) create table member_tbl( M_NO number UNIQUE not null,
	 * M_ID varchar2(30) primary key, M_PW varchar2(30) not null, M_NAME
	 * varchar2(20) not null, M_GENDER char(1) not null, M_BRD char(8) not null,
	 * M_PHONE char(11) not null, M_ADD varchar2(200) not null, M_EMAIL
	 * varchar2(100) not null UNIQUE, M_DLNUM char(12) not null UNIQUE, M_JOINDATE
	 * date not null, M_EXIT varchar(6) );
	 * 
	 * //게시판에 보여지는 순서 [회원번호 아이디 비밀번호 이름 생년월일 성별 이메일 연락처 등록(가입)일자 탈퇴유무]
	 */

	private String m_no; // 회원번호
	private String m_id; // 회원아이디
	private String m_pw; // 회원비밀번호
	private String m_name; // 회원이름
	private String m_brd; // 생년월일
	private String m_gender; // 성별
	private String m_email; // 이메일
	private String m_phone; // 연락처
	Date m_joinDate; // 가입일
	private String m_exit; // 탈퇴유무

	// searchType, keyword 추가
	private String searchType; // 검색 타입
	private String keyword; // 검색어

	public AdminMemberVO() {
		super();
	}

	public AdminMemberVO(String m_no, String m_id, String m_pw, String m_name, String m_brd, String m_gender,
			String m_email, String m_phone, Date m_joinDate, String m_exit) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_brd = m_brd;
		this.m_gender = m_gender;
		this.m_email = m_email;
		this.m_phone = m_phone;
		this.m_joinDate = m_joinDate;
		this.m_exit = m_exit;
	}

	public String getM_no() {
		return m_no;
	}

	public void setM_no(String m_no) {
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

	public String getM_brd() {
		return m_brd;
	}

	public void setM_brd(String m_brd) {
		this.m_brd = m_brd;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public Date getM_joinDate() {
		return m_joinDate;
	}

	public void setM_joinDate(Date m_joinDate) {
		this.m_joinDate = m_joinDate;
	}

	public String getM_exit() {
		return m_exit;
	}

	public void setM_exit(String m_exit) {
		this.m_exit = m_exit;
	}

	public String getSerchType() {
		return searchType;
	}

	public void setSerchType(String serchType) {
		this.searchType = serchType;
	}

	//검색 키워드
	public String getKeyword() {
		return keyword;
	}

	//검색 타입
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "AdminMemberVO [m_no=" + m_no + ", m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_brd="
				+ m_brd + ", m_gender=" + m_gender + ", m_email=" + m_email + ", m_phone=" + m_phone + ", m_joinDate="
				+ m_joinDate + ", m_exit=" + m_exit + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}

	/*
	 * // searchType, keyword 추가 public String makeQuery() {
	 * 
	 * UriComponentsBuilder uriComponentsBuilder =
	 * UriComponentsBuilder.newInstance();
	 * 
	 * if (searchType != null) { uriComponentsBuilder.queryParam("searchType",
	 * this.searchType).queryParam("keyword", this.keyword); } return
	 * uriComponentsBuilder.toString(); }
	 */

	
}
