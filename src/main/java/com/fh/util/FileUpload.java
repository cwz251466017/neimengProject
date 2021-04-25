package com.fh.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * 上传文件
 * 创建人：FH Q313596790
 * 创建时间：2014年12月23日
 * @version
 */
public class FileUpload {

	/**上传文件
	 * @param file 			//文件对象
	 * @param filePath		//上传路径
	 * @param fileName		//文件名
	 * @return  文件名
	 */
	public static String fileUp(MultipartFile file, String filePath, String fileName){
		String extName = ""; // 扩展名格式：
		try {
			if (file.getOriginalFilename().lastIndexOf(".") >= 0){
				extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			}
			copyFile(file.getInputStream(), filePath, fileName+extName).replaceAll("-", "");
		} catch (IOException e) {
			System.out.println(e);
		}
		return fileName+extName;
	}
	
	/**获取上传文件的名字
	 * @param file 			//文件对象
	 * @return  文件名
	 */
	public static String getFileName(MultipartFile file){
		String fileName = ""; // 上传的文件名称：
			if (file.getOriginalFilename().indexOf(".")>= 0){
				fileName = file.getOriginalFilename().substring(0, file.getOriginalFilename().indexOf("."));
			}
		return fileName;
	}
	
	/**获取上传文件的类型
	 * @param file 			//文件对象
	 * @return  文件的类型
	 */
	public static String getFileType(MultipartFile file){
		String extName = ""; // 上传的文件名称：
		if (file.getOriginalFilename().indexOf(".") >= 0){
			extName = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
		}
		return extName;
	}
	
	/**获取上传文件的大小
	 * @param file 			//文件对象
	 * @return  文件的大小
	 */
	public static Long getFileSize(MultipartFile file){
		return file.getSize();
	}
	
	/**获取上传文件的存放位置
	 * @param file 			//文件对象
	 * @return  文件的存放位置
	 */
	public static String getFilePate(MultipartFile file,String path){
		String filePate = ""; // 上传的文件存放位置：
		filePate=path+file.getOriginalFilename();
		return filePate;
	}
	
	
	
	/**
	 * 写文件到当前目录的upload目录中
	 * @param in
	 * @param fileName
	 * @throws IOException
	 */
	private static String copyFile(InputStream in, String dir, String realName)
			throws IOException {
		File file = mkdirsmy(dir,realName);
		FileUtils.copyInputStreamToFile(in, file);
		return realName;
	}
	
	/**
	 * 写文件到当前目录的upload目录中并复制到备份目录
	 * @param in  上传文件的输入流
	 * @param dir 保持在tomcat的目录
	 * @param bakdirPath  备份的目录（不需要）
	 * @param fileName  上传的文件名 例如人员.xsl
	 * @return realName 保持在服务器的文件名  例如2016060211505730809.xsl
	 * @throws IOException
	 */
	public static String copyFileAndBak(InputStream in, String dir, String bakdirPath,String realName)
			throws IOException {
		String name = new java.text.SimpleDateFormat("yyyyMMddhhmmss").format(new Date());	//获取当前日期
		name = name + (int)(Math.random()*90000+10000);
		
		//String bakDir=bakdirPath;
		File file = mkdirsmy(dir,name+realName.substring(realName.indexOf(".")));
		//File file1 = mkdirsmy(bakDir,name+realName.substring(realName.indexOf(".")));
		FileOutputStream fos1 = new FileOutputStream(file);
		//FileOutputStream fos2 = new FileOutputStream(file1);
		byte[] b = new byte[1024];
		while((in.read(b)) != -1){
			fos1.write(b);
			//fos2.write(b);
		}
		fos1.close();
		//fos2.close();
		in.close();
		//先通过输入流in写入文件，但是不将in关闭
		//FileUtils.copyInputStreamToFile(in, file);
		//FileUtils.copyInputStreamToFile(in, file1);
		return name+realName.substring(realName.indexOf("."));
	}
	/**判断路径是否存在，否：创建此路径
	 * @param dir  文件路径
	 * @param realName  文件名
	 * @throws IOException 
	 */
	public static File mkdirsmy(String dir, String realName) throws IOException{
		File file = new File(dir, realName);
		if (!file.exists()) {
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			file.createNewFile();
		}
		return file;
	}
	
	
	/**下载网络图片上传到服务器上
	 * @param httpUrl 图片网络地址
	 * @param filePath	图片保存路径
	 * @param myFileName  图片文件名(null时用网络图片原名)
	 * @return	返回图片名称
	 */
	public static String getHtmlPicture(String httpUrl, String filePath , String myFileName) {
		
		URL url;						//定义URL对象url
		BufferedInputStream in;			//定义输入字节缓冲流对象in
		FileOutputStream file;			//定义文件输出流对象file
		try {
			String fileName = null == myFileName?httpUrl.substring(httpUrl.lastIndexOf("/")).replace("/", ""):myFileName; //图片文件名(null时用网络图片原名)
			url = new URL(httpUrl);		//初始化url对象
			in = new BufferedInputStream(url.openStream());									//初始化in对象，也就是获得url字节流
			//file = new FileOutputStream(new File(filePath +"\\"+ fileName));
			file = new FileOutputStream(mkdirsmy(filePath,fileName));
			int t;
			while ((t = in.read()) != -1) {
				file.write(t);
			}
			file.close();
			in.close();
			return fileName;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
}
