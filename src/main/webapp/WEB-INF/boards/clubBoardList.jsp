<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/card.css">

<!-- 
	1. 읽어들이기
		일단 가라 만들고 각 항목 가져오는거.
	2. 쓰기
 -->
 
<div class="body" id="Totalclub">
<div class="CardContainer">
<h1>TOTAL LIST</h1>
<div class="CardChatContainer">
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">			
		<c:forEach var="chats" items="${clubBoardChatLists}" varStatus="statusChats">		
			<c:if test="${concert.SVCID eq fn:substringAfter(chats.category, '_')}">				
				
				콘서트 이름: ${concert.SVCNM}</br>
				<img width="100" height="100" src="${concert.IMGURL}"></br>				
				같이가 주최자 이름(ID): ${chats.id}(${chats.name})</br>				
				같이가 모임 이름: ${chats.title}</br>
				같이가 한마디!: ${chats.content}<br/>			
				
				<input type="button" value="상세보기" onClick="location.href='<%=request.getContextPath()%>/clubBoardDetailForm.bd?uid=${chats.id}&chatnum=${chats.num}'"><br/><br/><br/>													
			</c:if>
		</c:forEach>
</c:forEach>
</div>
</div>
</div>

</br></br></br>-------------------</br></br></br>
<div class="body" id="Myclub">
<div class="CardContainer">
<h1>당신(${uid})의 같이가!리스트</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">			
	<c:forEach var="chats" items="${clubBoardChatLists}" varStatus="statusChats">
		<c:if test="${concert.SVCID eq fn:substringAfter(chats.category, '_')}">
			<c:if test="${uid eq fn:substringBefore(chats.category, '_')}">			
										
				콘서트 이름: ${concert.SVCNM}</br>
				<img width="100" height="100" src="${concert.IMGURL}"></br>				
				같이가 주최자 이름(ID): ${chats.id}(${chats.name})</br>				
				같이가 모임 이름: ${chats.title}</br>
				<input type="button" value="상세보기" onClick="location.href='<%=request.getContextPath()%>/clubBoardDetailForm.bd?uid=${chats.id}&chatnum=${chats.num}'"><br/><br/><br/>
			</c:if>
		</c:if>						
	</c:forEach>
</c:forEach>
</div>
</div>
<br/>
<br/>
<br/>
<br/>


 

<!-- 
<div id="Totalclub">
<h1>TOTAL LIST</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">	
		아오_ 콘서트 SVCID: ${concert.SVCID}</br>
		오아_ 카테고리 ID: ${fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}<br/><br/>
	
		<c:if test="${concert.SVCID eq fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}">
				
					<input type="hidden" name="svcid" value="${concert.SVCID}">
					BNO: ${clubBoardChatLists[statusClist.index].bno}<br /> 
					RNO: ${clubBoardChatLists[statusClist.index].rno}<br />
					콘서트 SVCID: ${concert.SVCID}</br>
					콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
					콘서트 이름: ${concert.SVCNM}</br>
					클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
					클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
					클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
					클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
					클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>				
		</c:if>		
	
</c:forEach>
</div>
 -->

<!--
<div id="Totalclub">
<h1>TOTAL LIST</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">	
		
		
		<c:if test="${fn:contains(clubBoardChatLists[statusClist.index].category, '_S')}">
		아아: ${clubBoardChatLists[statusClist.index].category}<br/>
		아아 결과: ${fn:contains(clubBoardChatLists[statusClist.index].category, '_S')}<br/>
		
			<c:set var="ctry_num" value="${concert.SVCID eq fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}"/>
			오오: ${fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}<br/>
			<c:set var="ctry_svcid" value="${concert.SVCID}" />
			허허: ${concert.SVCID}<br/>				
				<c:if test="${concert.SVCID eq fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}">
			후후: ${ctry_num eq ctry_svcid}<br/><br/>		
					<input type="hidden" name="svcid" value="${concert.SVCID}">
					BNO: ${clubBoardChatLists[statusClist.index].bno}<br /> 
					RNO: ${clubBoardChatLists[statusClist.index].rno}<br />
					콘서트 SVCID: ${concert.SVCID}</br>
					콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
					콘서트 이름: ${concert.SVCNM}</br>
					클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
					클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
					클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
					클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
					클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>
				</c:if>		
		</c:if>		
