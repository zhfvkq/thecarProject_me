package com.thecar.client.product.vo;

import java.util.Date;

import com.thecar.client.reservation.vo.ReservationVO;

// 상품 테이블
public class ProductVO extends ReservationVO{
	private int c_no;	// 상품번호
	private String c_name; // 차량명(기본키)
	private String c_num; // 차량번호
	private String c_type; // 차량종류
	private String c_seater; // 탑승인승
	private String c_fuel; // 연료
	private String c_year; // 연식
	private String c_color; // 색상
	private String c_crt; // 대여자격
	private String c_else; // 특이사항
	private String c_det; // 상세정보
	private String c_ins; // 종합보험
	private String c_rentalrate; // 기본대여비
	private String c_sii; //자차면책
	private String c_rent; // 대여가능여부
	private Date c_date; // 대여일
	
	public ProductVO() {}

	public ProductVO(int c_no, String c_name, String c_num, String c_type, String c_seater, String c_fuel,
			String c_year, String c_color, String c_crt, String c_else, String c_det, String c_ins, String c_rentalrate,
			String c_sii, String c_rent, Date c_date) {
		super();
		this.c_no = c_no;
		this.c_name = c_name;
		this.c_num = c_num;
		this.c_type = c_type;
		this.c_seater = c_seater;
		this.c_fuel = c_fuel;
		this.c_year = c_year;
		this.c_color = c_color;
		this.c_crt = c_crt;
		this.c_else = c_else;
		this.c_det = c_det;
		this.c_ins = c_ins;
		this.c_rentalrate = c_rentalrate;
		this.c_sii = c_sii;
		this.c_rent = c_rent;
		this.c_date = c_date;
	}

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

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

	
}
