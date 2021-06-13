package com.thecar.admin.notice.vo;

import com.thecar.common.vo.CommonVO;

public class NoticeVO extends CommonVO {

	private int n_num = 0; // 글번호
	private String n_writer = ""; // 작성자
	private String n_title = ""; // 제목
	private String n_content = ""; // 내용
	private String n_date = ""; // 작성일

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public String getN_writer() {
		return n_writer;
	}

	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_date() {
		return n_date;
	}

	public void setN_date(String n_date) {
		this.n_date = n_date;
	}

}
