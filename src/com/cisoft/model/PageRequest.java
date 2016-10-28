package com.cisoft.model;

import javax.persistence.Transient;

import org.hibernate.criterion.DetachedCriteria;

public class PageRequest {
	@Transient
	private int page;//当前页数
	@Transient
	private int rows;//每页多少条数据
	@Transient
	private int firstsize;//当前页的第一条数据
	
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
	
	public int getFirstsize() {
		return (page-1)*rows;//返回每一页的首行
	}
	public void setFirstsize(int firstsize) {
		this.firstsize = firstsize;
	}
}
