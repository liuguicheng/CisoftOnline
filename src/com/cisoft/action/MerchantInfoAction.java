package com.cisoft.action;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.MerchantClass;
import com.cisoft.model.MerchantInfo;
import com.cisoft.model.User;
import com.cisoft.service.MerchantClassService;
import com.cisoft.service.MerchantInfoService;
import com.cisoft.service.UserService;
import com.cisoft.utils.Unit;
import com.cisoft.utils.Until;
import com.cisoft.utils.UplodImg;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 商家信息设置
 * @author pro
 *
 */
public class MerchantInfoAction extends Pages<MerchantInfo> implements ModelDriven<MerchantInfo>{
	private MerchantInfo merchantInfo=new MerchantInfo();
	public MerchantInfo getModel() {
		return merchantInfo;
	}
	
	private String result = "";

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Resource
	private MerchantInfoService merchantInfoService;
	@Resource
	private MerchantClassService merchantClassService;
	
	private File fileProductPic;
	private String fileProductPicFileName;
	
	
	public MerchantInfo getMerchantInfo() {
		return merchantInfo;
	}


	public void setMerchantInfo(MerchantInfo merchantInfo) {
		this.merchantInfo = merchantInfo;
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


	public String save(){
		if(fileProductPicFileName!=null){
			// 存储缩略图
						String imageFileName = new Date().getTime()
								+UplodImg.getExtention(fileProductPicFileName);
						//获取tomcat路径
						// cfurl=ServletActionContext.getServletContext().getRealPath("/commdityimg")+"/"+imageFileName;//存放地址
						String cfurl =Until.pathstr()+ imageFileName;
						File newfile = new File(cfurl);
						UplodImg.copy(fileProductPic, newfile);
						merchantInfo.setMi_logourl(cfurl);
			}
		
		if(merchantInfo.getMi_id()!=0){
			
		}else{
			merchantInfo.setMi_scbs(1);
			merchantInfo.setMi_starttime(new Date());
		}
		
		merchantInfoService.save(merchantInfo);
		result="保存成功";
		return "save";
	}
	
	
	public String editView(){
		mclass=merchantClassService.getList();
		ServletActionContext.getContext().put("mclass", mclass);
		if(merchantInfo!=null){
			if(merchantInfo.getMi_id()!=0){
				merchantInfo=merchantInfoService.findById(merchantInfo);
			}
		}
		
		return "editView";
	}
	
	private List<MerchantClass> mclass;
	
	public List<MerchantClass> getMclass() {
		return mclass;
	}

	public void setMclass(List<MerchantClass> mclass) {
		this.mclass = mclass;
	}

	public String addView(){
		mclass=merchantClassService.getList();
		ServletActionContext.getContext().put("mclass", mclass);
		return "addView";
	}
	
	
	public String getList(){
		pageResponse.setRows(merchantInfoService.getList(merchantInfo));
		pageResponse.setTotal(merchantInfoService.getCount(merchantInfo));
		return "list";
	}	
	public String delete(){
		if(merchantInfo!=null){
			if(merchantInfo.getMi_id()!=0){
				merchantInfo=merchantInfoService.findById(merchantInfo);
				merchantInfo.setMi_scbs(0);
				this.merchantInfoService.save(merchantInfo);
				result="删除成功";
			}
		}
		
		return "save";
	}
	
	@Resource
	private UserService userService;
	private User userinfo;
	
	
	public User getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(User userinfo) {
		this.userinfo = userinfo;
	}

	/**
	 * 去添加商户账号页面
	 */
	public String todoaddlogin(){
		merchantInfo=merchantInfo;
		return "todoaddlogin";
	}
	
	/**
	 * 添加商户账号
	 * @return
	 */
	public String doaddlogin(){
		if(merchantInfo!=null){
			userinfo.setU_scbs(1);
			userinfo.setU_status(-1);
			userService.save(userinfo);
			result="添加成功";
		}
		
		return "save";
	}
	
	public String queryloginlist(){
		List<User> userlist=this.userService.findMerchantUsers(userinfo);
		ServletActionContext.getContext().put("userlist", userlist);
		return "queryloginlist";
	}
	
}
