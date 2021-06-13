package com.thecar.common.vo;

public class PagingVO {
	
	private int totalCnt;
	private int maxSection;
	private int maxPage;
	private int section;
	private int page;
	
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getMaxSection() {
		return maxSection;
	}
	public void setMaxSection(int maxSection) {
		this.maxSection = maxSection;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getSection() {
		return section;
	}
	public void setSection(int section) {
		this.section = section;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	
}
