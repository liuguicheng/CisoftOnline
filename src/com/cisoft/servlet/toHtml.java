//package com.cisoft.servlet;
//
//import java.io.ByteArrayOutputStream;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.OutputStreamWriter;
//import java.io.PrintWriter;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
//import javax.servlet.ServletOutputStream;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpServletResponseWrapper;
//
///**
// * Servlet implementation class toHtml
// */
//public class toHtml extends HttpServlet {
//	public void service(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String url = request.getParameter("urls") != null ? request
//				.getParameter("urls") : "";
//		// url是要生成htm的jsp页面
//		String name = "";
//		response.setContentType("text/html;charset=gb2312");
//		ServletContext sc = getServletContext();
//		System.out.println("request.getRealPath" + request.getRealPath(""));
//		name = request.getRealPath("") + "/index.htm"; /*
//														 * 生成htm页
//														 * 位置在%服务器的根目录%/工程名
//														 * /index.htm
//														 * 例如:d:/tomcat5
//														 * .0/webapp
//														 * /studyteach/index.htm
//														 * ,注意这里是在根目录生成,
//														 * 你可以生成后放到你想放的文件夹里
//														 * ,保证其它东西如图片的路径正确
//														 * 这里就写成name =
//														 * request.getRealPath
//														 * ("") +
//														 * "/kszx/kszx.htm";
//														 */
//
//		RequestDispatcher rd = sc.getRequestDispatcher(url);
//
//		final ByteArrayOutputStream os = new ByteArrayOutputStream();
//
//		final ServletOutputStream stream = new ServletOutputStream() {
//			public void write(byte[] data, int offset, int length) {
//				os.write(data, offset, length);
//			}
//
//			public void write(int b) throws IOException {
//				os.write(b);
//			}
//		};
//
//		final PrintWriter pw = new PrintWriter(new OutputStreamWriter(os));
//
//		HttpServletResponse rep = new HttpServletResponseWrapper(response) {
//			public ServletOutputStream getOutputStream() {
//				return stream;
//			}
//
//			public PrintWriter getWriter() {
//				return pw;
//			}
//		};
//		rd.include(request, rep);
//		pw.flush();
//		FileOutputStream fos = new FileOutputStream(name); // 把jsp输出的内容写到xxx.htm
//		os.writeTo(fos);
//		fos.close();
//		PrintWriter out = response.getWriter();
//		out.print("<p align=center><font size=3 color=red>首页已经成功生成！</font></p>");
//	}
//
//}
