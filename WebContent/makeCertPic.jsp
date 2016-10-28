
<%@page contentType="image/jpeg" pageEncoding="utf-8"%>
　　<jsp:useBean id="image" scope="page" class="com.cisoft.utils.makeCertPic" />
　　<%
String str=image.getCertPic(0,0,response.getOutputStream());
session.setAttribute("rand", str);
out.clear();
out = pageContext.pushBody();
%>