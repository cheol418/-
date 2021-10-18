<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/concert.css">
<script type="text/javascript">
	var pageNumber = <%=request.getParameter("pageNumber")%>;
	var miniclass = "<%=request.getParameter("miniclass")%>";
<<<<<<< HEAD
=======
	
>>>>>>> branch 'master' of https://github.com/ghkdtpehd/Project_JHLK.git
	function goDetail(svc){
		svc.submit();
	}
	
	function listLift(){
		if(pageNumber == 1){
			alert("이전페이지가 없습니다.");
			return;
		}
		location.href="list.do?pageNumber="+(pageNumber-1)+"&miniclass="+miniclass;
	}
	
	function listRight(){
		location.href="list.do?pageNumber="+(pageNumber+1)+"&miniclass="+miniclass;
	}
	
	function sherchClass(){
		location.href="list.do?pageNumber=1&miniclass="+$("#miniclass").val();
	}
	
	function enterDown(){
		if(window.event.keyCode == 13){
			sherchClass();
		}
	}
</script>
<%@ include file="../concert/header.jsp" %>
<div class="bodyPart content">
	<div class="serchBox">
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">소분류</span>
			</div>
			<input type="text" class="form-control" id="miniclass" value="<%=request.getParameter("miniclass")%>" onkeydown="enterDown()">
			<div class="input-group-append">
				<input type="button" class="btn btn-outline-secondary" value="검색" onclick="sherchClass()">
			</div> 
		</div>
	</div>
	<c:if test="${concertList ne null}">
		<div>
			<div class="floatL">
				<a class="listA" onclick="return listLift()">
					<img class="listArrowImg" src="resources/images/arrowLeft.png">
				</a>
			</div>
			<div class="floatL listM">
				<ul class="concertUl">
					<c:forEach items="${concertList}" var="concert">
						<li>
							<div class="concertListDiv"> 
								<form name="${concert.SVCID}" method="post" action="concertDetail.do">
									<input type="hidden" name="pageNumber" value="<%=request.getParameter("pageNumber")%>">
									<input type="hidden" name="miniclass" value="<%=request.getParameter("miniclass")%>">
									<a onclick="goDetail(${concert.SVCID})">
										<div class="concertListSpan">
											<img src="${concert.IMGURL}" class="concertListImg">
										</div>
										<dl>
											<dt class="textoverflow">${concert.SVCNM}</dt>
											<dd class="place textoverflow">${concert.PLACENM}</dd> 
											<c:if test="${concert.SVCSTATNM eq '접수종료'}">
												<dd class="svcstat2">${concert.SVCSTATNM}</dd>
												<dd class="area2">
													${concert.AREANM}
													<c:if test="${concert.AREANM eq ''}">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</c:if>
													</dd>
											</c:if>
											<c:if test="${concert.SVCSTATNM eq '접수중'}">
												<dd class="svcstat">${concert.SVCSTATNM}</dd>
												<dd class="area">${concert.AREANM}</dd>
											</c:if>
											<c:if test="${concert.SVCSTATNM eq '예약일시중지'}">
												<dd class="svcstat3">${concert.SVCSTATNM}</dd>
												<dd class="area3">${concert.AREANM}</dd>
											</c:if>
											<c:if test="${concert.SVCSTATNM eq '안내중'}">
												<dd class="svcstat4">${concert.SVCSTATNM}</dd>
												<dd class="area4">${concert.AREANM}</dd>
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
			<div class="floatL">
				<a class="listA" onclick="listRight()">
					<img class="listArrowImg" src="resources/images/arrowRight.png">
				</a>
			</div>
		</div>
	</c:if>
	<c:if test="${concertList eq null}">
		<div class="alert alert-info">
			해당 정보가 없습니다.
		</div>
	</c:if>
</div>
<%@ include file="../concert/footer.jsp" %>