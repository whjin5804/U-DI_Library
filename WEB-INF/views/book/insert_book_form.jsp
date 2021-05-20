<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
(function($){
	validation = function(){
		$('#insertBookForm').submit();
	};
})(jQuery);
</script>
</head>
<body>
<div class="Audi3040">
	<div class="col">
		<form action="/book/insertBook" method="post" id="insertBookForm" enctype="multipart/form-data">
			<table>
				<tr>
					<th>책 제목</th>
					<td>
						<input type="text" name="bookTitle">
					</td>
				</tr>
				<tr>
					<th>출판사</th>
					<td>
						<input type="text" name="publisher">
					</td>
				</tr>
				<tr>
					<th>작가</th>
					<td>
						<input type="text" name="author">
					</td>
				</tr>
				<tr>
					<th>도서 발행년도</th>
					<td>
						<input type="number" name="bookPublicationDate">년도
					</td>
				</tr>
				<tr>
					<th>책 설명</th>
					<td>
						<textarea rows="" cols="" name="bookPreview"></textarea>
					</td>
				</tr>
				<tr>
					<th>책표지 이미지</th>
					<td>
						<input type="file" name="bookImageFile" >
					</td>
				</tr>
				<tr>
					<th>책 장르 분류</th>
					<td>
						<select name="bookClass">
							<c:forEach items="${bookClassList }" var="bookClassInfo">
								<option value="${bookClassInfo.bookClass }">${bookClassInfo.bookClass }. ${bookClassInfo.bookClassName }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
		</form>
		<div class="col">
			<input type="button" value="책 추가" onclick="validation();">
		</div>
	</div>
</div>
</body>
</html>