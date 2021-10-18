<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/concert.css"> 
<%@ include file="../concert/header.jsp" %>
<script type="text/javascript">
	function goDetail(svc){
		svc.submit();
	}
</script>
<div class="bodyPart content">
	<div>분류</div>
	<div>
		<ul class="concertUl">
			<c:forEach items="${concertList}" var="concert">
				<li>
					<div class="concertListDiv"> 
						<form name="${concert.SVCID}" method="post" action="concertDetail.do">
							<a onclick="goDetail(${concert.SVCID})">
								<div class="concertListSpan">
									<img src="${concert.IMGURL}" class="concertListImg">
								</div>
								<dl>
									<dt class="textoverflow">${concert.SVCNM}</dt>
									<dd class="place textoverflow">${concert.PLACENM}</dd> 
									<c:if test="${concert.SVCSTATNM eq '접수종료'}">
										<dd class="svcstat2">${concert.SVCSTATNM}</dd>
										<dd class="area2">${concert.AREANM}</dd>
									</c:if>
									<c:if test="${concert.SVCSTATNM eq '접수중'}">
										<dd class="svcstat">${concert.SVCSTATNM}</dd>
										<dd class="area">${concert.AREANM}</dd>
									</c:if>
								</dl> 
							</a>
							<fmt:parseDate value="${concert.RCPTBGNDT}" var="pRcptbgndt" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${pRcptbgndt}" var="fRcptbgndt" pattern="yyyy-MM-dd"/>
							<fmt:parseDate value="${concert.RCPTENDDT}" var="pRcptenddt" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${pRcptenddt}" var="fRcptenddt" pattern="yyyy-MM-dd"/>
							${fRcptbgndt}~${fRcptenddt}
							<input type="hidden" name="svcid" value="${concert.SVCID}">
						</form>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<%@ include file="../concert/footer.jsp" %>