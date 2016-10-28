package com.cisoft.action;


import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cisoft.model.Commodity;
import com.cisoft.model.Member;
import com.cisoft.model.MembershipGrade;
import com.cisoft.model.Orders;
import com.cisoft.model.User;
import com.cisoft.service.MemberService;
import com.cisoft.service.MembershipGradeService;
import com.cisoft.service.OrdersService;
import com.cisoft.service.UserService;
import com.cisoft.utils.ParseExcel;
import com.cisoft.utils.UplodImg;
import com.cisoft.utils.writeExcel;
import com.opensymphony.xwork2.ModelDriven;

public class MemberAction extends Pages<Member> implements ModelDriven<Member>{

	private Member member=new Member();
	private User user=new User();
	public Member getModel() {
		// TODO Auto-generated method stub
		return member;
	}
	@Resource
	MemberService memberService;
	@Resource
	UserService userservice;
	@Resource
	MembershipGradeService    membershipgradservice;
	@Resource
	OrdersService ordersService;
	
	private String result="";
	public String getResult() {
		return result;
	}
	
	public String getList(){
		pageResponse.setRows(memberService.getList(member));
		pageResponse.setTotal(memberService.getCount(member));
		return "list";
	}		
	private List<MembershipGrade>  mglist;
	public List<MembershipGrade> getMglist() {
		return mglist;
	}

	public void setMglist(List<MembershipGrade> mglist) {
		this.mglist = mglist;
	}
	
	public String save(){
		if(member.getM_id()==0){
			//添加登录账号
			user.setU_scbs(1);
			user.setU_status(4);
			user.setU_zsName(member.getM_name());
			user.setU_xb(member.getM_xb());
			user.setRegisterTime(new Date());
			user.setU_csny(member.getM_csrq().toString());
			userservice.save(user);
			//添加会员信息
			member.setM_zcsj(new Date());
			member.setM_uid(user.getU_id());
			member.setM_email(user.getU_email());
			member.setM_loginname(user.getU_name());
			member.setM_pwd(user.getU_pwd());
			member.setM_scbs(1);
			result="添加成功";
		}else{
			result="修改成功";
		}
		memberService.save(member);
		return "save";
	}
	
	public String addView(){
		ServletActionContext.getContext().getSession().remove("member");
		//获取会员等级
		mglist=  membershipgradservice.findgyxlist();
		ServletActionContext.getContext().put("mglist", mglist);
		return "editView";
	}
	public String editView(){
		member=memberService.findById(member);
		mglist=  membershipgradservice.findgyxlist();
		ServletActionContext.getContext().put("mglist", mglist);
		ServletActionContext.getContext().getSession().put("member",member);
		return "editView";
	}
	
	
	//修改信息
	public String updatepwd(){
		memberService.save(member);
		result="修改成功";
		return "updatepwd";
	}
	
	/*
	 * Backups/OperateLog/Publish
	 */
	public String delete(){
		Member members =memberService.findById(member);
		members.setM_scbs(0);
		memberService.save(members);
		result="删除成功";
		return "delete";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	//导入
	public String doimport(){
		
		return "doimportsuccess";
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

	//导入添加数据
	public String dosavemember(){
		if(fileProductPicFileName!=null){
			
			File newfile = new File(ServletActionContext.getServletContext().getRealPath("/Template")+"/"+fileProductPicFileName);
			UplodImg.copy(fileProductPic, newfile);
			System.out.println("文件上传成功");
			//解析excel
			ParseExcel ps=new ParseExcel();
			List<Member> memberlist= ps.doexceld(ServletActionContext.getServletContext().getRealPath("/Template")+"/"+fileProductPicFileName);
			if(memberlist.size()>0){
				for(int i=0;i<memberlist.size();i++){
					Member memberinfo=memberlist.get(i);
					User user=new User();
					user.setU_email(memberinfo.getM_email());
					user.setU_name(memberinfo.getM_loginname());
					user.setU_pwd(memberinfo.getM_pwd());
					user.setU_xb(memberinfo.getM_xb());
					user.setU_zsName(memberinfo.getM_name());
					user.setU_status(4);
					this.userservice.save(user);
					
					memberinfo.setM_uid(user.getU_id());
					this.memberService.save(memberinfo);
				}
				result=String.valueOf(memberlist.size());
			}
		}
		return "dosavemembersucess";
	}
	
	//导出
	public String doexpert(){
		writeExcel sd=new writeExcel(); 
		UUID uuid = UUID.randomUUID();
		result=uuid+".xls";//路径
		String resultss=ServletActionContext.getServletContext().getRealPath("/Template")+"/"+result;//路径
		List<Member> memeberList=this.memberService.findmemberbyname(member);
		sd.writeExcelmember(resultss, memeberList,0,0,0);
		return "save";
	}
	
	private List<Orders> orderslsit;
	
	public List<Orders> getOrderslsit() {
		return orderslsit;
	}

	public void setOrderslsit(List<Orders> orderslsit) {
		this.orderslsit = orderslsit;
	}

	public String domem(){
		member=this.memberService.findById(member);
		ServletActionContext.getContext().getSession().put("member",member);
		return "domemsuccess";
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
}
