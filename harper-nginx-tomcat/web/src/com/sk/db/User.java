package com.sk.db;

public class User {
	private String username;
	private String userage;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserage() {
		return userage;
	}
	public void setUserage(String userage) {
		this.userage = userage;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", userage=" + userage + "]";
	}
	public User() {}
	public User(String username,String userage) {
		this.username=username;
		this.userage=userage;
	}
}