</c:forEach>
</div>
-->


<!--
<div id="Totalclub">
<h1>TOTAL LIST</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">					
		<c:if test="${fn:contains(clubBoardChatLists[statusClist.index].category, '_S')}">
		아아: ${clubBoardChatLists[statusClist.index].category}<br/>
			<c:set var="ctry_num" value="${fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}"/>
			오오: ${fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}<br/>
			<c:set var="ctry_svcid" value="${concert.SVCID}" />
			허허: ${concert.SVCID}<br/>				
				<c:if test="${ctry_num eq ctry_svcid}">
			후후: ${ctry_num eq ctry_svcid}<br/><br/>		
					<input type="hidden" name="svcid" value="${concert.SVCID}">
					BNO: ${clubBoardChatLists[statusClist.index].bno}<br /> 
					RNO: ${clubBoardChatLists[statusClist.index].rno}<br />
					콘서트 SVCID: ${concert.SVCID}</br>
					콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
					콘서트 이름: ${concert.SVCNM}</br>
					클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
					클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
					클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
					클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
					클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>
				</c:if>		
		</c:if>		
</c:forEach>
</div>
-->

<!--
<div id="Totalclub">
<h1>TOTAL LIST</h1>
<c:forEach var="chatlist" items="${clubBoardChatLists}" varStatus="statusChat">			
		<c:if test="${fn:contains(chatlist.category, '_S')}">	
			<c:set var="category_svcid" value="${fn:substringAfter(chatlist.category, '_')}"/>					
					BNO: ${chatlist.bno}<br/> 
					RNO: ${chatlist.rno}<br/>
					
					콘서트 SVCID: ${concertList[statusChat.index].SVCID}</br>
					콘서트 Image: <img width="100" height="100" src="${concertList[statusChat.index].IMGURL}"></br>
					콘서트 이름: ${concertList[statusChat.index].SVCNM}</br>
					클럽 보드 작성자 ID: ${chatlist.id}</br>
					클럽 보드 작성자 이름: ${chatlist.name}</br>
					클럽 보드 같이가 모임 이름: ${chatlist.title}</br>
					클럽 보드 카테고리: ${chatlist.category}</br>
					클럽 보드 내용: ${chatlist.content}</br></br>
										
		</c:if>		
</c:forEach>
-->

<!-- 
</br></br></br>-------------------</br></br></br>

<div id="Myclub">
<h1>My List</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">			
			<c:if test="${uid eq fn:substringBefore(clubBoardChatLists[statusClist.index].category, '_')}">			
					<input type="hidden" name="svcid" value="${concert.SVCID}">
					BNO: ${clubBoardChatLists[statusClist.index].bno}<br/> 
					RNO: ${clubBoardChatLists[statusClist.index].rno}<br/>
					콘서트 SVCID: ${concert.SVCID}</br>
					콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
					콘서트 이름: ${concert.SVCNM}</br>
					클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
					클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
					클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
					클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
					클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>
			</c:if>						
</c:forEach>
</div>
 -->




<!-- 
<div id="clubbing">
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">	
	<c:if test="${fn:contains(clubBoardChatLists[statusClist.index].category, '_S')}">
		<c:set var="ctry_num" value="${fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}"/>
		<c:set var="ctry_svcid" value="${concert.SVCID}" />
		<c:if test="${ctry_num eq ctry_svcid}">
	
	
		<input type="hidden" name="svcid" value="${concert.SVCID}">
		BNO: ${clubBoardChatLists[statusClist.index].bno}<br /> 
		RNO: ${clubBoardChatLists[statusClist.index].rno}<br />
		콘서트 SVCID: ${concert.SVCID}</br>
		콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
		콘서트 이름: ${concert.SVCNM}</br>
		클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
		클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
		클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
		클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
		클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>
		
		</c:if>
	</c:if>	
