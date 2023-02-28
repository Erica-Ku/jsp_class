package edu.db1;

import java.sql.DriverManager;

public class H2 extends Database {
	
	public H2(String url, String usr, String pwd) throws Exception {
		super("org.h2.Driver");
		con = DriverManager.getConnection(url, usr, pwd);
	}
}