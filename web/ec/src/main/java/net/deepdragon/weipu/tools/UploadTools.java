package net.deepdragon.weipu.tools;

import com.aliyun.oss.ClientConfiguration;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PutObjectResult;
import net.deepdragon.util.Constant;
import net.deepdragon.util.IdWorker;
import org.apache.commons.io.FilenameUtils;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.imageio.ImageIO;
import javax.imageio.stream.FileImageInputStream;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UploadTools {

	protected static Logger logger = LoggerFactory.getLogger(UploadTools.class);
	
	private static TrackerClient trackerClient = null;

    private static String imageServerAddress = null;

	private static OSSClient ossClient = null;

	private static TrackerClient getTrackerClient() throws Exception {
		if (trackerClient == null) {
			String classPath = new File(UploadTools.class.getResource("/").getFile()).getCanonicalPath();
			String configFilePath = classPath + File.separator + "fdfs_client.conf";
			logger.info("UploadTools读取配置文件:" + configFilePath);
			ClientGlobal.init(configFilePath);
			
			trackerClient = new TrackerClient();
		}
		return trackerClient;
	}

	private static OSSClient getOssClient(){
		if(ossClient != null){
			return ossClient;
		}else {
			Map<String,String> conf= PropertiesUtil.getAll(Constant.PROJECTCONF);
			ClientConfiguration configuration = new ClientConfiguration();
			configuration.setMaxConnections(Integer.parseInt(conf.get("OSS_maxconnections")));
			configuration.setMaxErrorRetry(Integer.parseInt(conf.get("OSS_maxerrorretry")));
			configuration.setConnectionTimeout(Integer.parseInt(conf.get("OSS_connectiontimeout")));
			configuration.setSocketTimeout(Integer.parseInt(conf.get("OSS_setsockettimeout")));
			// 创建OSS客户端
			ossClient = new OSSClient(conf.get("OSS_endpoint"), conf.get("OSS_key"), conf.get("OSS_secret"), configuration);
			logger.info("创建OSS客户端!");
		}
		return ossClient;
	}

	/**
	 * 上传文件
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public static List<String[]> upload(HttpServletRequest request) throws Exception {
		String uploadType=PropertiesUtil.getValue(Constant.PROJECTCONF,Constant.UPLOADTYPE);
		if(uploadType.equals("1")){
			return uploadByFastDFS(request);
		}else if(uploadType.equals("2")){
			return uploadByOSS(request);
		}else{
			return uploadByFastDFS(request);
		}
	}

	public static List<String[]> uploadByFastDFS(HttpServletRequest request) throws Exception {
		TrackerClient trackerClient = getTrackerClient();
		TrackerServer trackerServer = trackerClient.getConnection();
		StorageServer storageServer = null;
		StorageClient storageClient = new StorageClient(trackerServer, storageServer);
		MultipartHttpServletRequest multipartHttpservletRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> multipartFilelist = multipartHttpservletRequest.getFiles("file");
		List<String[]> list = new ArrayList<String[]>();
		if (multipartFilelist != null && multipartFilelist.size() > 0) {
			for (MultipartFile multipartFile : multipartFilelist) {
				String[] results = new String[4];
				if (multipartFile.isEmpty()) {
					results[0] = "0";
					results[1] = "0";
					results[2] = "0";
					results[3] = "0";
					list.add(results);
				} else {
					String originalFileName = multipartFile.getOriginalFilename();
					/** 获得文件后缀名 **/
					String fileExtName = FilenameUtils.getExtension(originalFileName);
					byte[] file_buff = multipartFile.getBytes();
					InputStream is = multipartFile.getInputStream();
					BufferedImage buff;
					try {
						logger.info("tempdir:"+ System.getProperty("java.io.tmpdir")+"-javahone:"+System.getProperty("java.home"));
						buff = ImageIO.read(is);
						NameValuePair[] meta_list = new NameValuePair[3];
						meta_list[0] = new NameValuePair("width", buff.getWidth() + "");
						meta_list[1] = new NameValuePair("heigth", buff.getHeight() + "");
						meta_list[2] = new NameValuePair("author", "gary");
						String[] temp = storageClient.upload_file(file_buff, fileExtName, meta_list);
						results[0] = temp[0];
						results[1] = temp[1];
						results[2] = buff.getWidth() + "";
						results[3] = buff.getHeight() + "";
						list.add(results);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						is.close();
					}
				}
			}
		} else {
			String[] results = new String[4];
			results[0] = "0";
			results[1] = "0";
			results[2] = "0";
			results[3] = "0";
			list.add(results);
		}

		return list;

	}

	public static List<String[]> uploadByOSS(HttpServletRequest request) throws Exception {
		String bucketName = PropertiesUtil.getValue(Constant.PROJECTCONF,Constant.bucketName);
		String projectName =  PropertiesUtil.getValue(Constant.PROJECTCONF,"project.name");
		MultipartHttpServletRequest multipartHttpservletRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> multipartFilelist = multipartHttpservletRequest.getFiles("file");
		List<String[]> list = new ArrayList<String[]>();
		if (multipartFilelist != null && multipartFilelist.size() > 0) {
			for (MultipartFile multipartFile : multipartFilelist) {
				IdWorker idWorker = new IdWorker(0, 0, 0);
				long key = idWorker.getId();
				String[] results = new String[4];
				if (multipartFile.isEmpty()) {
					continue;
				} else {
					InputStream is = null;
					try {
						//logger.info("tempdir:"+ System.getProperty("java.io.tmpdir")+"-javahone:"+System.getProperty("java.home"));
						String originalFileName = multipartFile.getOriginalFilename();
						/** 获得文件后缀名 **/
						String fileExtName = FilenameUtils.getExtension(originalFileName);
						is = multipartFile.getInputStream();
						BufferedImage buff = ImageIO.read(is);
						String imgWidth = buff!=null?buff.getWidth() + "":"";
						String imgHeight = buff!=null?buff.getHeight() + "":"";
						ObjectMetadata meta = new ObjectMetadata();
						// 必须设置ContentLength
						meta.setContentLength(multipartFile.getSize());
						meta.addUserMetadata("width",imgWidth);
						meta.addUserMetadata("height",imgHeight);
						OSSClient client = getOssClient();
						client.putObject(bucketName, projectName+key+"."+fileExtName, multipartFile.getInputStream(), meta);
						results[0] = "/";
						results[1] = projectName+key+"."+fileExtName;
						results[2] = imgWidth;
						results[3] = imgHeight;
						list.add(results);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						is.close();
					}
				}
			}
		}
		return list;
	}

	/**
	 * 上传文件
	 * 
	 * @param tmpFile
	 * @return
	 * @throws Exception
	 */
	public static List<String[]> upUpload(File tmpFile) throws Exception {
		String uploadType=PropertiesUtil.getValue(Constant.PROJECTCONF,Constant.UPLOADTYPE);
		if(uploadType.equals("1")){
			return upUploadByFastDFS(tmpFile);
		}else if(uploadType.equals("2")){
			return upUploadByOSS(tmpFile);
		}else{
			return upUploadByFastDFS(tmpFile);
		}
	}
	public static List<String[]> upUploadByFastDFS(File tmpFile) throws Exception {
		List<String[]> list = new ArrayList<String[]>();
		TrackerClient trackerClient = getTrackerClient();
		TrackerServer trackerServer = trackerClient.getConnection();
		StorageServer storageServer = null;
		StorageClient storageClient = new StorageClient(trackerServer, storageServer);

		String[] results = new String[4];
		String originalFileName = tmpFile.getName();
		String fileExtName = FilenameUtils.getExtension(originalFileName);
		FileInputStream in = null;

		try {
			in = new FileInputStream(tmpFile);
			byte[] file_buff = new byte[in.available()];
			in.read(file_buff);
			BufferedImage buff = ImageIO.read(new FileImageInputStream(tmpFile));
			NameValuePair[] meta_list = new NameValuePair[3];
			meta_list[0] = new NameValuePair("width", buff.getWidth() + "");
			meta_list[1] = new NameValuePair("heigth", buff.getHeight() + "");
			meta_list[2] = new NameValuePair("author", "gary");
			String[] temp = storageClient.upload_file(file_buff, fileExtName, meta_list);
			results[0] = temp[0];
			results[1] = temp[1];
			results[2] = buff.getWidth() + "";
			results[3] = buff.getHeight() + "";
			list.add(results);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(in != null){
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	public static List<String[]> upUploadByOSS(File tmpFile) throws Exception {
		String bucketName = PropertiesUtil.getValue(Constant.PROJECTCONF,Constant.bucketName);
		String projectName =  PropertiesUtil.getValue(Constant.PROJECTCONF,"project.name");
		OSSClient client=getOssClient();
		List<String[]> list = new ArrayList<String[]>();
		IdWorker idWorker = new IdWorker(0, 0, 0);
		long key = idWorker.getId();
		String[] results = new String[4];
		String originalFileName = tmpFile.getName();
		String fileExtName = FilenameUtils.getExtension(originalFileName);
		FileInputStream in = new FileInputStream(tmpFile);
		byte[] file_buff = new byte[in.available()];
		BufferedImage buff = ImageIO.read(new FileImageInputStream(tmpFile));
		String imgWidth = buff!=null?buff.getWidth() + "":"";
		String imgHeight = buff!=null?buff.getHeight() + "":"";
		ObjectMetadata meta = new ObjectMetadata();
		// 必须设置ContentLength
		meta.setContentLength(file_buff.length);
		meta.addUserMetadata("width",imgWidth);
		meta.addUserMetadata("height",imgHeight);
		client.putObject(bucketName, projectName+key+"."+fileExtName, in, meta);
		results[0] = "/";
		results[1] = projectName+key+"."+fileExtName;
		results[2] = imgWidth;
		results[3] = imgHeight;
		list.add(results);
		return list;
	}

	/**
	 * 上传文件
	 *
	 * @param inputStream
	 * @return
	 * @throws Exception
	 */
	public static List<String[]> upUpload(String name,byte[] bytes) throws Exception {
		String uploadType=PropertiesUtil.getValue(Constant.PROJECTCONF,Constant.UPLOADTYPE);
		if(uploadType.equals("1")){
			return upUploadByFastDFS(name,bytes);
		}else if(uploadType.equals("2")){
			return upUploadByOSS(name, bytes);
		}else{
			return upUploadByFastDFS(name, bytes);
		}
	}

	public static List<String[]> upUploadByFastDFS(String name, byte[] bytes) throws Exception {
		List<String[]> list = new ArrayList<String[]>();
		TrackerClient trackerClient = getTrackerClient();
		TrackerServer trackerServer = trackerClient.getConnection();
		StorageServer storageServer = null;
		StorageClient storageClient = new StorageClient(trackerServer, storageServer);

		String[] results = new String[4];
		String fileExtName = FilenameUtils.getExtension(name);
		//构造字节数组输入流
		ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
		byte[] file_buff = new byte[bais.available()];
		bais.read(file_buff);
		try {
			ByteArrayInputStream inputStream = new ByteArrayInputStream(bytes);
			BufferedImage buff = ImageIO.read(inputStream);
			NameValuePair[] meta_list = new NameValuePair[3];
			meta_list[0] = new NameValuePair("width", buff.getWidth() + "");
			meta_list[1] = new NameValuePair("heigth", buff.getHeight() + "");
			meta_list[2] = new NameValuePair("author", "gary");
			String[] temp = storageClient.upload_file(file_buff, fileExtName, meta_list);
			results[0] = temp[0];
			results[1] = temp[1];
			results[2] = buff.getWidth() + "";
			results[3] = buff.getHeight() + "";
			list.add(results);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<String[]> upUploadByOSS(String name, byte[] bytes) throws Exception {
		String bucketName = PropertiesUtil.getValue(Constant.PROJECTCONF,Constant.bucketName);
		String projectName =  PropertiesUtil.getValue(Constant.PROJECTCONF,"project.name");
		OSSClient client=getOssClient();
		List<String[]> list = new ArrayList<String[]>();
		IdWorker idWorker = new IdWorker(0, 0, 0);
		long key = idWorker.getId();
		String[] results = new String[4];
		String fileExtName = FilenameUtils.getExtension(name);
		//构造字节数组输入流
		ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
		byte[] file_buff = new byte[bais.available()];
		BufferedImage buff = ImageIO.read(bais);
		String imgWidth = buff!=null?buff.getWidth() + "":"";
		String imgHeight = buff!=null?buff.getHeight() + "":"";
		ObjectMetadata meta = new ObjectMetadata();
		// 必须设置ContentLength
		meta.setContentLength(file_buff.length);
		meta.addUserMetadata("width",imgWidth);
		meta.addUserMetadata("height",imgHeight);
		ByteArrayInputStream inputStream = new ByteArrayInputStream(bytes);
		client.putObject(bucketName, projectName+key+"."+fileExtName, inputStream, meta);
		results[0] = "/";
		results[1] = projectName+key+"."+fileExtName;
		results[2] = imgWidth;
		results[3] = imgHeight;
		list.add(results);
		return list;
	}
	/**
	 * 删除文件
	 * 
	 * @param group_name
	 *            组名
	 * @param remote_filename
	 *            文件名
	 * @return
	 * @throws Exception
	 */
	public static String deletefile(String group_name, String remote_filename)throws Exception{
		String uploadType=PropertiesUtil.getValue(Constant.PROJECTCONF,Constant.UPLOADTYPE);
		if(uploadType.equals("1")){
			return deleteFileOnFastDfs(group_name,remote_filename);
		}else if(uploadType.equals("2")){
			return deleteFileOnOSS(remote_filename);
		}else{
			return deleteFileOnFastDfs(group_name,remote_filename);
		}
	}

	public static String deleteFileOnFastDfs(String group_name, String remote_filename) throws Exception {
		TrackerClient trackerClient = getTrackerClient();
		TrackerServer trackerServer = trackerClient.getConnection();
		StorageServer storageServer = null;
		StorageClient storageClient = new StorageClient(trackerServer, storageServer);
		storageClient.delete_file(group_name, remote_filename);
		return "success";
	}

	public static String deleteFileOnOSS(String remote_filename) throws Exception {
		String bucketName = PropertiesUtil.getValue(Constant.PROJECTCONF,Constant.bucketName);
		OSSClient client = getOssClient();
		client.deleteObject(bucketName, remote_filename);
		return "success";
	}


    /**
     * 获取图片服务器地址
     * @return
     */
	public static String getImageServerAddress() {
		if (imageServerAddress == null) {
			String uploadType=PropertiesUtil.getValue(Constant.PROJECTCONF,Constant.UPLOADTYPE);
			if(uploadType.equals("1")){
				try {
					TrackerServer trackerServer = getTrackerClient().getConnection();
					imageServerAddress = trackerServer.getInetSocketAddress().getHostString();
					if( imageServerAddress == null || "".equals(imageServerAddress.trim())){
						imageServerAddress = null;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else {
				imageServerAddress = PropertiesUtil.getValue(Constant.PROJECTCONF, "OSS_imgserver");
			}
		}
		return imageServerAddress;
	}
	public static Integer getImageServerType(){
		String uploadType=PropertiesUtil.getValue(Constant.PROJECTCONF,Constant.UPLOADTYPE);
		return Integer.valueOf(uploadType);
	}
	public static void main(String[] args) throws Exception {
		String bucketName = PropertiesUtil.getValue(Constant.PROJECTCONF,Constant.bucketName);
		File file=new File("/home/gzj/001.png");
		InputStream content = new FileInputStream(file);
		ObjectMetadata meta = new ObjectMetadata();
		meta.setContentLength(file.length());
		getOssClient();
		PutObjectResult result =ossClient.putObject(bucketName,"111111.png",content,meta);
		System.out.println(result.getETag());
	}
}
