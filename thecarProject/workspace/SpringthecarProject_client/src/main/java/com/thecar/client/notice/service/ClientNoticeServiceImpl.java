package com.thecar.client.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.admin.notice.dao.NoticeDao;
import com.thecar.admin.notice.vo.NoticeVO;

@Service
@Transactional
public class ClientNoticeServiceImpl implements ClientNoticeService {

	@Autowired
	private NoticeDao noticeDao;

	// 공지사항목록 구현
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> n_List = null;

		n_List = noticeDao.noticeList(nvo);
		return n_List;
	}

	// 공지사항상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
		return detail;
	}

	// 전체 레코드 수 구현
	@Override
	public int noticeListCnt(NoticeVO nvo) {
		return noticeDao.noticeListCnt(nvo);
	}

}
