<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<form role="form" action="mupdate" method="post">

		<input type='hidden' name='page' value="${cri.page}">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">


		<div id="updateMain">
			<input type="text" readonly="readonly" name="membername" value="${MemberVO.membername}">
			<input type="hidden" name="page" value="${param.page}"> 
			<input type="text" name="email" value="${MemeberVO.email}">
			<input type="text" readonly="readonly" name="joindate" value="${MemeberVO.joindate}">
		</div>
		
		<!-- /.box-body -->
	</form>
	
	
	<div class="box-footer">
		<button type="submit" class="btn btn-primary">저장</button>
		<button type="submit" class="btn btn-warning">취소</button>
	</div>

	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
		
			var formObj = $("form[role='form']");
			console.log(formObj);
		$(".btn-warning").on("click", function() {
			self.location = "/surveyMain/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
											});
							$(".btn-primary").on("click", function() {
								formObj.submit();
							});
						});
	</script>
</body>
</html>