package com.thecar.admin.notice.dao;

import java.util.List;

import com.thecar.admin.notice.vo.NoticeVO;

public interface NoticeDao {

	public List<NoticeVO> noticeList(NoticeVO nvo);

	public int noticeInsert(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);

	public int noticeUpdateOk(NoticeVO nvo);

	public int noticeDelete(int n_num);

	public int noticeListCnt(NoticeVO nvo);

}