package com.foxiang.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class UserService extends BaseService{
	private Log log = LogFactory.getLog(UserService.class);
	
	public boolean login(String username, String password) {
		boolean success  = false;
		
		this.getConnection();
		String sql = "select * from user where username = '" + username + "' and password = '" + password + "'";
		log.info(sql);
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				success = true;
			}
		}catch (Exception e) {
			e.printStackTrace();
			log.error(sql);
		}
		this.closeConnection();
		
		return success;
	}
}
