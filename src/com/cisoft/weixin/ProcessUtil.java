//package com.cisoft.weixin;
//
//import java.io.UnsupportedEncodingException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//import org.jfree.util.Log;
//
//
//public class ProcessUtil {
//	public String responeclick(String msgtype,String event,String eventkey,String content) throws UnsupportedEncodingException{
//		StringBuilder sb=new StringBuilder();
//		if(msgtype.equals("event")&&event.equals("CLICK")){//自定义菜单
//			if(eventkey.equals("apply")){
//				String str=new String("点击查看最新选派信息".getBytes("UTF-8"));
//				sb.append("<a href='http://zjcy.gxqts.gov.cn/pages_weixinlogin'>"+str+"</a>");
//			}else if(eventkey.equals("searchpublish")){
//				sb.append("请输入以下序号进行查询:\n");
//				sb.append("1:最近七天发布的选派信息\n");
//				sb.append("2:最近30天发布的选派信息\n");
//				sb.append("3:本月发布的选派信息\n");
//				//sb.append("4:上个月发布的选派信息");
//			}else if(eventkey.equals("searchselected")){
//				sb.append("请按以下格式输入:\n");
//				sb.append("姓名/序号\n");
//				sb.append("11:查看本月获选信息\n");
//				sb.append("22:查看所有获选信息");
//				//sb.append("22:查看上个月获选信息\n");
//			}
//		}else if(msgtype.equals("text")){//文本推送
//			sb.append("sb");
//		}
//		return sb.toString();
//	}
//	
////	public String responsetext(Publish publish,List<Result> results){
////		StringBuilder sb=new StringBuilder();
////		if(results.isEmpty()){							
////			sb.append(publish.getPublishcode()).append(":").append("暂无\n");
////		}else{
////			sb.append(publish.getPublishcode()).append(":");
////			for (Result result : results){
////				sb.append(result.getExpert().getName()).append(",");
////			}
////			sb.append("\n");
////		}
////		return sb.toString();
////	}
//	
//	public String responsedetail(PublishIndustry publishIndustry,List<Result> results){
//		StringBuilder sb=new StringBuilder();
//		sb.append(publishIndustry.getIndustryname()).append(":");
//		if(results.isEmpty()){
//			sb.append("暂无");
//		}else{
//			for (Result result : results) {
//				sb.append(result.getExpert().getName()).append(",");
//			}
//		}
//		return sb.toString();
//	}
//	
//	public String responseself(List<Result> results,List<PublishIndustry> publishIndustries){
//		StringBuilder sb=new StringBuilder();
//		if(results.isEmpty()){
//			sb.append("暂无获选记录\n");
//		}else{			
//			for (Result result : results) {
//				Date d=result.getPublish().getExaminedate();
//				SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
//				
//				sb.append("编号:").append(result.getPublish().getPublishcode()).append("\n");
//				sb.append("审查日期:").append(dateFormat.format(d)).append("\n");
//				
//				sb.append("专业:");
//				for (PublishIndustry publishIndustry : publishIndustries) {
//					if(result.getIndustryid()==publishIndustry.getIndustryid()){
//						sb.append(publishIndustry.getIndustryname());
//					}
//				}
//				sb.append("\n\n");
//			}
//		}
//		return sb.toString();
//	}
//}
