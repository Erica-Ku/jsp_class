<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
int n = Integer.parseInt(request.getParameter("col"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudan2</title>
</head>
<body>
<%
for(int i = 2; i <= 9; i+=n) {
	for(int j = 1; j <= 9; j++) {
		for(int k = 0; k < n; k++) {
			if(10 <= i+k) {%>
				<br/>
				<% break;
			} %>
			<%= (i+k)+"*"+ j+"="+(i+k)*j %>
			<% if(k < n-1) out.print("\t"); 
			 else %> <br/>	  
		<% }
	}
}
%>
</body>
</html>