package com.thecar.client.notice.service;

import java.util.List;

import com.thecar.admin.notice.vo.NoticeVO;

public interface ClientNoticeService {

	public List<NoticeVO> noticeList(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);

	public int noticeListCnt(NoticeVO nvo);

}
