<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="/board/insertBoard" method="post">
  <div class="form-group">
    <label for="boardTitle">제목</label>
    <input type="text" class="form-control" id="boardTitle" value="${boardVO.boardTitle }" name="boardTitle" required>
  </div>
  <div class="form-group">
    <label for="boardContent">내용</label>
    <textarea class="form-control" id="boardContent" name="boardContent"  rows="8" required>${boardVO.boardContent }</textarea>
  </div>
  <div class="form-group">
  	<label for="isSecurity">비밀글</label>
  	<input type="checkbox" name="isSecurity" id="isSecurity" value="1">
  </div>
  <div class="submitBtn" style="text-align: center;">
	  <button class="btn btn-primary" type="submit">작성완료</button>
	  <button class="btn btn-secondary">취소</button>
  </div>
</form>
</div>
</body>
</html>