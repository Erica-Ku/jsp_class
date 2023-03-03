<%@page import="common.JDBCConnect2"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>World3</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<%
	JDBCConnect2 jdbc = new JDBCConnect2();
	
	String sql = "select country.Continent, country.Name from country, countrylanguage where countrylanguage.Language = 'English' and countrylanguage.IsOfficial = 'T' and country.Code = countrylanguage.CountryCode";
	Statement stmt = jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<table class="table">
		<tr>
			<th scope="col">country continent</th>
			<th scope="col">country name</th>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%= rs.getString("country.Continent") %></td>
			<td><%= rs.getString("country.Name") %></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>