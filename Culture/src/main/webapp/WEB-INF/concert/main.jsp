<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script type="text/javascript">
	function goDetail(svc){
		svc.submit();
	}
</script>
<style>
  #map {
    height: 500px;
    width: 500px;
  }
  html, body {
    height: 100%;
    margin: 0;
    padding: 0;
  }
</style>
<table border="1">
	<tr>
		<c:forEach items="${concertList}" var="concert" varStatus="status">
				<td width="230" align="center">
					<form name="${concert.SVCID}" method="post" action="concertDetail.do">
						<a onclick="goDetail(${concert.SVCID})">
							<img src="${concert.IMGURL}" width="230" height="200">
						</a>
						${concert.PLACENM}
						<input type="hidden" name="svcid" value="${concert.SVCID}">
					</form>
				</td>
		</c:forEach>
	</tr>
</table> 