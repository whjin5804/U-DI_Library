<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	border: 1px solid black;
	border-collapse: collapse;
}
tr, td{
	border: 1px solid black;
}
</style>
</head>
<body>
<table>
	<tr>
		<td>내 포인트</td>
	</tr>
	<tr>
		<td>${nowMemberPoint.memberPoint }</td>
	</tr>
</table>
</body>
</html>