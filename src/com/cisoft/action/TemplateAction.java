package com.cisoft.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Template;
import com.cisoft.service.TemplateService;
import com.cisoft.utils.FreeMarkerTest;
import com.cisoft.utils.Until;
import com.cisoft.utils.UplodImg;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 模版管理
 * 
 * @author lgc
 * 
 */
public class TemplateAction extends Pages<Template> implements
		ModelDriven<Template> {

	private Template template = new Template();

	public Template getModel() {
		// TODO Auto-generated method stub
		return template;
	}

	private File fileProductPic;
	private String fileProductPicFileName;
	private File fileProductPicst;
	private String fileProductPicstFileName;

	@Resource
	TemplateService templateService;
	private String result = "";

	public String getResult() {
		return result;
	}

	public String getList() {
		pageResponse.setRows(templateService.findParentby(template));
		pageResponse.setTotal(0);
		return "list";
	}

	public String save() {
		if (fileProductPicFileName != null) {
			// 存储缩略图
			String imageFileName = new Date().getTime()
					+ UplodImg.getExtention(fileProductPicFileName);
			// 获取tomcat路径
			// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
			String cfurl = Until.pathstr() + imageFileName;
			File newfile = new File(cfurl);
			UplodImg.copy(fileProductPic, newfile);
			template.setT_sltimg(cfurl);
		}
		if (fileProductPicstFileName != null) {
			// 存储缩略图
			String imageFileName = new Date().getTime()
					+ UplodImg.getExtention(fileProductPicstFileName);
			// 获取tomcat路径
			// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
			String cfurl = Until.pathstr() + imageFileName;
			UplodImg.upfile(fileProductPicst, cfurl);
			template.setT_url(cfurl);
		}
		if (template.getT_id() == 0) {
			template.setT_scbs(1);
			result = "添加成功";
		} else {
			result = "修改成功";
		}
		templateService.save(template);
		return "save";
	}

	public String addView() {
		List<Template> cs = this.templateService.findParent();
		ServletActionContext.getContext().put("template", cs);
		return "addView";
	}

	public String editView() {
		List<Template> cs = this.templateService.findParent();
		ServletActionContext.getContext().put("template", cs);
		template = templateService.findById(template);
		ServletActionContext.getContext().getValueStack().push(template);
		return "editView";
	}

	// 修改信息
	public String updatepwd() {
		Template templateinfo = templateService.findById(template);
		templateService.save(templateinfo);
		result = "修改成功";
		return "updatepwd";
	}

	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete() {
		List<Template> cslist = this.templateService.findParentby(template);
		if (cslist.size() > 0) {
			result = "你选择的属于父类,不能删除";
			return "delete";
		}
		Template templateinfo = templateService.findById(template);
		templateinfo.setT_scbs(0);
		templateService.save(templateinfo);
		result = "删除成功";
		return "delete";
	}

	/**
	 * 在线编辑
	 * 
	 * @return
	 */
	public String zxbj() {
		template = templateService.findById(template);
		if (template != null) {
			result = template.getT_url();
			try {
				BufferedReader br = new BufferedReader(new FileReader(result));
				String data = br.readLine();// 一次读入一行，直到读入null为文件结束
				//判断是否只有一行
				int i = 0;
				result = "";
				while (data != null) {
					System.out.println(data);
					result+=data;
					data = br.readLine(); 
					i++;
				}
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return "zxbjsuccess";
	}

	/**
	 * 保存模版
	 * 
	 * @return
	 */
	public String savemb() {
		template = templateService.findById(template);
		if (template != null) {
			try {
				// 声明字符输出流
				FileWriter out = null;
				// 通过子类实例化，表示可以追加
				out = new FileWriter(template.getT_url(), false);
				// 写入数据
				out.write(result);
				out.close();
				result = "操作成功";
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return "savembsuccess";
	}

	
	/**
	 * 判断店铺模版
	 * @return
	 */
	
	public String dpmb(){
		//获取选择商铺商家信息
		
		//判断店铺首页模版
//		if(){
//			
//		}
		return "";
	}
	
	
	public File getFileProductPic() {
		
		return fileProductPic;
	}

	public void setFileProductPic(File fileProductPic) {
		this.fileProductPic = fileProductPic;
	}

	public String getFileProductPicFileName() {
		return fileProductPicFileName;
	}

	public void setFileProductPicFileName(String fileProductPicFileName) {
		this.fileProductPicFileName = fileProductPicFileName;
	}

	public File getFileProductPicst() {
		return fileProductPicst;
	}

	public void setFileProductPicst(File fileProductPicst) {
		this.fileProductPicst = fileProductPicst;
	}

	public String getFileProductPicstFileName() {
		return fileProductPicstFileName;
	}

	public void setFileProductPicstFileName(String fileProductPicstFileName) {
		this.fileProductPicstFileName = fileProductPicstFileName;
	}

	public Template getTemplate() {
		return template;
	}

	public void setTemplate(Template template) {
		this.template = template;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
