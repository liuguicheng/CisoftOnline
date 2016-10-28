package com.cisoft.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.cisoft.model.Commodity;
import com.cisoft.model.CommodityBrand;
import com.cisoft.model.CommoditySort;
import com.cisoft.model.GYSInfo;
import com.cisoft.model.Member;
import com.cisoft.model.MembershipGrade;

public class ParseExcel {

	
	public static List<Commodity> doexcel(String filename){
		  
		  try{
		File file = new File(filename);

	       String[][] result = getData(file, 1);

	       int rowLength = result.length;
	       Commodity comm=new Commodity();
	       List<Commodity> commoditylist=new ArrayList<Commodity>();
	       for(int i=1;i<rowLength;i++) {
	    	   comm=new Commodity();
	           //for(int j=1;j<result[i].length;j++) {

//	              System.out.print(result[i][0]+"\t\t");
	              //商品货号
	              comm.setC_spbh(result[i][0]);
	              //商品标题
	              comm.setC_jdname(result[i][1]);
	              //商品名称
	              comm.setC_name(result[i][2]);
	              //品牌
	              CommodityBrand cb=new CommodityBrand();
	              cb.setCb_id(Integer.valueOf(result[i][3]));
	              comm.setCommodityBrand(cb);
	              //分类
	              CommoditySort cs=new CommoditySort();
	              cs.setCs_id(Integer.valueOf(result[i][4]));
	              comm.setCommoditySort(cs);
	              //供应商
	              GYSInfo gysinfo=new GYSInfo();
	              gysinfo.setG_id(Integer.valueOf(result[i][5]));
	              comm.setGysInfo(gysinfo);
	              //市场价
	              comm.setC_scjg(Double.valueOf(result[i][6]));
	              //销售价
	              comm.setC_jg(Double.valueOf(result[i][7]));
	              //成本价
	              comm.setC_jhjg(Double.valueOf(result[i][8]));
	              //规格
	              comm.setC_gg(result[i][9]);
	              //是否上架
	              
	               comm.setC_sj(Integer.valueOf(result[i][10]));  
	              //库存
	               comm.setC_ck(Integer.valueOf(result[i][11]));
	              //库存预警
	               comm.setC_ckyj(Double.valueOf(result[i][12]));
	              //商品缩略图
	               comm.setC_sltimg(result[i][13]);
	              //商品形象图
	               comm.setC_spxximg(result[i][14]);
	              //商品图
	               comm.setC_spimg(result[i][15]);
	              //商品描述
	               comm.setC_spms(result[i][16]);
	              //删除标识
	               comm.setC_scbs(1);

	           //}
	           commoditylist.add(comm);
	       }
	       
	       
	       return commoditylist;
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  return new ArrayList<Commodity>();
	}
	
	
	public static List<Member> doexceld(String filename){
		  
		  try{
		File file = new File(filename);

	       String[][] result = getData(file, 1);

	       int rowLength = result.length;
	       Member member=new Member();
	       List<Member> members=new ArrayList<Member>();
	       for(int i=0;i<rowLength;i++) {
	    	   member=new Member();
	    	   member.setM_loginname(result[i][0]);
	    	   member.setM_email(result[i][2]);
	    	   member.setM_pwd(result[i][1]);
	    	   member.setM_name(result[i][3]);
	    	   SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
	    	   member.setM_csrq(sdf.parse(result[i][8]));
	    	   member.setM_address(result[i][7]);
	    	   member.setM_phone(result[i][5]);
	    	   member.setM_qq(result[i][6]);
	    	   member.setM_scbs(1);
	    	   member.setM_xb(Integer.parseInt(result[i][9]));
	    	   member.setM_zcsj(new Date());
	    	   MembershipGrade mg=new MembershipGrade();
	    	   mg.setMg_id(Integer.parseInt(result[i][4]));
	    	   member.setMgrad(mg);
	           members.add(member);
	       }
	       
	       
	       return members;
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  return new ArrayList<Member>();
	}
	
	/**

     * 读取Excel的内容，第一维数组存储的是一行中格列的值，二维数组存储的是多少个行

     * @param file 读取数据的源Excel

     * @param ignoreRows 读取数据忽略的行数，比喻行头不需要读入 忽略的行数为1

     * @return 读出的Excel中数据的内容

     * @throws FileNotFoundException

     * @throws IOException

     */

    public static String[][] getData(File file, int ignoreRows)

           throws FileNotFoundException, IOException {

       List<String[]> result = new ArrayList<String[]>();

       int rowSize = 0;

       BufferedInputStream in = new BufferedInputStream(new FileInputStream(

              file));

       // 打开HSSFWorkbook

       POIFSFileSystem fs = new POIFSFileSystem(in);

       HSSFWorkbook wb = new HSSFWorkbook(fs);

       HSSFCell cell = null;

       for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {

           HSSFSheet st = wb.getSheetAt(sheetIndex);

           // 第一行为标题，不取

           for (int rowIndex = ignoreRows; rowIndex <= st.getLastRowNum(); rowIndex++) {

              HSSFRow row = st.getRow(rowIndex);

              if (row == null) {

                  continue;

              }

              int tempRowSize = row.getLastCellNum() + 1;

              if (tempRowSize > rowSize) {

                  rowSize = tempRowSize;

              }

              String[] values = new String[rowSize];

              Arrays.fill(values, "");

              boolean hasValue = false;

              for (short columnIndex = 0; columnIndex <= row.getLastCellNum(); columnIndex++) {

                  String value = "";

                  cell = row.getCell(columnIndex);

                  if (cell != null) {

                     // 注意：一定要设成这个，否则可能会出现乱码

                    // cell.setEncoding(HSSFCell.ENCODING_UTF_16);

                     switch (cell.getCellType()) {

                     case HSSFCell.CELL_TYPE_STRING:

                         value = cell.getStringCellValue();

                         break;

                     case HSSFCell.CELL_TYPE_NUMERIC:

                         if (HSSFDateUtil.isCellDateFormatted(cell)) {

                            Date date = cell.getDateCellValue();

                            if (date != null) {

                                value = new SimpleDateFormat("yyyy-MM-dd")

                                       .format(date);

                            } else {

                                value = "";

                            }

                         } else {

                            value = new DecimalFormat("0").format(cell

                                   .getNumericCellValue());

                         }

                         break;

                     case HSSFCell.CELL_TYPE_FORMULA:

                         // 导入时如果为公式生成的数据则无值

                         if (!cell.getStringCellValue().equals("")) {

                            value = cell.getStringCellValue();

                         } else {

                            value = cell.getNumericCellValue() + "";

                         }

                         break;

                     case HSSFCell.CELL_TYPE_BLANK:

                         break;

                     case HSSFCell.CELL_TYPE_ERROR:

                         value = "";

                         break;

                     case HSSFCell.CELL_TYPE_BOOLEAN:

                         value = (cell.getBooleanCellValue() == true ? "Y"

                                : "N");

                         break;

                     default:

                         value = "";

                     }

                  }

                  if (columnIndex == 0 && value.trim().equals("")) {

                     break;

                  }

                  values[columnIndex] = rightTrim(value);

                  hasValue = true;

              }

 

              if (hasValue) {

                  result.add(values);

              }

           }

       }

       in.close();

       String[][] returnArray = new String[result.size()][rowSize];

       for (int i = 0; i < returnArray.length; i++) {

           returnArray[i] = (String[]) result.get(i);

       }

       return returnArray;

    }

   

    /**

     * 去掉字符串右边的空格

     * @param str 要处理的字符串

     * @return 处理后的字符串

     */

     public static String rightTrim(String str) {

       if (str == null) {

           return "";

       }

       int length = str.length();

       for (int i = length - 1; i >= 0; i--) {

           if (str.charAt(i) != 0x20) {

              break;

           }

           length--;

       }

       return str.substring(0, length);

    }



}
