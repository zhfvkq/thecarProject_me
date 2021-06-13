package com.thecar.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.admin.notice.dao.NoticeDao;
import com.thecar.admin.notice.vo.NoticeVO;

import jdk.internal.org.jline.utils.Log;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;

	// 공지사항목록 구현
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> adminList = null;

		// 정렬에 대한 기본값 설정
		if (nvo.getOrder_by() == null) {
			nvo.setOrder_by("n_num");
		}
		if (nvo.getOrder_sc() == null) {
		
		}

		adminList = noticeDao.noticeList(nvo);
		return adminList;
	}

	// 공지사항입력 구현
	@Override
	public int noticeInsert(NoticeVO nvo) {
		int result = 0;
		try {
			result = noticeDao.noticeInsert(nvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 공지사항상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
		return detail;
	}

	// 공지사항수정 구현
	@Override
	public int noticeUpdateOk(NoticeVO nvo) {
		int result = 0;
		try {
			result = noticeDao.noticeUpdateOk(nvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 공지사항삭제 구현
	@Override
	public int noticeDelete(int n_num) {
		int result = 0;
		try {
			result = noticeDao.noticeDelete(n_num);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 전체 레코드 수 구현
	@Override
	public int noticeListCnt(NoticeVO nvo) {
		return noticeDao.noticeListCnt(nvo);
	}
}
