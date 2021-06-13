package com.thecar.admin.reply.vo;

public class ReplyVO {
	private int rp_num = 0; // 답변 번호
	private int q_num = 0; // 문의글 글번호
	private String rp_name = ""; // 답변 작성자
	private String rp_title = ""; // 답변 제목
	private String rp_content = ""; // 답변 내용
	private String rp_date = ""; // 답변 작성일
	private String rp_pwd = ""; // 답변 비밀번호

	public int getRp_num() {
		return rp_num;
	}

	public void setRp_num(int rp_num) {
		this.rp_num = rp_num;
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getRp_name() {
		return rp_name;
	}

	public void setRp_name(String rp_name) {
		this.rp_name = rp_name;
	}

	public String getRp_title() {
		return rp_title;
	}

	public void setRp_title(String rp_title) {
		this.rp_title = rp_title;
	}

	public String getRp_content() {
		return rp_content;
	}

	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}

	public String getRp_date() {
		return rp_date;
	}

	public void setRp_date(String rp_date) {
		this.rp_date = rp_date;
	}

	public String getRp_pwd() {
		return rp_pwd;
	}

	public void setRp_pwd(String rp_pwd) {
		this.rp_pwd = rp_pwd;
	}

}
