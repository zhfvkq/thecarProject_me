package com.thecar.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.thecar.admin.notice.vo.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession session;

	// 공지사항목록 구현
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		return session.selectList("noticeList", nvo);
	}

	// 공지사항입력 구현
	@Override
	public int noticeInsert(NoticeVO nvo) {
		return session.insert("noticeInsert", nvo);
	}

	// 공지사항상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		return (NoticeVO) session.selectOne("noticeDetail", nvo);
	}

	// 공지사항수정 구현
	@Override
	public int noticeUpdateOk(NoticeVO nvo) {
		return session.update("noticeUpdateOk", nvo);
	}

	// 공지사항삭제 구현
	@Override
	public int noticeDelete(int n_num) {
		return session.delete("noticeDelete", n_num);
	}

	// 전체 레코드 건수 구현
	@Override
	public int noticeListCnt(NoticeVO nvo) {
		return (Integer) session.selectOne("noticeListCnt");
	}
}
