package com.fh.util;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;

public class FileUtils {

	/**
	 * 批量删除文件
	 * @param files
	 */
	public static void deleteFile(File... files) {  
        for (File file : files) {  
            if (file.exists())
            	file.delete();  
        }  
    }
	
	/**
	 * MultipartFile to File
	 * @param multipartFile
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static File changeMultipartFileToFile(MultipartFile multipartFile) throws IllegalStateException, IOException {
		// 获取文件名
        String fileName = multipartFile.getOriginalFilename();
        // 获取文件后缀
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        // 用uuid作为文件名，防止生成的临时文件重复
        File excelFile = File.createTempFile(UuidUtil.get32UUID(), suffix);
        
        // MultipartFile to File
        multipartFile.transferTo(excelFile);
        
		return excelFile;
	}
	
	public static List<Map<String, Object>> importDataToMap(File file){
		ImportParams params = new ImportParams();
        //params.setDataHandler(new IExcelDataHandler());
        List<Map<String, Object>> list = ExcelImportUtil.importExcel(
        		file, Map.class, params);
        
        return list;
	}
	
	
}
