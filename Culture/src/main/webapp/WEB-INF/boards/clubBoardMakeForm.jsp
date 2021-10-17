<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/user.css">

<script type="text/javascript">

	
	$(".clubMakingBtn").on("click", function(){	  
		var formObj = $("form[name='clubBoardMake']");
		 formObj.attr("action", "/clubBoardMakeForm.bd");
		 formObj.submit();
	});

</script>
    
    <c:forEach var="concert" items="${concertList}" varStatus="statusClist">
    	<c:if test="${concert.SVCID eq SVCID}">
    	<h3>모집 개시 카드 - 나중에 팝업/모달/아무튼 위에 띄우는 창 형식으로.</h3>    	
	    	<form name="board" action="clubBoardMakeForm.bd" method="post">
		    		콘서트 SVCID: <input type="text" name="svcid" value="${concert.SVCID}" readonly/></br>
					콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
					콘서트 이름: ${concert.SVCNM}</br>
					콘서트 장소: ${concert.PLACENM}<br/>	
					테스트: ${uid}_${concert.SVCID}<br/>					
					같이가 모집 추죄자: <input type="text" name="writer" value="${uid}" readonly/></br>					
					같이가 모집 제목: <input type="text" name="title" value="공연 제목 넣기"/></br>
					같이가 모집 한마디: <input type="text" name="content" value="${board.content}"/></br>
					<input type="hidden" name="category" value="${uid}_${concert.SVCID}"/></br>		
					<button type="submit">작성</button>
			</form>		
    	</c:if>
    </c:forEach>
    