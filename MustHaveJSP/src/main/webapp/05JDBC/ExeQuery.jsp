<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection" %>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	
	<%
	// DB에 연결
	JDBCConnect jdbc = new JDBCConnect();
	
	// 쿼리문 생성
	String sql = "SELECT id, pass, name, regidate FROM member";
	Statement stmt = jdbc.con.createStatement();
	
	// 쿼리 수행
	ResultSet rs = stmt.executeQuery(sql);
	
	// 결과 확인(웹 페이지에 출력)
	/* while (rs.next()) {
		String id = rs.getString(1);
		String pw = rs.getString(2);
		String name = rs.getString("name");
		Date regidate = rs.getDate("regidate");
		
		out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>");
	} */
	%>
	
	<table class="table">
		<tr>
			<th scope="col">id</th>
			<th scope="col">pass</th>
			<th scope="col">name</th>
			<th scope="col">regidate</th>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%= rs.getString("id") %></td>
			<td><%= rs.getString("pass") %></td>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("regidate") %></td>
		</tr>
		<%
		}
		%>
	</table>
	
	<%
	// 연결 닫기
	jdbc.close();
	%>
</body>
</html>