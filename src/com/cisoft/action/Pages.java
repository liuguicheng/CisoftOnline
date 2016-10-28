package com.cisoft.action;

import com.cisoft.model.PageResponse;

public class Pages<T> extends BaseController{
	//用来接受前端传递过来的值
	protected int page;
	protected int rows;
	//用来返回
	protected PageResponse<T> pageResponse=new PageResponse<T>();
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public PageResponse<T> getPageResponse() {
		return pageResponse;
	}
	
	
}
