<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/resources/include/menu.jsp" %>
<style>
#img{
	width: 200px;
	height: 200px;
	text-align: center;
}

.box {
    position: relative;
    border-radius: 3px;
    background: #ffffff;
    border-top: 3px solid #d2d6de;
    margin-bottom: 20px;
    width: 100%;
    box-shadow: 0 1px 1px rgba(0,0,0,0.1);
}

.box-title{

background-color: #1ab5b3;
padding: 25px;
}

#goListBtn, #qnumNext, #prevNext{
	background: #1ab5b3;
  	color: #fff;
  	border: none;
  	padding: 8px;
  	border-radius: 10px;
}

#prevNext{
background-color: #107cb7;
}

#qnumNext{
background-color: #107cb7;
}

#prev{
float:left;
border: 5px solid white;
}
#goListBtn{
float:left;
border: 5px solid white;
}
#next{
float: left;
border: 5px solid white;

}

</style>






<!-- Main content -->
    <section class="content">

      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">글번호 : ${vo.smno}</h3> 
        </div>
        <!-- /.box-header -->
        
        <div class="testimonial">
								
								<ul>												
									<li>
										<p>문제<label>${qnum+1}</label></p>
									</li>
								</ul>
							</div>
        
        
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
               
                
                <form action="/surveyView/readDetail" method="get">
				<input type="hidden" name="smno" value="${vo.smno}">
				<input type="hidden" name="page" value="${param.page}">


							<div class="post-info">
								
								<ul>
									<li>
										<span><i class="fa fa-comment"></i></span>${vo.sdtitle}
									</li>
									<li>
										<span><i class="fa fa-comment"></i></span>${vo.sdcontent}
									</li>
									<li><img id = "img"src='/upload/displayFile?fileName=${vo.attachFile}'></li>
									<li>
										<input type="radio" name='answer' value="O" class="oxAnswer">O
										<input type="radio" name='answer' value="X" class="oxAnswer">X
									</li>
									</ul>
							</div>
			
					
				</form>

	
	
	<div id = "prev"></div>
		
		<button id="goListBtn">목록으로</button>
		
	<div id = "next"></div>
	
          


        </div>
  
      </div>

		</div>
	</div>
</div>
    </section>
    <!-- /.content -->




<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous"></script>

<script>
var smno = ${vo.smno};

var sdno = ${vo.sdno};

var userid = '${login.userid}';
var qnum = ${qnum};

function checkAnswer(){
	
	console.log("check Answer.............................................");
	
    var answer = $(':input[name=answer]:radio:checked').val();
     
    if( answer ){
        goNext1();
        
        var data ={ smno : smno,
    		    sdno : sdno,
    		    userid : userid,
    		      answer : answer};
        
        $.ajax({
    		type : "post",
    		url : "/answer/oxAnswer/",
    		headers : {
    			"Content-Type":"application/json",
    			"X-HTTP-Method-Override" : "POST"
    		},
    		data :JSON.stringify(data),
    		success : function(result){
    			if(result == "SUCCESS"){
    				
    			}
    		}
    	});
        
        return true;
        
        
    }else{
        alert("번호를 선택 하세요.");
        return false;
    }  
}

var next = "";

var prev = "";

if(qnum >= 0){
	var next = "<button id='qnumNext' onclick='checkAnswer()'>다음</button>";
}
$("#next").html(next);


function goNext1(){
	
	qnum = qnum+1;
	self.location = "/surveyView/readDetail?smno="+smno+"&page=1&qnum="+qnum;
	
}


if(qnum > 0){
	var prev = "<button id='prevNext'>이전</button>";
}
$("#prev").html(prev);


$("#prevNext").on("click",function(){
	
	qnum = qnum-1;
	
	self.location = "/surveyView/readDetail?smno="+smno+"&page=1&qnum="+qnum;
	var sdnomus = ${vo.sdno-1};
	$.ajax({
		type : "delete",
		url : "/answer/"+sdnomus+"/"+userid,
		
		success : function(result){
			console.log("result : " +result );
			if(result == "SUCCESS"){
				
				
			}						
		}
	});

	
	
});



$("#goListBtn ").on("click", function(event) {
	event.preventDefault();
	self.location = "/surveyMain/listPage?page=1";
});




</script>

<script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_polaris',
    radioClass: 'iradio_polaris',
    increaseArea: '-10%' // optional
  });
});
</script>


<%@ include file="/resources/include/main.jsp"%>