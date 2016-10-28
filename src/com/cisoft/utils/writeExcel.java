package com.cisoft.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.cisoft.model.Commodity;
import com.cisoft.model.Member;

import jxl.Workbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class writeExcel {

	
	
	/**
	    * 导出数据为XLS格式
	    * @param fos 生成Excel文件Path
	    * @param bo 要导入的数据
	    */
	   public   void  writeExcelBo(String fos, java.util.List ve,int ppid,int flid,int gysid)
	   {
	    jxl.write.WritableWorkbook wwb;
	    try
	    {
	    	int ad=1;
	     if(ve!=null){
	    	 ad=ve.size();
	     }
	     wwb= Workbook.createWorkbook(new File(fos));
	     jxl.write.WritableSheet ws= wwb.createSheet("商品信息",ad);
	     ws.addCell(new jxl.write.Label(0, 1, "商品货号"));
	     ws.addCell(new jxl.write.Label(1, 1, "商品标题"));
	     ws.addCell(new jxl.write.Label(2, 1, "商品名称"));
	     ws.addCell(new jxl.write.Label(3, 1, "品牌"));
	     ws.addCell(new jxl.write.Label(4, 1, "分类"));
	     ws.addCell(new jxl.write.Label(5, 1, "供应商"));
	     ws.addCell(new jxl.write.Label(6, 1, "市场价"));
	     ws.addCell(new jxl.write.Label(7, 1, "销售价"));
	     ws.addCell(new jxl.write.Label(8, 1, "成本价"));
	     ws.addCell(new jxl.write.Label(9, 1, "规格"));
	     ws.addCell(new jxl.write.Label(10, 1, "上架"));
	     ws.addCell(new jxl.write.Label(11, 1, "库存"));
	     ws.addCell(new jxl.write.Label(12, 1, "库存预警"));
	     ws.addCell(new jxl.write.Label(13, 1, "商品缩略图"));
	     ws.addCell(new jxl.write.Label(14, 1, "商品形象图"));
	     ws.addCell(new jxl.write.Label(15, 1, "商品图"));
	     ws.addCell(new jxl.write.Label(16, 1, "商品描述"));
	     if(ppid!=0){
	    	 ws.addCell(new jxl.write.Label(3, 0 + 2,String.valueOf(ppid)));
	     }
	     if(flid!=0){
	         ws.addCell(new jxl.write.Label(4, 0 + 2,String.valueOf(flid)));
	     }
	     if(gysid!=0){
	    	 ws.addCell(new jxl.write.Label(5, 0 + 2,String.valueOf(gysid)));
	     }
	    	 
	    	 if(ve!=null){
	    	 Commodity comm=new Commodity();
		     for (int i= 0; i < ad; i++)
		     {
		      comm= (Commodity)ve.get(i);
		        //商品货号
		      	ws.addCell(new jxl.write.Label(0, i + 2,comm.getC_spbh()));
		      //商品标题
		      	ws.addCell(new jxl.write.Label(1, i + 2,comm.getC_jdname()));
		      //商品名称
		      	ws.addCell(new jxl.write.Label(2, i + 2,comm.getC_name()));
		      //商品品牌
		      	ws.addCell(new jxl.write.Label(3, i + 2,comm.getCommodityBrand().getCb_name()));
		      //商品分类
		      	ws.addCell(new jxl.write.Label(4, i + 2,comm.getCommoditySort().getCs_name()));
		      //商品供应商
		      	ws.addCell(new jxl.write.Label(5, i + 2,comm.getGysInfo().getG_name()));
		      //商品市场价
		      	ws.addCell(new jxl.write.Label(6, i + 2,String.valueOf(comm.getC_scjg())));
		      //商品销售价
		      	ws.addCell(new jxl.write.Label(7, i + 2,String.valueOf(comm.getC_jg())));
		      //商品成本价
		      	ws.addCell(new jxl.write.Label(8, i + 2,String.valueOf(comm.getC_jhjg())));
		    	//商品规格
		      	ws.addCell(new jxl.write.Label(9, i + 2,""));
		      //上架
		      	String sj="";
		      	if(comm.getC_sj()==1){
		      		 sj="上架";
		      	}else if(comm.getC_sj()==2){
		      		sj="下架";
		      	}
		      	ws.addCell(new jxl.write.Label(10, i + 2,sj));
		      //库存
		      	ws.addCell(new jxl.write.Label(11, i + 2,String.valueOf(comm.getC_ck())));
		      //库存预警
		      	ws.addCell(new jxl.write.Label(12, i + 2,String.valueOf(comm.getC_ckyj())));
		      //商品缩略图
		      	ws.addCell(new jxl.write.Label(13, i + 2,comm.getC_sltimg()));
		      //商品形象图
		      	ws.addCell(new jxl.write.Label(14, i + 2,comm.getC_spxximg()));
		      //商品图
		      	ws.addCell(new jxl.write.Label(15, i + 2,comm.getC_spimg()));
		      //商品描述
		      	ws.addCell(new jxl.write.Label(16, i + 2,comm.getC_spms()));
		      	
		     }
	     }
	     
	     ws.addCell(new jxl.write.Label(0, 0, "商品信息"));
	     
	     wwb.write();
	      // 关闭Excel工作薄对象
	     wwb.close();
	    } catch (IOException e){
	    } catch (RowsExceededException e){
	    
	    } catch (WriteException e){
	    }
	   }

	public void writeExcelmember(String resultss, List<Member> memeberList,
			int ii, int j, int k) {
		jxl.write.WritableWorkbook wwb;
	    try
	    {
	    	int ad=1;
	     if(memeberList!=null){
	    	 ad=memeberList.size();
	     }
	     wwb= Workbook.createWorkbook(new File(resultss));
	     jxl.write.WritableSheet ws= wwb.createSheet("会员信息",ad);
	     ws.addCell(new jxl.write.Label(0, 1, "登录账号"));
	     ws.addCell(new jxl.write.Label(1, 1, "登录密码"));
	     ws.addCell(new jxl.write.Label(2, 1, "常用邮箱"));
	     ws.addCell(new jxl.write.Label(3, 1, "真实姓名"));
	     ws.addCell(new jxl.write.Label(4, 1, "会员等级"));
	     ws.addCell(new jxl.write.Label(5, 1, "联系手机"));
	     ws.addCell(new jxl.write.Label(6, 1, "qq"));
	     ws.addCell(new jxl.write.Label(7, 1, "所属地区"));
	     ws.addCell(new jxl.write.Label(8, 1, "出生日期"));
	     ws.addCell(new jxl.write.Label(9, 1, "性别"));
	    
	    	 
	    	 if(memeberList!=null){
	    	 Member comm=new Member();
		     for (int i= 0; i < ad; i++)
		     {
		      comm= (Member)memeberList.get(i);
		      	ws.addCell(new jxl.write.Label(0, i + 2,comm.getM_loginname()));
		      	ws.addCell(new jxl.write.Label(1, i + 2,comm.getM_pwd()));
		      	ws.addCell(new jxl.write.Label(2, i + 2,comm.getM_email()));
		      	ws.addCell(new jxl.write.Label(3, i + 2,comm.getM_name()));
		      	String name="";
		      	if(comm.getMgrad()!=null){
		      		name=comm.getMgrad().getMg_name();
		      				}
		      	ws.addCell(new jxl.write.Label(4, i + 2,name));
		      	ws.addCell(new jxl.write.Label(5, i + 2,comm.getM_phone()));
		      	ws.addCell(new jxl.write.Label(6, i + 2,comm.getM_qq()));
		      	ws.addCell(new jxl.write.Label(7, i + 2,comm.getM_address()));
		      	String da="";
		      	if(comm.getM_csrq()!=null){
		      		
		      		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		      		da=sdf.format(comm.getM_csrq());
		      	}
		      	ws.addCell(new jxl.write.Label(8, i + 2,da));
		      	String xb="";
		      	if(comm.getM_xb()==0){
		      		xb="男";
		      	}else{
		      		xb="女";
		      	}
		      	ws.addCell(new jxl.write.Label(9, i + 2,xb));
		      	
		     }
	     }
	     
	     ws.addCell(new jxl.write.Label(0, 0, "会员信息"));
	     
	     wwb.write();
	      // 关闭Excel工作薄对象
	     wwb.close();
	    } catch (IOException e){
	    } catch (RowsExceededException e){
	    
	    } catch (WriteException e){
	    }
		
	}
}
