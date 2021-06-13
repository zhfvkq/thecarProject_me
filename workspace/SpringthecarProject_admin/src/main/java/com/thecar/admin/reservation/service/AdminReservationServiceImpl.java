package com.thecar.admin.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thecar.admin.reservation.dao.AdminReservationDao;
import com.thecar.admin.reservation.vo.AdminReservationVO;
import com.thecar.common.vo.PagingVO;

import jdk.internal.org.jline.utils.Log;

@Service
public class AdminReservationServiceImpl implements AdminReservationService {

	@Autowired
	private AdminReservationDao adminReservationDao;

	// 예약목록조회 구현
	@Override
	public List<AdminReservationVO> selectReservationList(AdminReservationVO rvo) {
		List<AdminReservationVO> list = null;
		list = adminReservationDao.selectReservationList(rvo);
		return list;
	}

	// 예약완료 카운트 조회
	@Override
	public PagingVO reservationCnt(String _page) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page % 10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}

		int reservationCnt = adminReservationDao.reservationCnt();
		System.out.println("전체 대여 리스트 수 : " + reservationCnt);

		int maxSection;
		int maxPage;

		if (reservationCnt % 100 == 0) {
			maxSection = reservationCnt / 100;
			maxPage = reservationCnt / 10;
		} else if (reservationCnt % 10 == 0) {
			maxSection = (reservationCnt / 100) + 1;
			maxPage = reservationCnt / 10;
		} else {
			maxSection = (reservationCnt / 100) + 1;
			maxPage = (reservationCnt / 10) + 1;
		}

		PagingVO pagingVO = new PagingVO();
		pagingVO.setTotalCnt(reservationCnt);
		pagingVO.setMaxPage(maxPage);
		pagingVO.setMaxSection(maxSection);
		pagingVO.setPage(page);
		pagingVO.setSection(section);

		return pagingVO;
	}

	// 대여중 변경
	@Override
	public int rentalUpdate(AdminReservationVO rvo) {
		return adminReservationDao.rentalUpdate(rvo);
	}

	// 대여중 목록
	@Override
	public List<AdminReservationVO> selectRentalList(AdminReservationVO rvo) {
		return adminReservationDao.selectRentalList(rvo);
	}

	// 대여중 카운트 조회
	@Override
	public PagingVO countRentalCnt(String _page) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page % 10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}

		int countRentalCnt = adminReservationDao.countRentalCnt();
		System.out.println("전체 대여 리스트 수 : " + countRentalCnt);

		int maxSection;
		int maxPage;

		if (countRentalCnt % 100 == 0) {
			maxSection = countRentalCnt / 100;
			maxPage = countRentalCnt / 10;
		} else if (countRentalCnt % 10 == 0) {
			maxSection = (countRentalCnt / 100) + 1;
			maxPage = countRentalCnt / 10;
		} else {
			maxSection = (countRentalCnt / 100) + 1;
			maxPage = (countRentalCnt / 10) + 1;
		}

		PagingVO pagingVO = new PagingVO();
		pagingVO.setTotalCnt(countRentalCnt);
		pagingVO.setMaxPage(maxPage);
		pagingVO.setMaxSection(maxSection);
		pagingVO.setPage(page);
		pagingVO.setSection(section);

		return pagingVO;
	}

	// 반납완료로 변경
	@Override
	public int returnUpdate(AdminReservationVO rvo) {
		return adminReservationDao.returnUpdate(rvo);
	}

	// 반납완료 목록
	@Override
	public List<AdminReservationVO> selectReturnList(AdminReservationVO rvo) {
		return adminReservationDao.selectReturnList(rvo);
	}

	// 반납완료 카운트 조회
	@Override
	public PagingVO returnCnt(String _page) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page % 10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}

		int returnCnt = adminReservationDao.returnCnt();
		System.out.println("전체 대여 리스트 수 : " + returnCnt);

		int maxSection;
		int maxPage;

		if (returnCnt % 100 == 0) {
			maxSection = returnCnt / 100;
			maxPage = returnCnt / 10;
		} else if (returnCnt % 10 == 0) {
			maxSection = (returnCnt / 100) + 1;
			maxPage = returnCnt / 10;
		} else {
			maxSection = (returnCnt / 100) + 1;
			maxPage = (returnCnt / 10) + 1;
		}

		PagingVO pagingVO = new PagingVO();
		pagingVO.setTotalCnt(returnCnt);
		pagingVO.setMaxPage(maxPage);
		pagingVO.setMaxSection(maxSection);
		pagingVO.setPage(page);
		pagingVO.setSection(section);

		return pagingVO;
	}

	// 취소요청 리스트
	@Override
	public List<AdminReservationVO> cancelList(AdminReservationVO rvo) {
		return adminReservationDao.cancelList(rvo);
	}

	// 취소요청 카운트 조회
	@Override
	public PagingVO cancelCnt(String _page) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page % 10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}

		int cancelCnt = adminReservationDao.cancelCnt();
		System.out.println("전체 대여 리스트 수 : " + cancelCnt);

		int maxSection;
		int maxPage;

		if (cancelCnt % 100 == 0) {
			maxSection = cancelCnt / 100;
			maxPage = cancelCnt / 10;
		} else if (cancelCnt % 10 == 0) {
			maxSection = (cancelCnt / 100) + 1;
			maxPage = cancelCnt / 10;
		} else {
			maxSection = (cancelCnt / 100) + 1;
			maxPage = (cancelCnt / 10) + 1;
		}

		PagingVO pagingVO = new PagingVO();
		pagingVO.setTotalCnt(cancelCnt);
		pagingVO.setMaxPage(maxPage);
		pagingVO.setMaxSection(maxSection);
		pagingVO.setPage(page);
		pagingVO.setSection(section);

		return pagingVO;
	}

	// 취소완료 리스트
	@Override
	public List<AdminReservationVO> cancelOkList(AdminReservationVO rvo) {
		return adminReservationDao.cancelOkList(rvo);
	}

	// 취소완료로 변경
	@Override
	public int cancelOk(AdminReservationVO rvo) {
		return adminReservationDao.cancelOk(rvo);
	}

	// 취소완료 카운트 조회
	@Override
	public PagingVO cancelOkCnt(String _page) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page % 10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}

		int cancelOkCnt = adminReservationDao.cancelOkCnt();
		System.out.println("전체 대여 리스트 수 : " + cancelOkCnt);

		int maxSection;
		int maxPage;

		if (cancelOkCnt % 100 == 0) {
			maxSection = cancelOkCnt / 100;
			maxPage = cancelOkCnt / 10;
		} else if (cancelOkCnt % 10 == 0) {
			maxSection = (cancelOkCnt / 100) + 1;
			maxPage = cancelOkCnt / 10;
		} else {
			maxSection = (cancelOkCnt / 100) + 1;
			maxPage = (cancelOkCnt / 10) + 1;
		}

		PagingVO pagingVO = new PagingVO();
		pagingVO.setTotalCnt(cancelOkCnt);
		pagingVO.setMaxPage(maxPage);
		pagingVO.setMaxSection(maxSection);
		pagingVO.setPage(page);
		pagingVO.setSection(section);

		return pagingVO;
	}

}