</c:forEach>
-->


<!-- 
<div id="clubbing">
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">	
	<c:if test="${clubBoardChatLists[statusClist.index].id != null}">
		<input type="hidden" name="svcid" value="${concert.SVCID}">
		BNO: ${clubBoardChatLists[statusClist.index].bno}<br /> 
		RNO: ${clubBoardChatLists[statusClist.index].rno}<br />
		콘서트 SVCID: ${concert.SVCID}</br>
		콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
		콘서트 이름: ${concert.SVCNM}</br>
		클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
		클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
		클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
		클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
		클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>
	</c:if>	
</c:forEach>
 -->

 
 <!-- 
 
 
 <div class="body" id="Totalclub">

<h1>TOTAL LIST</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">			
		<c:forEach var="chats" items="${clubBoardChatLists}" varStatus="statusChats">		
			<c:if test="${concert.SVCID eq fn:substringAfter(chats.category, '_')}">				
				콘서트 SVCID: ${concert.SVCID}</br>
				콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
				콘서트 이름: ${concert.SVCNM}</br>
				클럽 보드 넘버: ${chats.num}</br>
				클럽 보드 작성자 ID: ${chats.id}</br>
				클럽 보드 작성자 이름: ${chats.name}</br>
				클럽 보드 같이가 모임 이름: ${chats.title}</br>
				클럽 보드 카테고리: ${chats.category}</br>
				클럽 보드 내용: ${chats.content}</br>
				Test: ${boardReplyLists}</br>
				<input type="button" value="상세보기" onClick="location.href='<%=request.getContextPath()%>/clubBoardDetailForm.bd?uid=${chats.id}&chatnum=${chats.num}'"><br/><br/><br/>													
			</c:if>
		</c:forEach>
</c:forEach>
</div>

</br></br></br>-------------------</br></br></br>

<div id="Myclub">
<h1>My List(${uid})</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">			
	<c:forEach var="chats" items="${clubBoardChatLists}" varStatus="statusChats">
		<c:if test="${concert.SVCID eq fn:substringAfter(chats.category, '_')}">
			<c:if test="${uid eq fn:substringBefore(chats.category, '_')}">			
					<input type="hidden" name="svcid" value="${concert.SVCID}">					
					콘서트 SVCID: ${concert.SVCID}</br>
					콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
					콘서트 이름: ${concert.SVCNM}</br>
					클럽 보드 넘버: ${chats.num}</br>
					클럽 보드 작성자 ID: ${chats.id}</br>
					클럽 보드 작성자 이름: ${chats.name}</br>
					클럽 보드 같이가 모임 이름: ${chats.title}</br>
					클럽 보드 카테고리: ${chats.category}</br>
					클럽 보드 내용: ${chats.content}</br></br>
					<div id="reply">
				  <ol class="replyList">
				    <c:forEach var="boardReply" items="${boardReplyLists}">
				      <li>
				        <p>
				        작성자 : ${boardReply.writer}<br />
				        작성 날짜 :  <fmt:formatDate value="${boardReply.regdate}" pattern="yyyy-MM-dd" />
				        </p>				
				        <p>[댓글 내용]: ${boardReply.content}</p>
				      </li>
				    </c:forEach>   
				  </ol>
				</div>
				<form name="replyForm" action="replyWrite.bd" method="post">
		  <input type="hidden" id="bno" name="bno" value="${board.num}" />
		  <input type="hidden" id="pageNumber" name="pageNumber" value="${pageNumber}">		
		  <div>
		    <label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" />
		    <br/>
		    <label for="content">댓글 내용</label><input type="text" id="content" name="content" />
		  </div>
		  <div>
		 	 <button type="submit">작성</button>
		  </div>
	</form>
			</c:if>
		</c:if>						
	</c:forEach>
