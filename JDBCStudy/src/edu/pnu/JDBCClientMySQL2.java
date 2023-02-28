package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public class JDBCClientMySQL2 {

	public int printColumnName(ResultSet rs) throws Exception {
		ResultSetMetaData meta = rs.getMetaData();
		int count = meta.getColumnCount();
		
		StringBuilder sb = new StringBuilder("#");
		for (int i = 1 ; i <= count ; i++) {
			sb.append("," + meta.getColumnName(i));
		}
		System.out.println(sb);
		System.out.println("-".repeat(sb.length()));
		
		return count;
	}
	
	public void StudyStatement(Connection con) throws Exception {

		//질의를 위한 객체 생성
		Statement st = con.createStatement();
		//SQL 질의
		ResultSet rs = st.executeQuery("select * from country limit 20");

		int colCount = printColumnName(rs); //필드명 출력
		int rowCount = 1;
		while(rs.next()) {
			for(int i = 1 ; i <= colCount ; i++) {
				if (i == 1)	System.out.print((rowCount++) + ",");
				else		System.out.print(",");
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
		st.close();
	}

	public void StudyPrepareStatement(Connection con) throws Exception { 
		//where 절의 조건
		PreparedStatement st = con.prepareStatement("select * from country where code=?");

		st.setString(1, "KOR"); //문자열로 바꿔줌
		ResultSet rs = st.executeQuery();
		
		int colCount = printColumnName(rs);
		int rowCount = 1;
		while(rs.next()) {
			for(int i = 1 ; i <= colCount ; i++) {
				if (i == 1)	System.out.print((rowCount++) + ",");
				else		System.out.print(",");
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
		st.close();
	}	
	
	public static void main(String[] args) throws Exception  {
		//메서드 호출하기 위해서
		JDBCClientMySQL2 cli = new JDBCClientMySQL2();

		//MySQL 접속을 위한 JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");

		//MySQL Database 연결 객체 생성
		try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "musthave", "tiger");) {
			
			System.out.println("<=== StudyStatement ===>");
			cli.StudyStatement(con);
			System.out.println();

			System.out.println("<=== StudyPrepareStatement ===>");
			cli.StudyPrepareStatement(con);
		}		
	}
}