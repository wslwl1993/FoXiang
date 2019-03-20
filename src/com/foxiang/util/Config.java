package com.foxiang.util;

import java.util.ResourceBundle;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.foxiang.service.BaseService;

public class Config {
	private static Log log = LogFactory.getLog(BaseService.class);
	
	// 网页配置
	public static String title;
	public static String keyWords;
	public static String desc;
	public static String title_manage;
	
	// 数据库配置
	public static String driver;
	public static String url;
	public static String username;
	public static String password;
	
	// 文件上传
	public static String imgUploadPath;
	
	// 产品分类
	public static String[] categorys;
	
	static {
		try {
			ResourceBundle resource = ResourceBundle.getBundle("config");
			
			Config.title = resource.getString("title");
			Config.keyWords = resource.getString("keyWords");
			Config.desc = resource.getString("desc");
			Config.title_manage = resource.getString("title_manage");
			
			Config.driver = resource.getString("driver");
			Config.url = resource.getString("url");
			Config.username = resource.getString("username");
			Config.password = resource.getString("password");
			
			Config.imgUploadPath = resource.getString("imgUploadPath");
			
			Config.categorys = resource.getString("categorys").split(" ");
		}catch (Exception e) {
			e.printStackTrace();
			log.error("读取配置文件失败！");
		}
	}
	
	public static void main(String[] args) {
		System.out.println(Config.imgUploadPath);
	}
}
