<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/lib_lecture_manage.css?ver=11" rel="stylesheet">
<!-- 현재 날짜부터 예약 가능 (이전 날짜는 달력 비활성화) -->
<script>
	$(function(){
	    $('[type="date"].min-today').prop('min', function(){
	        return new Date().toJSON().split('T')[0];
	    });
	});
	
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		bir = document.getElementById("lectureDate");
		bir.value = today;
	}
</script>
</head>
<body>
<!-- jumbyton -->
<div class="jumbotron jumbotron-fluid headJubmotron" >
  <div class="container">
    <h1 class="display-4 h1Jumbotron" style="">일정 관리</h1>
    <p class="lead pJumbotron"  style="">행사 일정 등록</p>
  </div>
</div>
<hr style="margin-bottom: 30px;">

<div class="lectureDiv">
<form action="/admin/insertLecture" method="post">
  <div class="form-group">
  <div class="form-group">
    <label for="lectureDate">행사 날짜</label>
    <input type="date" class="form-control min-today" id="lectureDate" name="lectureDate1" data-date-split-input="true" required>
  </div>
   <div class="form-group">
    <label for="lecturePlace">행사 장소</label>
    <select class="form-control" id="lecturePlace" name="lecturePlace">
      <c:forEach items="${studyRoomList }" var="studyRoom">
         <option value="${studyRoom.studyRoomCode }">
            ${studyRoom.studyRoomName }
         </option>
      </c:forEach>
    </select>
  </div>
  <div class="form-group">
    <label for="lectureTime">행사 시간</label>
    <select class="form-control" id="lectureTime" name="lectureTime">
    <c:forEach begin="1" end="4" var="i">
      <option value="<c:out value="${i}" />"><c:out value="${i}" />시간</option>
    </c:forEach>
    </select>
  </div>
    <label for="lectureName">행사 이름</label>
    <input type="text" class="form-control" id="lectureName" name="lectureName" required>
  </div>
  <div class="form-group">
    <label for="lecturer">강연자</label>
    <input type="text" class="form-control" id="lecturer" name="lecturer" required>
  </div>
  
 
  <button type="submit" class="btn btn-primary btn-lg btn-block btn-margin">입력 완료</button>
</form>
</div>


</body>
</html>