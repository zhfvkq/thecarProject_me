package com.thecar.admin.reservation.service;

import java.util.List;

import com.thecar.admin.reservation.vo.AdminReservationVO;
import com.thecar.common.vo.PagingVO;

public interface AdminReservationService {
	// 페이징 처리 예약완료 조회
	public List<AdminReservationVO> selectReservationList(AdminReservationVO rvo);

	// 대여중으로 변경
	public int rentalUpdate(AdminReservationVO rvo);

	// 페이징 처리 대여중 조회
	public List<AdminReservationVO> selectRentalList(AdminReservationVO rvo);

	// 반납완료로 변경
	public int returnUpdate(AdminReservationVO rvo);

	// 페이징처리 반납완료 조회
	public List<AdminReservationVO> selectReturnList(AdminReservationVO rvo);

	// 페이징처리 취소완료 조회
	public List<AdminReservationVO> cancelList(AdminReservationVO rvo);

	// 페이징처리 취소완료 리스트
	public List<AdminReservationVO> cancelOkList(AdminReservationVO rvo);

	// 취소완료로 변경
	public int cancelOk(AdminReservationVO rvo);

	// 대여중 게시물 총 갯수
	public PagingVO countRentalCnt(String _page);

	// 예약완료 게시물 총 갯수
	public PagingVO reservationCnt(String _page);

	// 반납완료 게시물 총 갯수
	public PagingVO returnCnt(String _page);

	// 취소요청 게시물 총 갯수
	public PagingVO cancelCnt(String _page);

	// 취소완료 게시물 총 갯수
	public PagingVO cancelOkCnt(String _page);

}
