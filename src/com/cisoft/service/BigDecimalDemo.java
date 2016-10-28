package com.cisoft.service;

import java.math.*;

public class BigDecimalDemo {
	
	public  double add(double d1,double d2){
		BigDecimal b1=new BigDecimal(Double.toString(d1));
		BigDecimal b2=new BigDecimal(Double.toString(d2));
		return b1.add(b2).doubleValue();
		
	}
	
	public  double sub(double d1,double d2){
		BigDecimal b1=new BigDecimal(Double.toString(d1));
		BigDecimal b2=new BigDecimal(Double.toString(d2));
		return b1.subtract(b2).doubleValue();
		
	}
	
	public  double mul(double d1,double d2){
		BigDecimal b1=new BigDecimal(Double.toString(d1));
		BigDecimal b2=new BigDecimal(Double.toString(d2));
		return b1.multiply(b2).doubleValue();
		
	}
	
//	public static double div(double d1,double d2){
//
//		return div(d1,d2,DEF_DIV_SCALE);
//		
//	}
//	
//	public static double div(double d1,double d2,int scale){
//		if(scale<0){
//			throw new IllegalArgumentException("The scale must be a positive integer or zero");
//		}
//		BigDecimal b1=new BigDecimal(Double.toString(d1));
//		BigDecimal b2=new BigDecimal(Double.toString(d2));
//		return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
//		
//	}
	
}