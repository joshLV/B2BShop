package com.baidu.ueditor.upload;

import com.baidu.ueditor.define.AppInfo;
import com.baidu.ueditor.define.BaseState;
import com.baidu.ueditor.define.State;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.util.Constant;
import net.deepdragon.weipu.listeners.ApplicationContextListener;
import net.deepdragon.weipu.tools.UploadTools;
import org.apache.commons.io.FileUtils;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StorageManager {
	public static final int BUFFER_SIZE = 8192;

	public StorageManager() {
	}

	public static State saveBinaryFile(byte[] data, String path) {
		File file = new File(path);

		State state = valid(file);

		if (!state.isSuccess()) {
			return state;
		}

		try {
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));
			bos.write(data);
			bos.flush();
			bos.close();
		} catch (IOException ioe) {
			return new BaseState(false, AppInfo.IO_ERROR);
		}

		state = new BaseState(true, file.getAbsolutePath());
		state.putInfo("size", data.length);
		state.putInfo("title", file.getName());
		return state;
	}

	public static State saveFileByInputStream(InputStream is, String path, long maxSize) {

		State state = null;

		File tmpFile = getTmpFile();

		byte[] dataBuf = new byte[2048];
		BufferedInputStream bis = new BufferedInputStream(is, StorageManager.BUFFER_SIZE);

		try {
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(tmpFile), StorageManager.BUFFER_SIZE);

			int count = 0;
			while ((count = bis.read(dataBuf)) != -1) {
				bos.write(dataBuf, 0, count);
			}
			bos.flush();
			bos.close();

			if (tmpFile.length() > maxSize) {
				tmpFile.delete();
				return new BaseState(false, AppInfo.MAX_SIZE);
			}

			state = saveTmpFile(tmpFile, path);

			if (!state.isSuccess()) {
				tmpFile.delete();
			}

			return state;

		} catch (IOException e) {
		}
		return new BaseState(false, AppInfo.IO_ERROR);
	}

	public static State saveFileByInputStream(InputStream is, String path) {
		State state = null;

		File tmpFile = getTmpFile();

		byte[] dataBuf = new byte[2048];
		BufferedInputStream bis = new BufferedInputStream(is, StorageManager.BUFFER_SIZE);

		try {
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(tmpFile), StorageManager.BUFFER_SIZE);

			int count = 0;
			while ((count = bis.read(dataBuf)) != -1) {
				bos.write(dataBuf, 0, count);
			}
			bos.flush();
			bos.close();

			state = saveTmpFile(tmpFile, path);

			if (!state.isSuccess()) {
				tmpFile.delete();
			}

			return state;
		} catch (IOException e) {
		}
		return new BaseState(false, AppInfo.IO_ERROR);
	}

	private static File getTmpFile() {
		File tmpDir = FileUtils.getTempDirectory();
		String tmpFileName = (Math.random() * 10000 + "").replace(".", "");
		return new File(tmpDir, tmpFileName);
	}

	private static State saveTmpFile(File tmpFile, String path) {
		State state = null;
		File targetFile = new File(path);

		if (targetFile.canWrite()) {
			return new BaseState(false, AppInfo.PERMISSION_DENIED);
		}
		state = new BaseState(true);
		try {
			FileUtils.moveFile(tmpFile, targetFile);
			List<String[]> list = UploadTools.upUpload(targetFile);
			if (list != null && list.size() > 0) {
				String tenantId = "37100";
				Map<String, Object> tmpMap = new HashMap<String, Object>();
				tmpMap.put(Constant.TENANTID_KEY, tenantId);
				SystemSetService systemSetService = ApplicationContextListener.getSpringApplicationContext().getBean(SystemSetService.class);
				SystemSet systemSet = systemSetService.find(tmpMap, "setkey", "imageUrl");
				String urlbuffer[] = list.get(0);
				String url = systemSet.getSetvalue() + urlbuffer[0] + "/" + urlbuffer[1];
				state.putInfo("url", url);

			}
		} catch (IOException e) {
			e.printStackTrace();
			return new BaseState(false, AppInfo.IO_ERROR);
		} catch (Exception e) {
			e.printStackTrace();
			return new BaseState(false, AppInfo.IO_ERROR);
		}
		state.putInfo("size", targetFile.length());
		state.putInfo("title", targetFile.getName());
		boolean flag = targetFile.delete();
		System.out.print(flag);
		return state;
	}

	private static State valid(File file) {
		File parentPath = file.getParentFile();

		if ((!parentPath.exists()) && (!parentPath.mkdirs())) {
			return new BaseState(false, AppInfo.FAILED_CREATE_FILE);
		}

		if (!parentPath.canWrite()) {
			return new BaseState(false, AppInfo.PERMISSION_DENIED);
		}

		return new BaseState(true);
	}
}
