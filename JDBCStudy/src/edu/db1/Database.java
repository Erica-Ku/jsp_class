package edu.db1;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public abstract class Database {

	Connection con;
	
	public Database(String driverName) throws ClassNotFoundException {
		Class.forName(driverName);
	}
	
	public int printColumnName(ResultSet rs) throws Exception {
		ResultSetMetaData meta = rs.getMetaData();
		int count = meta.getColumnCount();
		
		StringBuilder sb = new StringBuilder("#");
		for (int i = 1 ; i <= count ; i++) {
			sb.append("," + meta.getColumnName(i));
		}
		//System.out.println(sb);
		//System.out.println("-".repeat(sb.length()));
		
		return count;
	}
	
	void StudyStatement1() throws Exception {
		//질의를 위한 객체 생성
				Statement st = con.createStatement();
				//SQL 질의
				ResultSet rs = st.executeQuery("select * from board");

				int colCount = printColumnName(rs); //필드명 출력
				//int rowCount = 1;
				while(rs.next()) {
					for(int i = 1 ; i <= colCount ; i++) {
						if (i == 1)	{} //System.out.print((rowCount++) + ",");
						else		System.out.print(",");
						System.out.print(rs.getString(i));
					}
					System.out.println();
				}
				rs.close();
				st.close();
	}
	
	void StudyStatement2() throws Exception {
		//질의를 위한 객체 생성
				Statement st = con.createStatement();
				//SQL 질의
				ResultSet rs = st.executeQuery("select * from member");

				int colCount = printColumnName(rs); //필드명 출력
				//int rowCount = 1;
				while(rs.next()) {
					for(int i = 1 ; i <= colCount ; i++) {
						if (i == 1)	{} //System.out.print((rowCount++) + ",");
						else		System.out.print(",");
						System.out.print(rs.getString(i));
					}
					System.out.println();
				}
				rs.close();
				st.close();
			}
}