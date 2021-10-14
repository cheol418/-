<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/user.css"> 
<script type="text/javascript">
	function idFind(){
		$.ajax({
			type : "post",
            url : "<%=request.getContextPath()%>/idFind.ur",
            data : {
            		name :$("#name1").val(),
            		email :$("#email1").val()
            		},
            dataType : "text",
            success : function(result){
            	if(result=="empty"){
 	    	       	alert("전부 입력해주세요.");
            	}else{
	            	alert("아이디는 "+result+"입니다.");
	            	$("#name1").val("");
	        		$("#email1").val("");
            	}
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                alert("서버 오류 발생")
            }
		})
	}
	
	function passwdFind(){
		$.ajax({
			type : "post",
            url : "<%=request.getContextPath()%>/passwdFind.ur",
            data : {
            		id :$("#id2").val(),
            		name :$("#name2").val(),
            		email :$("#email2").val()
            		},
            dataType : "text",
            success : function(result){
            	if(result=="empty"){
 	    	       	alert("전부 입력해주세요.");
            	}else{
	            	alert("비밀번호는 "+result+"입니다.");
	            	$("#id2").val("");
	            	$("#name2").val("");
	        		$("#email2").val("");
            	}
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                alert("서버 오류 발생")
            }
		})
	}
	
	function pageBack(){
		history.back();
	}
</script>
<%@ include file="../concert/header.jsp" %>
<div class="bodyPart content">
	<div>
		<table class="table table-bordered regiTable">
			<tr>
				<th colspan="2">아이디 찾기</th>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<div class="input-group">
						<input type="text" class="form-control" id="name1">
					</div>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<div class="input-group">	
						<input type="text" class="form-control" id="email1">
					</div>
				</td>
			</tr>
			<tr>
				<td class="txtCenter" colspan="2">
					<input type="button" class="btn btn-outline-dark" value="확인" onclick="idFind()">
					<input type="button" class="btn btn-outline-dark" value="돌아가기" onclick="pageBack()">
				</td>
			</tr>
		</table>
	</div>
	<div>
		<table class="table table-bordered regiTable">
			<tr>
				<th colspan="2">비밀번호 찾기</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<div class="input-group">
						<input type="text" class="form-control" id="id2">
					</div>
				</td>
			</tr>
			<tr>
			<tr>
				<td>이름</td>
				<td>
					<div class="input-group">
						<input type="text" class="form-control" id="name2">
					</div>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<div class="input-group">	
						<input type="text" class="form-control" id="email2">
					</div>
				</td>
			</tr>
			<tr>
				<td class="txtCenter" colspan="2">
					<input type="button" class="btn btn-outline-dark" value="확인" onclick="passwdFind()">
					<input type="button" class="btn btn-outline-dark" value="돌아가기" onclick="pageBack()">
				</td>
			</tr>
		</table>
	</div>
</div>
<%@ include file="../concert/footer.jsp" %>
