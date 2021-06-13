package com.thecar.admin.product.vo;

import org.springframework.web.multipart.MultipartFile;

import com.thecar.common.vo.CommonVO;

public class AdminProductVO extends CommonVO {
	private int c_no = 0; // 상품번호(시퀀스)
	private String c_name = ""; // 차랑명
	private String c_num = ""; // 차량번호
	private String c_type = ""; // 차량종류
	private String c_seater = ""; // 탑승인원
	private String c_fuel = ""; // 연료
	private String c_year = ""; // 연식
	private String c_color = ""; // 색상
	private String c_crt = ""; // 대여자격
	private String c_else = ""; // 특이사항
	private String c_det = ""; // 상세정보
	private String c_ins = ""; // 종합보험
	private String c_rentalrate = ""; // 기본 대여비
	private String c_sii = ""; // 자차면책
	private String c_rent = ""; // 대여가능여부
	private String c_date = ""; // 등록일자

	// 파일 업로드를 위한 속성
	private MultipartFile file; // 첨부파일
	private String c_image = ""; // 실제서버에 저장한 파일명

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_num() {
		return c_num;
	}

	public void setC_num(String c_num) {
		this.c_num = c_num;
	}

	public String getC_type() {
		return c_type;
	}

	public void setC_type(String c_type) {
		this.c_type = c_type;
	}

	public String getC_seater() {
		return c_seater;
	}

	public void setC_seater(String c_seater) {
		this.c_seater = c_seater;
	}

	public String getC_fuel() {
		return c_fuel;
	}

	public void setC_fuel(String c_fuel) {
		this.c_fuel = c_fuel;
	}

	public String getC_year() {
		return c_year;
	}

	public void setC_year(String c_year) {
		this.c_year = c_year;
	}

	public String getC_color() {
		return c_color;
	}

	public void setC_color(String c_color) {
		this.c_color = c_color;
	}

	public String getC_crt() {
		return c_crt;
	}

	public void setC_crt(String c_crt) {
		this.c_crt = c_crt;
	}

	public String getC_else() {
		return c_else;
	}

	public void setC_else(String c_else) {
		this.c_else = c_else;
	}

	public String getC_det() {
		return c_det;
	}

	public void setC_det(String c_det) {
		this.c_det = c_det;
	}

	public String getC_ins() {
		return c_ins;
	}

	public void setC_ins(String c_ins) {
		this.c_ins = c_ins;
	}

	public String getC_rentalrate() {
		return c_rentalrate;
	}

	public void setC_rentalrate(String c_rentalrate) {
		this.c_rentalrate = c_rentalrate;
	}

	public String getC_sii() {
		return c_sii;
	}

	public void setC_sii(String c_sii) {
		this.c_sii = c_sii;
	}

	public String getC_rent() {
		return c_rent;
	}

	public void setC_rent(String c_rent) {
		this.c_rent = c_rent;
	}

	public String getC_date() {
		return c_date;
	}

	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getC_image() {
		return c_image;
	}

	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
}
