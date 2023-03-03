<%@page import="common.JDBCConnect2"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>World4</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<%
	JDBCConnect2 jdbc = new JDBCConnect2();
	
	String sql = "select country.Continent, count(country.Name) as count from country, countrylanguage where countrylanguage.Language = 'English' and country.Code = countrylanguage.CountryCode group by country.Continent";
	Statement stmt = jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<table class="table">
		<tr>
			<th scope="col">country continent</th>
			<th scope="col">count</th>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%= rs.getString("country.Continent") %></td>
			<td><%= rs.getInt("count") %></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>