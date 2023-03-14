<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);
List<BoardDTO> aList = dao.selectList(null);

request.setAttribute("aList", aList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mission</title>
</head>
<body>
<table border="1" style="border-collapse: collapse">
<% for (int idx = 0; idx < aList.size(); idx++) {
	pageContext.setAttribute("idx", idx); %>
   <tr>
   	<td>${aList[idx].num }</td>
   	<td>${aList[idx].title }</td>
   	<td>${aList[idx].content }</td>
   	<td>${aList[idx].postdate }</td>
   	<td>${aList[idx].id }</td>
   	<td>${aList[idx].visitcount }</td>
   </tr>
<% } %>
</table>
</body>
</html>