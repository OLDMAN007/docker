package com.sk.db;

import java.util.List;

public class UserDao {
	public void addUser(User user) {
		String sql = "insert into user (username,userage) values(?,?)";
		JDBC_Util.updateDb(sql, user.getUsername(),user.getUserage());
	}
	public List<User> getUser() {
		String sql = "select * from user";
		return (List<User>) JDBC_Util.queryBeanList(sql, User.class);
	}
}
