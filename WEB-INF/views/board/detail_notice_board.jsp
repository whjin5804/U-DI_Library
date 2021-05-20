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
<script type="text/javascript">
$(document).ready(function(){ 

	$(document).on('click', '.deleteBoard', function() {
		let boardCode = $('.boardCode').val();
		let isDelete = confirm('정말 삭제하시겠습니까?');
		if(isDelete){
			location.href='/board/deleteBoardNotice?boardCode=' + boardCode;
		}
		
	});
	

	 
}); /*로딩화면 끝*/ 
</script>
</head>
<body>
<div class="Audi3040">
<input type="hidden" value="${board.boardCode }" name="boardCode" class="boardCode">
<input type="hidden" value="${board.boardTitle }" name="boardTitle" class="boardTitle">
<input type="hidden" value="${board.boardContent }" name="boardContent" class="boardContent">
<input type="hidden" value="${board.regDate }" name="regDate" class="regDate">
<input type="hidden" value="${board.regMember }" name="regMember" class="regMember">
  <div class="form-group">
    <div class="row">
		<div class="col-3">
			${board.boardTitle }
		</div>
		<div class="offset-7 col-2">
			${board.regDate } 
		</div>    
    </div>
    <div class="row">
    	<div class="col">
    		작성자 : ${board.memberName }
    	</div>
    </div>
  </div>
  <hr>
  <div class="form-group">
  </div>
  <div class="form-group">
    ${board.boardContent }
  </div>
  <hr>
  <div class="row" style="text-align: center;">
  	<div class="col">
	  	<c:if test="${sessionScope.loginInfo.isAdmin.equals('Y') || sessionScope.loginInfo.memberCode eq board.regMember}">
	  		<button class="btn btn-danger deleteBoard" >삭제</button>
	  	</c:if>
  	</div>
  </div>
  <div style="text-align: right;">
  	<button class="btn btn-warning" onclick="location.href='/home/board';">
  		목록
  	</button>
  </div>
</div>
</body>
</html>