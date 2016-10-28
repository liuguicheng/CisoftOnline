package com.cisoft.utils;
/*
 * 自定义异常
 */
public class ExpertSelectException extends RuntimeException{
	public ExpertSelectException(String message){
		super(message);
	}
	public ExpertSelectException(Throwable throwable){
		super(throwable);
	}
	public ExpertSelectException(){
		super();
	}
}
