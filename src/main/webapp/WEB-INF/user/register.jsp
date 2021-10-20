<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/user.css"> 
<script type="text/javascript">
	var duplChk = false;
	var passChk = false;
	var repassChk = false;
	var emailChk = false;
	
	$(document).ready(function(){
		 $('#imgFile').on('change',function(){
            var fileName = $(this).val();
            $(this).next('.custom-file-label').html(fileName);
        })
	})
	
	function idCheck(){
		$("#errId").html("");
    	$("#errId").removeClass("err");
		$.ajax({
			type : "post",
            url : "<%=request.getContextPath()%>/idchack.ur",
            data : {id :$("#id").val()},
            dataType : "text",
            success : function(result){
                if(result=="empty"){
                	$("#errId").html("아이디를 입력해주세요.");
                	$("#errId").addClass("err");
                	duplChk = false;
                }else if(result == "N"){
                	$("#errId").html("사용가능한 아이디입니다.");
                	duplChk = true;
                }else{
                	$("#errId").html("사용중인 아이디 입니다.");
                	$("#errId").addClass("err");
                	duplChk = false;
                }
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                alert("서버 오류 발생")
            }
		})
	}
	
	function passwdChk(){
		$("#errPassWd").html("");
		passChk = false;
		
		var pw = $("#passwd").val();
		var res = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		if(!res.test(pw)){
			$("#errPassWd").html("최소 하나의 문자 및 숫자포함 8자 이상이여야 합니다.");
			return;
		}
		passChk = true;
	}
	
	function idChange(){
		duplChk = false;
		$("#errId").html("");
    	$("#errId").removeClass("err");
	}
	
	function rePasswd(){
		var pw = $("#passwd").val();
		var repw = $("#repasswd").val();
		if(pw == repw){
			repassChk = true;
			$("#errRePassWd").html("");
		}else{
			repassChk = false;
			$("#errRePassWd").html("비밀번호가 일치하지 않습니다.");
		}
	}
	
	function emailChage(){
		var eEmail = $("#eEmail").val();
		$("#endEmail").val(eEmail);
		if(eEmail != ""){
			$("#endEmail").attr("readonly","");
		}else{
			$("#endEmail").removeAttr("readonly");
		}
		
		var eamil1 = $("#startEmail").val();
		var eamil2 = $("#endEmail").val();
		
		$("#email").val(eamil1+"@"+eamil2);
		
		if(eamil1 != ""){
			$("#errEmail").html("");
			emailChk = true;
		}else{
			$("#errEmail").html("email을 정확히 입력해주세요.");
			emailChk = false;
		}
	} 
	function submitFun(){
		if(duplChk||passChk||repassChk||emailChk){
			uForm.submit();
		}
	}
</script>
<%@ include file="../concert/header.jsp" %>
<div class="bodyPart content">
	<div>
		<form:form commandName="user" name="uForm" action="register.ur" method="post" enctype="multipart/form-data">
		<table class="table table-bordered regiTable">
			<tr>
				<td>아이디</td>
				<td>
					<div class="input-group">
						<input type="text" class="form-control" name="id" id="id" onchange="idChange()">
						<div class="input-group-append">
							<input type="button" class="btn btn-outline-secondary" value="중복확인" onclick="return idCheck()">
						</div>
					</div>
					<span id="errId" class="errChk"></span> 
					<form:errors cssClass="err" path="id"/>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" class="form-control" name="passwd" id="passwd" onchange="passwdChk()"> 
					<span id="errPassWd" class="err errChk"></span>
					<form:errors cssClass="err" path="passwd"/>
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input type="password" class="form-control" id="repasswd" onchange="rePasswd()">
					<span id="errRePassWd" class="err errChk"></span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" class="form-control" name="name">
					<form:errors cssClass="err" path="name"/>
				</td>
			</tr>
			<tr>
				<td>프로필 사진</td>
				<td>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">사진</span>
						</div>
						<div class="custom-file">
							<input type="file" class="custom-file-input" name="imgFile" id="imgFile">
							<label class="custom-file-label" for="imgFile"> </label>
						</div> 
					</div>
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<div class="input-group registRadio">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<input type="radio" name="gender" value="남자">
							</div>
							<input type="text" class="form-control-plaintext" value="남자" readonly>
						</div>
					</div>
					<div class="input-group registRadio">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<input type="radio" name="gender" value="여자">
							</div>
							<input type="text" class="form-control-plaintext" value="여자" readonly>
						</div>
					</div>
					<form:errors cssClass="err" path="gender"/>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>
					<input type="number" class="form-control" name="age">
					<form:errors cssClass="err" path="age"/>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<div class="input-group">
						<input type="text" id="startEmail" onblur="emailChage()" class="form-control regiEmailF">
						<div class="input-group-append">
							<span class="input-group-text">@</span>
						</div>
						<input type="text" class="form-control regiEmailS" id="endEmail">
						<select class="custom-select" id="eEmail" onchange="emailChage()">
							<option selected value="">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="gamil.com">구글</option>
							<option value="daum.net">다음</option>
						</select>
					</div>
					<input type="hidden" name="email" id="email">
					<span id="errEmail" class="err errChk"></span>
					<form:errors cssClass="err" path="email"/>
				</td> 
			</tr>
			<tr>
				<td>전화 번호</td>
				<td>
					<input type="text" class="form-control" name="phone">
					<form:errors cssClass="err" path="phone"/>
				</td>
			</tr>
			<tr>
				<td>지역</td>
				<td>
					<div class="input-group">
						<select class="custom-select" name="area">
							<option selected>-선택-</option>
							<option value="서울">서울</option>
							<option value="경기도">경기도</option>
							<option value="강원도">강원도</option> 
							<option value="충청북도">충청북도</option>
							<option value="충청남도">충청남도</option>
							<option value="경상북도">경상북도</option>
							<option value="경상남도">경상남도</option>
							<option value="전라북도">전라북도</option>
							<option value="전라남도">전라남도</option>
							<option value="제주도">제주도</option>
						</select>
					</div>
					<form:errors cssClass="err" path="area"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="txtCenter">
					<input type="button" class="btn btn-outline-dark" value="회원가입" onclick="submitFun()">
				</td>
			</tr>
		</table>
		</form:form>
	</div>
</div>
<%@ include file="../concert/footer.jsp" %>
