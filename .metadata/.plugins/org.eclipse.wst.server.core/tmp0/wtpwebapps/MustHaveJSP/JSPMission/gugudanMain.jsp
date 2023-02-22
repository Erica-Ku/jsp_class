<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudanMain</title>
</head>
<body>
<%
String type = request.getParameter("type");
String val = request.getParameter("val");
String url = "";
if(type.equals("gugudan1")) {
	url = "gugudan1.jsp?dan="+val;
} else {
	url = "gugudan2.jsp?col="+val;
}
response.sendRedirect(url);
%>
</body>
</html>