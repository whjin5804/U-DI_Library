<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.Audi3040{
	margin: 180px 400px;
}
</style>
</head>
<body>
<div class="Audi3040">
<form action="/board/updateBoard" method="post">
<input type="hidden" value="${boardVO.boardCode }" name="boardCode">
  <div class="form-group">
    <label for="boardTitle">제목</label>
    <input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${boardVO.boardTitle }" required>
  </div>
  <div class="form-group">
    <label for="boardContent">내용</label>
    <textarea class="form-control" id="boardContent" name="boardContent" rows="8" required>${boardVO.boardContent }</textarea>
  </div>
  <div class="form-group">
  	<label for="isSecurity">비밀글</label>
  	<input type="checkbox" name="isSecurity" id="isSecurity" value="1" <c:if test="${boardVO.isSecurity eq 1 }">checked</c:if>>
  </div>
  <div class="submitBtn" style="text-align: center;">
	  <button class="btn btn-primary" type="submit">수정완료</button>
	  <button type="button" class="btn btn-secondary" onclick="location.href='/home/board';">취소</button>
  </div>
</form>
</div>
</html>