<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form role="form" action="modifyPage" method="post">

	<input type = 'hidden' name='page' value= "${cri.page}">
	<input type = 'hidden' name='perPageNum' value= "${cri.perPageNum}">
	<input type = 'hidden' name='searchType' value= "${cri.searchType}">
	<input type = 'hidden' name='keyword' value= "${cri.keyword}">
	
	
	<div class ="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">BNO</label>
			<input type="text" name="bno" class="form-control" value="${boardVO.bno}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label>
			<input type ="text" name="btitle" class="form-control" value="${boardVO.btitle}">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="bcontent" rows="3">"${boardVO.bcontent}"</textarea>
		</div>
	</div>
	<!--/.box-body  -->
</form>

<div class="box-footer">
	<button type="submit" class="btn btn-primary">SAVE</button>
	<button type="submit" class="btn btn-warning">CANCEL</button>
</div>

<script src="https://code.jquery.com/jquery-2.2.4.js"
integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
crossorigin="anonymous"></script>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$(".btn-warning").on("click", function(){
			self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});
		
		$(".btn-primary").on("click", function(){
			formObj.submit();
		});
	});
</script>
</body>
</html>
