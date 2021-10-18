<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/user.css"> 
<%
	UserVo userInfo = (UserVo)session.getAttribute("loginInfo");
	String[] tempArr = {"",""};
	String[] emailArr = userInfo.getEmail().split("@");
	if(emailArr.length<=1){
		emailArr = tempArr;
	}
%>
<script type="text/javascript">
	var passChk = false;
	var repassChk = false;
	var emailChk = false;

	$(document).ready(function(){ 
		$('#imgFile').on('change',function(){
			var fileName = $(this).val();
			$(this).next('.custom-file-label').html(fileName);
		});
	});
	
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
		if(passChk||repassChk||emailChk){
			uForm.submit();
		}
	}
	
	$(document).ready(function(){
		emailChage();
	})
</script>
<%@ include file="../concert/header.jsp" %>
<div class="bodyPart content">
	<div>
		<form:form commandName="user" name="uForm" action="userEdit.ur" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="<%=userInfo.getNum()%>">
		<table class="table table-bordered regiTable">
			<tr>
				<td>아이디</td>
				<td>
					<div class="input-group">
						<input type="text" class="form-control" name="id" value="<%=userInfo.getId()%>" readonly>
					</div>
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
					<input type="text" class="form-control" name="name" value="<%=userInfo.getName()%>" readonly>
				</td>
			</tr>
			<tr>
				<td>프로필 사진</td>
				<td>
					<div class="input-group">
						<div class="custom-file">
							<input type="file" class="custom-file-input" name="imgFile" id="imgFile">
							<label class="custom-file-label" for="imgFile"> </label>
						</div> 
					</div>
					<input type="hidden" name="oldImage" value="<%=userInfo.getImage()%>">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<div class="input-group registRadio">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<input type="radio" name="gender" value="<%=userInfo.getGender()%>" onclick="retrun(false)" checked>
							</div>
							<input type="text" class="form-control-plaintext" value="남자" readonly>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>
					<input type="number" class="form-control" name="age" value="<%=userInfo.getAge()%>">
					<form:errors cssClass="err" path="age"/>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<div class="input-group">
						<input type="text" id="startEmail" onblur="emailChage()" class="form-control regiEmailF" value="<%=emailArr[0]%>">
						<div class="input-group-append">
							<span class="input-group-text">@</span>
						</div>
						<input type="text" class="form-control regiEmailS" id="endEmail">
						<select class="custom-select" id="eEmail" onchange="emailChage()">
							<option selected value="" <%if(emailArr[1].equals("")){%>selected<%}%>>직접입력</option>
							<option value="naver.com" <%if(emailArr[1].equals("naver.com")){%>selected<%}%>>네이버</option>
							<option value="gamil.com" <%if(emailArr[1].equals("gamil.com")){%>selected<%}%>>구글</option>
							<option value="daum.net" <%if(emailArr[1].equals("daum.net")){%>selected<%}%>>다음</option>
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
					<input type="text" class="form-control" name="phone" value="<%=userInfo.getPhone()%>">
					<form:errors cssClass="err" path="phone"/>
				</td>
			</tr>
			<tr>
				<td>지역</td>
				<td>
					<div class="input-group">
						<select class="custom-select" name="area">
							<option <%if(userInfo.getArea().equals("")){%>selected<%} %>>-선택-</option>
							<option value="서울" <%if(userInfo.getArea().equals("서울")){%>selected<%} %>>서울</option>
							<option value="경기도" <%if(userInfo.getArea().equals("경기도")){%>selected<%} %>>경기도</option>
							<option value="강원도" <%if(userInfo.getArea().equals("강원도")){%>selected<%} %>>강원도</option> 
							<option value="충청북도" <%if(userInfo.getArea().equals("충청북도")){%>selected<%} %>>충청북도</option>
							<option value="충청남도" <%if(userInfo.getArea().equals("충청남도")){%>selected<%} %>>충청남도</option>
							<option value="경상북도" <%if(userInfo.getArea().equals("경상북도")){%>selected<%} %>>경상북도</option>
							<option value="경상남도" <%if(userInfo.getArea().equals("경상남도")){%>selected<%} %>>경상남도</option>
							<option value="전라북도" <%if(userInfo.getArea().equals("전라북도")){%>selected<%} %>>전라북도</option>
							<option value="전라남도" <%if(userInfo.getArea().equals("전라남도")){%>selected<%} %>>전라남도</option>
							<option value="제주도" <%if(userInfo.getArea().equals("제주도")){%>selected<%} %>>제주도</option>
						</select>
					</div>
					<form:errors cssClass="err" path="area"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="txtCenter">
					<input type="button" class="btn btn-outline-dark" value="수정" onclick="submitFun()">
				</td>
			</tr>
		</table>
		</form:form>
	</div>
</div>
<%@ include file="../concert/footer.jsp" %>