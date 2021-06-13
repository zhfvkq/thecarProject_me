package com.thecar.client.reservation.vo;

import java.util.Date;

public class MyReservationVO {

	/*
	 * R_NO 예약순번 R_NUM 예약번호 R_PRICE 이용금액 R_PRERETURNDATE 반납예정일시 R_PRERENTALDATE
	 * 대여예정일시 R_RENTALDATE 실대여일시 R_RETURNDATE 실반납일시 R_EXSYSTEM 전체손해 면책제도
	 * R_IDENTIFIINFO 고유식별정보수집 및 이용동의 R_CARSTANDARD 자동차표준대여 약관동의 R_CANCEL 취소 및 위약금규정
	 * 동의 R_QUALIFICATION 대여자격확인 동의 M_ID 아이디 c_name 차량명 R_EXCHARGE 추가비용 R_EXTIME
	 * 초과시간 R_STATUS 예약상태
	 */

	private String m_id; // 회원아이디
	private String r_no; // 예약순번
	private String r_num; // 예약번호
	private String c_name; // 차량명
	private boolean r_exsystem; // 자차면책
	private Date r_prerentalDate; // 대여예정일
	private Date r_prereturnDate; // 반납예정일
	private Date r_rentalDate; // 실대여일시
	private Date r_returnDate; // 실반납일시
	private int r_price; // 이용금액
	private String r_status; // 예약상태
	private String r_cancelStatus; // 취소상태(대여상태)
	private boolean r_cancel; // 취소 (요청처리시)
	private Date r_date; // 실예약일

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getR_no() {
		return r_no;
	}

	public void setR_no(String r_no) {
		this.r_no = r_no;
	}

	public String getR_num() {
		return r_num;
	}

	public void setR_num(String r_num) {
		this.r_num = r_num;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public boolean isR_exsystem() {
		return r_exsystem;
	}

	public void setR_exsystem(boolean r_exsystem) {
		this.r_exsystem = r_exsystem;
	}

	public Date getR_prerentalDate() {
		return r_prerentalDate;
	}

	public void setR_prerentalDate(Date r_prerentalDate) {
		this.r_prerentalDate = r_prerentalDate;
	}

	public Date getR_prereturnDate() {
		return r_prereturnDate;
	}

	public void setR_prereturnDate(Date r_prereturnDate) {
		this.r_prereturnDate = r_prereturnDate;
	}

	public Date getR_rentalDate() {
		return r_rentalDate;
	}

	public void setR_rentalDate(Date r_rentalDate) {
		this.r_rentalDate = r_rentalDate;
	}

	public Date getR_returnDate() {
		return r_returnDate;
	}

	public void setR_returnDate(Date r_returnDate) {
		this.r_returnDate = r_returnDate;
	}

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public String getR_cancelStatus() {
		return r_cancelStatus;
	}

	public void setR_cancelStatus(String r_cancelStatus) {
		this.r_cancelStatus = r_cancelStatus;
	}

	public boolean isR_cancel() {
		return r_cancel;
	}

	public void setR_cancel(boolean r_cancel) {
		this.r_cancel = r_cancel;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

}