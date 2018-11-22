package com.backstage.util;

public class Page {
	private int currentPageNo=1;//当前页
	private int pageSize=0;//页大小
	private int totalCount=0;//总记录数
	private int totalPageCount=0;//总页数

	public void setTotalPageCount() {
		if(this.totalCount % this.pageSize == 0) {
			this.totalPageCount=this.totalCount / this.pageSize;
		}
		if(this.totalCount % this.pageSize != 0) {
			this.totalPageCount=this.totalCount / this.pageSize + 1;
		}
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
}
