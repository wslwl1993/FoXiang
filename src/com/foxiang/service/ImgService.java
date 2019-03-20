package com.foxiang.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.foxiang.util.Config;

public class ImgService {
	private Log log = LogFactory.getLog(ImgService.class);
	
	public List<File> getImgsByCategory(String category){
		List<File> fileList = new ArrayList<File>();
		
		File dir = new File(Config.imgUploadPath + File.separator + category);
		File[] files = dir.listFiles();
		if(files==null) {
			return fileList;
		}
		for(File f:files) {
			fileList.add(f);
		}
		Collections.sort(fileList, new Comparator<File>() {
		    @Override
		    public int compare(File o1, File o2) {
		    	if(o2.lastModified()>o1.lastModified()) {
		    		return 1;
		    	}
		    	if(o2.lastModified()<o1.lastModified()) {
		    		return -1;
		    	}
		    	return 0;
		    }	
		});
		
		return fileList;
	}
	
	public boolean deleteImg(String category, String name) {
		boolean success = false;
		File file = new File(Config.imgUploadPath + File.separator + category + File.separatorChar + name);
		if(file!=null) {
			success = file.delete();
			log.info("delete file: " + file.getAbsolutePath() + " result:" + success);
		}
		return success;
	}
}