</c:forEach>
</div>

<br/>
<br/>
<br/>
<br/>

<div id="Totalclub2">
<h1>TOTAL LIST-Final인데 1.콘서트SVCID처럼 Log용이 너무 많아서 잠궈둠.</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">	
		
		1.콘서트 SVCID: ${concert.SVCID}</br>
		<c:forEach var="chats" items="${clubBoardChatLists}" varStatus="statusChats">
		2.카테고리 ID+SVCID: ${chats.category}	</br></br>
			<c:if test="${concert.SVCID eq fn:substringAfter(chats.category, '_')}">
				일치한다.<br/><br/><br/>
			</c:if>
		</c:forEach>
</c:forEach>
</div>


<div id="Totalclub">
<h1>TOTAL LIST</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">	
		아오_ 콘서트 SVCID: ${concert.SVCID}</br>
		오아_ 카테고리 ID: ${fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}<br/><br/>
	
		<c:if test="${concert.SVCID eq fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}">
				
					<input type="hidden" name="svcid" value="${concert.SVCID}">
					BNO: ${clubBoardChatLists[statusClist.index].bno}<br /> 
					RNO: ${clubBoardChatLists[statusClist.index].rno}<br />
					콘서트 SVCID: ${concert.SVCID}</br>
					콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
					콘서트 이름: ${concert.SVCNM}</br>
					클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
					클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
					클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
					클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
					클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>				
		</c:if>		
	
</c:forEach>
</div>
 -->

<!--
<div id="Totalclub">
<h1>TOTAL LIST</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">	
		
		
		<c:if test="${fn:contains(clubBoardChatLists[statusClist.index].category, '_S')}">
		아아: ${clubBoardChatLists[statusClist.index].category}<br/>
		아아 결과: ${fn:contains(clubBoardChatLists[statusClist.index].category, '_S')}<br/>
		
			<c:set var="ctry_num" value="${concert.SVCID eq fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}"/>
			오오: ${fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}<br/>
			<c:set var="ctry_svcid" value="${concert.SVCID}" />
			허허: ${concert.SVCID}<br/>				
				<c:if test="${concert.SVCID eq fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}">
			후후: ${ctry_num eq ctry_svcid}<br/><br/>		
					<input type="hidden" name="svcid" value="${concert.SVCID}">
					BNO: ${clubBoardChatLists[statusClist.index].bno}<br /> 
					RNO: ${clubBoardChatLists[statusClist.index].rno}<br />
					콘서트 SVCID: ${concert.SVCID}</br>
					콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
					콘서트 이름: ${concert.SVCNM}</br>
					클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
					클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
					클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
					클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
					클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>
				</c:if>		
		</c:if>		
</c:forEach>
</div>
-->


<!--
<div id="Totalclub">
<h1>TOTAL LIST</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">					
		<c:if test="${fn:contains(clubBoardChatLists[statusClist.index].category, '_S')}">
		아아: ${clubBoardChatLists[statusClist.index].category}<br/>
			<c:set var="ctry_num" value="${fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}"/>
			오오: ${fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}<br/>
			<c:set var="ctry_svcid" value="${concert.SVCID}" />
			허허: ${concert.SVCID}<br/>				
				<c:if test="${ctry_num eq ctry_svcid}">
			후후: ${ctry_num eq ctry_svcid}<br/><br/>		
					<input type="hidden" name="svcid" value="${concert.SVCID}">
					BNO: ${clubBoardChatLists[statusClist.index].bno}<br /> 
					RNO: ${clubBoardChatLists[statusClist.index].rno}<br />
					콘서트 SVCID: ${concert.SVCID}</br>
					콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
					콘서트 이름: ${concert.SVCNM}</br>
					클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
					클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
					클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
					클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
					클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>
				</c:if>		
		</c:if>		
