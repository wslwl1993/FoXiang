package com.foxiang.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.foxiang.util.Config;

public class BaseService {
	private Log log = LogFactory.getLog(BaseService.class);
	protected Connection conn;
	protected Statement stmt;
	protected ResultSet rs;
	
	public void getConnection() {
		try {
			Class.forName(Config.driver);
			conn = DriverManager.getConnection(Config.url, Config.username, Config.password);
			stmt = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("连接数据库失败!");
		}
	}
	
	public void closeConnection() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			log.error("释放数据库连接失败!");
		}
	}
	
	public static void main(String[] args) {
		BaseService service = new BaseService();
		service.getConnection();
		service.closeConnection();
	}
}
