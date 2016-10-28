package com.cisoft.model;

import java.util.ArrayList;
import java.util.List;

public class MenuTree {
	private int id;
	private String text;
	private List<MenuTree> children=new ArrayList<MenuTree>();
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<MenuTree> getChildren() {
		return children;
	}
	public void setChildren(List<MenuTree> children) {
		this.children = children;
	}
	
	
}
