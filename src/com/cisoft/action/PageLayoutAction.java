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
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.PageLayout;
import com.cisoft.model.Template;
import com.cisoft.model.TemplateLabel;
import com.cisoft.service.PageLayoutService;
import com.cisoft.service.TemplateLabelService;
import com.cisoft.service.TemplateService;
import com.cisoft.utils.FreeMarkerTest;
import com.cisoft.utils.Unit;
import com.cisoft.utils.Until;
import com.cisoft.utils.UplodImg;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 页面布局
 * 
 * @author lgc
 * 
 */
public class PageLayoutAction extends Pages<PageLayout> implements
		ModelDriven<PageLayout> {

	private PageLayout pagelayout = new PageLayout();

	public PageLayout getModel() {
		// TODO Auto-generated method stub
		return pagelayout;
	}

	@Resource
	PageLayoutService pageLayoutService;
	@Resource
	TemplateService templateService;
	@Resource
	TemplateLabelService templateLabelService;
	private String result = "";

	public String getResult() {
		return result;
	}

	public String getList() {
		pageResponse.setRows(pageLayoutService.getList(pagelayout));
		pageResponse.setTotal(pageLayoutService.getCount(pagelayout));
		return "list";
	}

	public String save() {
		if (pagelayout.getPl_id() == 0) {
			pagelayout.setPl_scbs(1);
			result = "添加成功";
		} else {
			pagelayout.setPl_jtbs(0);
			pagelayout.setPl_fbbs(0);
			result = "修改成功";
		}
		pageLayoutService.save(pagelayout);
		return "save";
	}

	public String addView() {
		List<Template> telist = templateService.findnoParent();
		ServletActionContext.getContext().put("telist", telist);
		return "addView";
	}

	public String editView() {
		List<Template> telist = templateService.findnoParent();
		ServletActionContext.getContext().put("telist", telist);
		pagelayout = pageLayoutService.findById(pagelayout);
		ServletActionContext.getContext().getValueStack().push(pagelayout);
		return "editView";
	}

	

	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete() {
		List<PageLayout> cblist = pageLayoutService.findbrandlistby(pagelayout);
		if (cblist.size() > 0) {
			result = "你选择的属于父类,不能删除";
			return "delete";
		}
		PageLayout pagelayoutinfo = pageLayoutService.findById(pagelayout);
		pagelayoutinfo.setPl_scbs(0);
		pageLayoutService.save(pagelayoutinfo);
		result = "删除成功";
		return "delete";
	}

	// 选择模版 查询模版内容
	public String selectTemplate() {
		if (result != null && !"".equals(result)) {
			Template te = new Template();
			te.setT_id(Integer.parseInt(result));
			te = this.templateService.findById(te);
			result = "";
			if (te != null) {
				String urlstr = te.getT_url();
				if (urlstr != null && !"".equals(urlstr)) {
					try {
						BufferedReader br = new BufferedReader(new FileReader(
								urlstr));
						String data = br.readLine();// 一次读入一行，直到读入null为文件结束
						// 判断是否只有一行
						int i = 0;
						result = "";
						while (data != null) {
							System.out.println(data);
							result += data;
							data = br.readLine();
							i++;
						}

					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}
			}
		}
		return "save";
	}

	// 查询所有模版标签
	public String selecttemplelable() {
		List<TemplateLabel> tllist = this.templateLabelService
				.findbrandlistby(null);
		ServletActionContext.getContext().put("tllist", tllist);
		return "selecttemplelablesuccess";
	}

	/**
	 * 模版预览 生成实体文件
	 */
	public String ylpage() {
		pagelayout = this.pageLayoutService.findById(pagelayout);
		if (pagelayout != null) {
			try {
				String url = "";
				if (pagelayout.getPl_url() == null||"".equals(pagelayout.getPl_url())) 
				{
					String imageFileName = new Date().getTime()
							+ UplodImg.getExtention(pagelayout.getPl_name()
									+ ".ftl");
					url = Until.pathstr() + imageFileName;
				} else {
					url = pagelayout.getPl_url();
				}
				if (!"".equals(url)&&url!=null) {
					// 声明字符输出流
					FileWriter out = null;
					// 通过子类实例化，表示可以追加
					out = new FileWriter(url, false);
					// 写入数据
					out.write(pagelayout.getPl_context());
					out.close();
					result = url;
					pagelayout.setPl_url(result);
					pagelayout.setPl_jtbs(1);
					this.pageLayoutService.save(pagelayout);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return "ylpagesuccess";
	}

	/**
	 * 发布
	 */
	public String releasePage() {
		pagelayout = this.pageLayoutService.findById(pagelayout);
		if (pagelayout != null) {
			try {
				String url = "";
				if (pagelayout.getPl_url() != null||!"".equals(pagelayout.getPl_url())) 
				{
					url = pagelayout.getPl_url();
				}
				if (!"".equals(url)&&url!=null) {
						try {
							int pos = url.lastIndexOf("/");
							String templatename= url.substring(pos);
							FreeMarkerTest.testFreemarker(Until.pathstr(), templatename, "index.html");
							pagelayout.setPl_fbbs(1);
							this.pageLayoutService.save(pagelayout);
							result = "操作成功";
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
					
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return "savembsuccess";
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

	public void setResult(String result) {
		this.result = result;
	}
}