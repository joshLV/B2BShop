package net.deepdragon.weipu.tools.excel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Desc:下载EXCEL文件
 * @Auth: zhangqiang
 * @Time:2016-02-24 11:35:22
 */

public class DownloadExcel {
	/**
	 * Desc:下载文件的基本信息
	 * @Auth: zhangqiang
	 * @Time:2016-02-24 11:35:22
	 *
	 * @param:filename  要下载文件的名称
	 */
	public static void getFilePath(HttpServletRequest request,HttpServletResponse response,String fileName){
		try {
			String basePath = request.getSession().getServletContext()
					.getRealPath("")
					+ File.separator+"exportTemplate"+ File.separator+fileName;
			download(basePath,response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	/**
	 * Desc:要下载文件的路径
	 * @Auth: zhangqiang
	 * @Time:2016-02-24 11:35:22
	 *
	 * @param:path  要下载文件的名称
	 */
	public static void download(String path, HttpServletResponse response) {
		try {
			// path是指欲下载的文件的路径。
			File file = new File(path);
			// 取得文件名。

			String filename = file.getName();

			// 以流的形式下载文件。
			InputStream fis = new BufferedInputStream(new FileInputStream(path));
			byte[] buffer = new byte[fis.available()];

			fis.read(buffer);
			fis.close();
			// 清空response
			response.reset();
			// 设置response的Header
			response.addHeader("Content-Disposition", "attachment;filename="
					+ new String(filename.getBytes()));
			response.addHeader("Content-Length", "" + file.length());
			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("application/vnd.ms-excel;charset=gb2312");
//			response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;");

			toClient.write(buffer);

			toClient.flush();
			toClient.close();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
	
}
