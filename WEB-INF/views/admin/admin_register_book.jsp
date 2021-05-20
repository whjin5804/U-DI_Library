<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/admin_register_book.css?ver=11" rel="stylesheet">
<style>
.required{
	color: red;
	font-weight: bold;
}
</style>
</head>
<body>

<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">도서 관리</h1>
    <p class="lead pJumbotron"  style="">도서 신규 등록</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<div class="registerBookDiv">
<form action="/admin/insertBookForAdmin" method="post" enctype="multipart/form-data">
  <div class="form-row">
    <div class="col-md-8 mb-3">
      <label for="bookTitle">도서 제목&nbsp;<span class="required">*</span></label>
      <input type="text" class="form-control" id="bookTitle" name="bookTitle" required>
    </div>
    <div class="col-md-4 mb-3">
      <label for="author">작가&nbsp;<span class="required">*</span></label>
      <input type="text" class="form-control" id="author" name="author" required>
    </div>
  </div>
  <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="publisher">출판사&nbsp;<span class="required">*</span></label>
      <input type="text" class="form-control" id="publisher" name="publisher" required>
    </div>
    <div class="col-md-3 mb-3">
      <label for="bookPublicationDate">도서 발행년도&nbsp;<span class="required">*</span></label>
      <input type="text" class="form-control" id="bookPublicationDate" name="bookPublicationDate" required>
    </div>
    <div class="col-md-3 mb-3">
  		<label for="bookClass">도서 장르&nbsp;<span class="required">*</span></label>
  		<select id="bookClass" class="form-control" name="bookClass">
  			<c:forEach items="${bookClassList }" var="bookClassInfo">
				<option value="${bookClassInfo.bookClass }">${bookClassInfo.bookClass }. ${bookClassInfo.bookClassName }</option>
			</c:forEach>
  		</select>
  	</div>
  </div>
  <div class="form-row">
  	<div class="col-md-12 mb-3">
  		<label for="bookPreview">도서 설명&nbsp;<span class="required">*</span></label>
  		<textarea class="form-control" id="bookPreview" name="bookPreview" required></textarea>
  	</div>
  </div>
  <div class="form-row">
  	<div class="col-md-3 mb-3">
  		<label for="bookImageFile">책 표지 이미지</label>
  		<input type="file" id="bookImageFile" name="bookImageFile">
  	</div>
  	
  </div>
  <button class="btn btnBlue btn-lg btn-block" type="submit">도서 등록</button>
</form>
</div>
</body>
</html>