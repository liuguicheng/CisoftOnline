package com.cisoft.action;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.TemplateLabel;
import com.cisoft.service.TemplateLabelService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 模版标签
 * @author lgc
 *
 */
public class TemplateLabelAction extends Pages<TemplateLabel> implements ModelDriven<TemplateLabel>{

	private TemplateLabel templateLabel=new TemplateLabel();
	public TemplateLabel getModel() {
		// TODO Auto-generated method stub
		return templateLabel;
	}
	@Resource
	TemplateLabelService templateLabelService;
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(templateLabelService.findbrandlistby(templateLabel));
		pageResponse.setTotal(0);
		return "list";
	}		
	
	public String save(){
		
		if(templateLabel.getTl_id()==0){
			templateLabel.setTl_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		templateLabelService.save(templateLabel);
		return "save";
	}
	
	public String addView(){
		List<TemplateLabel> cs=this.templateLabelService.findbrandlist();
		ServletActionContext.getContext().put("templateLabel", cs);
		return "addView";
	}
	public String editView(){
		List<TemplateLabel> cs=this.templateLabelService.findbrandlist();
		ServletActionContext.getContext().put("templateLabel", cs);
		templateLabel=templateLabelService.findById(templateLabel);
		ServletActionContext.getContext().getValueStack().push(templateLabel);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		TemplateLabel templateLabelinfo =templateLabelService.findById(templateLabel);
		templateLabelService.save(templateLabelinfo);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		List<TemplateLabel> cblist=templateLabelService.findbrandlistby(templateLabel);
		if(cblist.size()>0){
			result="你选择的属于父类,不能删除";
			return "delete";
		}
		TemplateLabel templateLabelinfo =templateLabelService.findById(templateLabel);
		templateLabelinfo.setTl_scbs(0);
		templateLabelService.save(templateLabelinfo);
		result="删除成功";
		return "delete";
	}
	
	
	private File fileProductPic;
	private String fileProductPicFileName;
	
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
	private static final int BUFFER_SIZE = 16 * 1024;
	/**
	 * 上传商品缩略图
	 */

	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}
}