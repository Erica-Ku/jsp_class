package edu.db1;

import java.sql.DriverManager;

public class MySQL extends Database{
	public MySQL(String url, String usr, String pwd) throws Exception {
		super("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url, usr, pwd);
	}
}