</c:forEach>
</div>
-->

<!--
<div id="Totalclub">
<h1>TOTAL LIST</h1>
<c:forEach var="chatlist" items="${clubBoardChatLists}" varStatus="statusChat">			
		<c:if test="${fn:contains(chatlist.category, '_S')}">	
			<c:set var="category_svcid" value="${fn:substringAfter(chatlist.category, '_')}"/>					
					BNO: ${chatlist.bno}<br/> 
					RNO: ${chatlist.rno}<br/>
					
					콘서트 SVCID: ${concertList[statusChat.index].SVCID}</br>
					콘서트 Image: <img width="100" height="100" src="${concertList[statusChat.index].IMGURL}"></br>
					콘서트 이름: ${concertList[statusChat.index].SVCNM}</br>
					클럽 보드 작성자 ID: ${chatlist.id}</br>
					클럽 보드 작성자 이름: ${chatlist.name}</br>
					클럽 보드 같이가 모임 이름: ${chatlist.title}</br>
					클럽 보드 카테고리: ${chatlist.category}</br>
					클럽 보드 내용: ${chatlist.content}</br></br>
										
		</c:if>		
</c:forEach>
-->

<!-- 
</br></br></br>-------------------</br></br></br>

<div id="Myclub">
<h1>My List</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">			
			<c:if test="${uid eq fn:substringBefore(clubBoardChatLists[statusClist.index].category, '_')}">			
					<input type="hidden" name="svcid" value="${concert.SVCID}">
					BNO: ${clubBoardChatLists[statusClist.index].bno}<br/> 
					RNO: ${clubBoardChatLists[statusClist.index].rno}<br/>
					콘서트 SVCID: ${concert.SVCID}</br>
					콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
					콘서트 이름: ${concert.SVCNM}</br>
					클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
					클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
					클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
					클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
					클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>
			</c:if>						
</c:forEach>
</div>
 -->




<!-- 
<div id="clubbing">
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">	
	<c:if test="${fn:contains(clubBoardChatLists[statusClist.index].category, '_S')}">
		<c:set var="ctry_num" value="${fn:substringAfter(clubBoardChatLists[statusClist.index].category, '_')}"/>
		<c:set var="ctry_svcid" value="${concert.SVCID}" />
		<c:if test="${ctry_num eq ctry_svcid}">
	
	
		<input type="hidden" name="svcid" value="${concert.SVCID}">
		BNO: ${clubBoardChatLists[statusClist.index].bno}<br /> 
		RNO: ${clubBoardChatLists[statusClist.index].rno}<br />
		콘서트 SVCID: ${concert.SVCID}</br>
		콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
		콘서트 이름: ${concert.SVCNM}</br>
		클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
		클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
		클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
		클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
		클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>
		
		</c:if>
	</c:if>	
</c:forEach>
-->


<!-- 
<div id="clubbing">
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">	
	<c:if test="${clubBoardChatLists[statusClist.index].id != null}">
		<input type="hidden" name="svcid" value="${concert.SVCID}">
		BNO: ${clubBoardChatLists[statusClist.index].bno}<br /> 
		RNO: ${clubBoardChatLists[statusClist.index].rno}<br />
		콘서트 SVCID: ${concert.SVCID}</br>
		콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
		콘서트 이름: ${concert.SVCNM}</br>
		클럽 보드 작성자 ID: ${clubBoardChatLists[statusClist.index].id}</br>
		클럽 보드 작성자 이름: ${clubBoardChatLists[statusClist.index].name}</br>
		클럽 보드 같이가 모임 이름: ${clubBoardChatLists[statusClist.index].title}</br>
		클럽 보드 카테고리: ${clubBoardChatLists[statusClist.index].category}</br>
		클럽 보드 내용: ${clubBoardChatLists[statusClist.index].content}</br></br>
	</c:if>	
</c:forEach>
 -->
 
 
  -->