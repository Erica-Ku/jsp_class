<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mission - 구구단</title>
</head>
<body>
	<c:forEach var="i" begin="2" end="9">
		<br/>
		<c:forEach var="j" begin="1" end="9">
			${i } X ${j } = ${i*j } <br/>
		</c:forEach>
	</c:forEach>
</body>
</html>