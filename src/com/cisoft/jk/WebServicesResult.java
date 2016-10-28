package com.cisoft.jk;

import java.util.ArrayList;

import org.apache.struts2.json.annotations.JSON;



public class WebServicesResult {
//	String status;
	String message;
	
	ArrayList lists;
	public ArrayList getLists() {
		return lists;
	}

	public void setLists(ArrayList lists) {
		this.lists = lists;
	}

//	public String getStatus() {
//		return status;
//	}
//
//	public void setStatus(String status) {
//		this.status = status;
//	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
