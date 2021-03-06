<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resources/include/menu.jsp"%>

<style>
html { background: url(/resources/images/create11.jpg) no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover; }


.main-button{
border-radius: 10px;
}

.text-fields{
width: 65%;
}

.col-xs-10{
margin-top: 15%;
}
#contact-form{
width: 150%;
}

.col-md-1{

}
</style>

<div class="col-xs-10 col-md-3 col-md-offset-4">
<form id="contact-form" action="/member/create" method="post">
	
			<input type="submit" value="Id체크" id="chkDupId" style="width: 70px; border-radius: 10px; ">
	
	<div class="text-fields"> 
		<div class="float-input">
			<input type="text" name="userid" id ="userid"  placeholder="아이디" style="width: 100%;">
			
			<span><i class="fa fa-user"></i></span>
		</div>	
		<div class="float-input">
			<input type="text" name="email" placeholder="이메일">
			<span><i class="fa fa-envelope-o"></i></span>
		</div>
		
		<div class="float-input">
			<input type="password" name="userpw" placeholder="비밀번호" id="password" style="width: 100%; padding: 19px; border: white;">
			<span><i class="fa fa-link"></i></span>
		</div>
		
		<input type="submit"  class="main-button" value="회원가입" style="margin: 1px;"  onclick="validate_user_text();">
		
		<input type="submit" id="goListBtn" class="main-button" value="목록으로">
			
	</div>
</form>


		

	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous"></script>


	<script>
		var swear_words_arr = new Array("섹스", "대출", "무이자", "병신", "씨발", "개새끼",
				"십새끼", "개년", "누드", "조건만남", "필로폰", "마약", "바다이야기", "바카라", "시알리스",
				"비아그라", "멍청이", "똥개", "씹년", "미친년", "엠창", "호로새끼", "자지", "보지","빙신","뵹신","잡년"); // 제한 목록

		var swear_alert_arr = new Array;

		var swear_alert_count = 0;

		function reset_alert_count() {
			swear_alert_count = 0;
		}

		function validate_user_text() {
			reset_alert_count();
			var compare_text = document.getElementById("userid").value;
			for (var i = 0; i < swear_words_arr.length; i++) {
				for (var j = 0; j < (compare_text.length); j++) {
					if (swear_words_arr[i] == compare_text.substring(j,
							(j + swear_words_arr[i].length)).toLowerCase()) {
						swear_alert_arr[swear_alert_count] = compare_text
								.substring(j, (j + swear_words_arr[i].length));
						swear_alert_count++;
					}
				}
			}
			var alert_text = "";
			for (var k = 1; k <= swear_alert_count; k++) {
				alert_text += "n" + "(" + k + ")" + swear_alert_arr[k - 1];
			}

			if (swear_alert_count > 0) {

				$("#contact-form").submit(function(event) {
					event.preventDefault();
					// 불량단어 나왔을때 멘트
					alert(alert_text + "는 입력할 수 없는 단어입니다. 예쁜 말을 써주세요");
					// 불량단어 나왔을때 멘트
					document.getElementById("userid").select();
					self.location = "/member/create";
				});
				return;

			} else {
				
				var formObj = $("#contact-form");
				$(".main-button").on("click", function() {
					formObj.attr("action", "/member/create");
					formObj.attr("method", "post");
					formObj.submit();
					return;
				});
			}

		}
		function select_area() {

			document.getElementById("userid").select();
		}

		window.onload = reset_alert_count;
	</script>
		
		
<script>

$("#goListBtn ").on("click", function(event) {
	event.preventDefault();
	self.location = "/member/login";
});

		$(document).ready(function(){
			
			
			
			
			var checkedId = false;
			
			$("#contact-form").submit(function(event){
				
				if(checkedId == true){
					alert("회원가입 되셨습니다.");
					return true;
				}
				if(checkedId ==false){
					alert("아이디를 확인해 주세요");
					return false;
				}
				
			});
			
$("#chkDupId").on("click",function(){
	$.ajax({
		type:"POST",
		url : "/member/chkDupid",
		data : {"userid" : $("#userid").val()},
		
		success: function(data){
			
			if($.trim(data) == 0){
				alert("가입가능");
				$("#idck").html('<b style ="font-size:18px; color:blue">사용가능</b>');
				checkedId = true;
			}else{
				alert("사용불가");
				$("#idck").html('<b style ="font-size:18px; color:red">사용불가</b>');
				checkedId = false;
			}
		}
		
	});
	return false;
});
});


		
</script>
</div>
<%@ include file="/resources/include/main.jsp"%>