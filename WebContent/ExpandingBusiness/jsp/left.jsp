<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String pathl = request.getContextPath();
	String basePathl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathl+"/";
%>
		<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
		<div id="sidebar" class="menu-min">

				<div id="sidebar-shortcuts">

					<div id="sidebar-shortcuts-large">

						<button class="btn btn-small btn-success" onclick="changeMenu();" title="切换菜单"><i class="icon-pencil"></i></button>

						<button class="btn btn-small btn-info" title="UI实例" onclick="window.open('<%=basePathl%>static/UI_new');"><i class="icon-eye-open"></i></button>

						<button class="btn btn-small btn-warning" title="数据字典" id="adminzidian" onclick="zidian();"><i class="icon-book"></i></button>
						
						<button class="btn btn-small btn-danger" title="菜单管理" id="adminmenu" onclick="menu();"><i class="icon-folder-open"></i></button>
						
					</div>

					<div id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>

				</div><!-- #sidebar-shortcuts -->


				<ul class="nav nav-list">

					<li class="active" id="fhindex">
					  <a href="user_sjindex"><i class="icon-dashboard"></i><span>后台首页</span></a>
					</li>


			<s:iterator value="#menus" var="fm" >
				<li id="lm<s:property value="#fm.id"/>">
					  <a style="cursor:pointer;" class="dropdown-toggle" >
						<i class="icon-list-alt"></i>
						<span><s:property value="#fm.menuname"/></span>
						<b class="arrow icon-angle-down"></b>
					  </a>
					   <ul class="submenu">
					  	 	<s:iterator value="#zmenu" var="zm">
					  	 		<s:if test="#zm.parentid==#fm.id">
									 <li id="z<s:property value="#zm.id"/>">
									<a style="cursor:pointer;" target="mainFrame"  onclick="siMenu('z<s:property value="#zm.id"/>','lm<s:property value="#zm.id"/>','<s:property value="#zm.menuname"/>','<s:property value="#zm.page"/>')"><i class="icon-double-angle-right"></i><s:property value="#zm.menuname"/></a></li>
									 
									 <%-- <li><a href="javascript:void(0);"><i class="icon-double-angle-right"></i><s:property value="#zm.menuname"/></a></li> --%>
							</s:if>
							</s:iterator>
				  		</ul> 
				</li>
			</s:iterator>

				</ul><!--/.nav-list-->

				<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>

			</div><!--/#sidebar-->

