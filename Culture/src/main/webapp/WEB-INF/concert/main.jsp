<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
main<br>
${concertList[2][placenm]}
<table border="1">
	<tr>
		<c:forEach items="${concertList}" var="concert">
				<td width="230">
					<img src="${concert.IMGURL}" width="230" height="200">
					${concert.PLACENM}
				</td>
		</c:forEach>
	</tr>
</table> 