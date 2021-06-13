package com.thecar.admin.reservation.vo;

import com.thecar.admin.member.vo.AdminMemberVO;
import com.thecar.common.vo.CommonVO;
import com.thecar.common.vo.PagingVO;

public class AdminReservationVO extends PagingVO {

	private int r_no = 0; // 번호
	private String r_num = ""; // 예약번호
	private String r_price = ""; // 이용요금
	private String r_prereturndate = ""; // 반납예정일시
	private String r_prerentaldate = ""; // 대여예정일시
	private String r_rentaldate = ""; // 실대여일시
	private String r_returndate = ""; // 실반납일시
	private int excharge = 0; // 초과비용
	private int extime = 0; // 초과시간
	private String r_status = ""; // 예약상태
	private String r_cancelstatus = ""; // 취소상태
	private String m_id = ""; // 회원아이디
	private String m_name = ""; // 회원이름
	private String m_phone = ""; // 회원연락처
	private String c_name = ""; // 차량명
	private String c_num = ""; // 차량번호
	private String r_date = ""; // 예약일

	
	private AdminMemberVO adminMemberVO;
	
	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_num() {
		return r_num;
	}

	public void setR_num(String r_num) {
		this.r_num = r_num;
	}

	public String getR_price() {
		return r_price;
	}

	public void setR_price(String r_price) {
		this.r_price = r_price;
	}

	public String getR_prereturndate() {
		return r_prereturndate;
	}

	public void setR_prereturndate(String r_prereturndate) {
		this.r_prereturndate = r_prereturndate;
	}

	public String getR_prerentaldate() {
		return r_prerentaldate;
	}

	public void setR_prerentaldate(String r_prerentaldate) {
		this.r_prerentaldate = r_prerentaldate;
	}

	public String getR_rentaldate() {
		return r_rentaldate;
	}

	public void setR_rentaldate(String r_rentaldate) {
		this.r_rentaldate = r_rentaldate;
	}

	public String getR_returndate() {
		return r_returndate;
	}

	public void setR_returndate(String r_returndate) {
		this.r_returndate = r_returndate;
	}

	public int getExcharge() {
		return excharge;
	}

	public void setExcharge(int excharge) {
		this.excharge = excharge;
	}

	public int getExtime() {
		return extime;
	}

	public void setExtime(int extime) {
		this.extime = extime;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public String getR_cancelstatus() {
		return r_cancelstatus;
	}

	public void setR_cancelstatus(String r_cancelstatus) {
		this.r_cancelstatus = r_cancelstatus;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
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

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	@Override
	public String toString() {
		return "AdminReservationVO [r_no=" + r_no + ", r_num=" + r_num + ", r_price=" + r_price + ", r_prereturndate="
				+ r_prereturndate + ", r_prerentaldate=" + r_prerentaldate + ", r_rentaldate=" + r_rentaldate
				+ ", r_returndate=" + r_returndate + ", excharge=" + excharge + ", extime=" + extime + ", r_status="
				+ r_status + ", r_cancelstatus=" + r_cancelstatus + ", m_id=" + m_id + ", m_name=" + m_name
				+ ", m_phone=" + m_phone + ", c_name=" + c_name + ", c_num=" + c_num + ", r_date=" + r_date + "]";
	}

	public AdminMemberVO getAdminMemberVO() {
		return adminMemberVO;
	}

	public void setAdminMemberVO(AdminMemberVO adminMemberVO) {
		this.adminMemberVO = adminMemberVO;
	}
	
	

}
