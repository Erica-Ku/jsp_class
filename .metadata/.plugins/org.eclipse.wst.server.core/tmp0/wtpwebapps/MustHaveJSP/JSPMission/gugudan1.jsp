<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudan1</title>
</head>
<body>
<%
	int n = Integer.parseInt(request.getParameter("dan"));
	for(int i = 1; i<=9; i++) { %>
			<p><%= n + "*" + i + "=" + (n*i) %></p>
<% 	}
%>
</body>
</html>