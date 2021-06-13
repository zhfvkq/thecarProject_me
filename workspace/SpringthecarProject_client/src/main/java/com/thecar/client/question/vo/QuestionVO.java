package com.thecar.client.question.vo;

import org.springframework.web.multipart.MultipartFile;

import com.thecar.common.vo.CommonVO;

public class QuestionVO extends CommonVO {
	private int q_num = 0; // 문의글 번호
	private String m_id = ""; // 작성자 아이디
	private String q_title = ""; // 제목
	private String q_content = ""; // 내용
	private String q_date = ""; // 작성일
	private String q_pwd = ""; // 문의글 비밀번호
	private String q_rpState = ""; // 답변상태

	// 파일 업로드를 위한 속성
	private MultipartFile file; // 첨부파일
	private String q_file = ""; // 실제서버에 저장한 파일명

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_date() {
		return q_date;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}

	public String getQ_pwd() {
		return q_pwd;
	}

	public void setQ_pwd(String q_pwd) {
		this.q_pwd = q_pwd;
	}

	public String getQ_rpState() {
		return q_rpState;
	}

	public void setQ_rpState(String q_rpState) {
		this.q_rpState = q_rpState;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getQ_file() {
		return q_file;
	}

	public void setQ_file(String q_file) {
		this.q_file = q_file;
	}

}
