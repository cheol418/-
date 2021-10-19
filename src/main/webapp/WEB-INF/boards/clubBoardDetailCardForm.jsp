<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/card.css">

<script type="text/javascript">
	$(".replyClubWriteBtn").on("click", function(){	  
		var formObj = $("form[name='replyClubForm']");
		 formObj.attr("action", "/replyClubWrite.bd"); 
		 formObj.submit();
	});
</script>

<div id="MyClubDetailCard">
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">			
	<c:forEach var="chats" items="${clubBoardChatLists}" varStatus="statusChats">
		<c:if test="${concert.SVCID eq fn:substringAfter(chats.category, '_')}">
			<c:if test="${uid eq fn:substringBefore(chats.category, '_')}">
				<c:if test="${chatnum eq chats.num}">
					<input type="hidden" name="svcid" value="${concert.SVCID}">					
				
			<div class="body">
				<div class="CardContainer">
					<h2 align="center">같이가 모집 Card</h2>
					<div class="ClubCardBody">
						<table class="table table-bordered table-hover wform">
							 
							</tr>
								<td>								
									<h5>${concert.SVCNM}</h5>
								</td>
							</tr>
							<tr>	 
								<td>		 					
									<img width="150" height="150" src="${concert.IMGURL}">
								</td>
							</tr> 
							<tr>
								<td>
									<h5>모임 주최자: ${chats.name}(ID[${chats.id}])</h5>
								</td>
							</tr>
							<tr>
								<td>								
									<h5>주최자의 한마디: ${chats.title}</h5>
								</td>
							</tr>									
						</table>
					</div>
				</div>
			</div>
			
			<div id="reply" class="CardChatContainer">			  
			    <c:forEach var="boardReply" items="${boardReplyLists}">
			      	<div class="ownerChat"> 
			      	<c:if test="${uid eq chats.id}">				        
				        	<div class="ownerPosition">
								<table>
					        		<tr>					        			
					        			<td class="ownBubble" width="300px">[${boardReply.content}}: </td>					        		
					        			<td align="right">작성자 : ${boardReply.writer}</td>
					        		</tr>
				        		</table>
				        		<div>
				        		작성 날짜 :  <fmt:formatDate value="${boardReply.regdate}" pattern="yyyy-MM-dd" />
				        		</div>
				        	</div>				        
					</c:if>					
					</div>		
								  
				</c:forEach>  
					<form name="replyClubForm" action="replyClubWrite.bd" method="post">
						<input type="hidden" id="bno" name="bno" value="${chats.num}" />
			  		<div>			  			
			    		<label for="writer">채팅 작성자</label><input type="text" id="writer" name="writer" /><br/>
			    		<label for="content">채팅 내용</label><input type="text" id="content" name="content" />
			  		</div>
			  		<div>
			 	 		<button type="submit">작성</button>
			  		</div>
					</form> 				  
			</div>
			
			
		
					
				</c:if>
			</c:if>
		</c:if>						
	</c:forEach>
</c:forEach>
</div>

<!-- 

<script type="text/javascript">
	$(".replyClubWriteBtn").on("click", function(){	  
		var formObj = $("form[name='replyClubForm']");
		 formObj.attr("action", "/replyClubWrite.bd");
		 formObj.submit();
	});
</script>

<div id="MyClubDetailCard">
<h1>My Detail ClubBoard - 카드임. 상세 내용 + 리플 확인 + 리플 채팅 다는 곳</h1>
<c:forEach var="concert" items="${concertList}" varStatus="statusClist">			
	<c:forEach var="chats" items="${clubBoardChatLists}" varStatus="statusChats">
		<c:if test="${concert.SVCID eq fn:substringAfter(chats.category, '_')}">
			<c:if test="${uid eq fn:substringBefore(chats.category, '_')}">
				<c:if test="${chatnum eq chats.num}">
					<input type="hidden" name="svcid" value="${concert.SVCID}">					
				
			<div class="body">
				<div class="CardContainer">
					<div class="ClubCardBody">
						<table class="table table-bordered table-hover wform">
							<tr>
								<td>
									콘서트 SVCID: ${concert.SVCID}</br>
								</td>
							</tr>
							</tr>
								<td>
								콘서트 이름: ${concert.SVCNM}</br>
								</td>
							</tr>
							<tr>
								<td>
								콘서트 Image: <img width="100" height="100" src="${concert.IMGURL}"></br>
								</td>
							</tr>
							
								<td>
								클럽 보드 넘버: ${chats.num}</br>
								</td>
								클럽 보드 작성자 ID: ${chats.id}</br>
								클럽 보드 작성자 이름: ${chats.name}</br>
								클럽 보드 같이가 모임 이름: ${chats.title}</br>
								클럽 보드 카테고리: ${chats.category}</br>
								클럽 보드 내용: ${chats.content}</br></br>
							</tr>
						</table>
					</div>
				</div>
			</div>
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
					<form name="replyClubForm" action="replyClubWrite.bd" method="post">
						<input type="hidden" id="bno" name="bno" value="${chats.num}" />												  		
			  		<div>		  			
			    		<label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" /><br/>
			    		<label for="content">댓글 내용</label><input type="text" id="content" name="content" />
			  		</div>
			  		<div>
			 	 		<button type="submit">작성</button>
			  		</div>
					</form>
				</c:if>
			</c:if>
		</c:if>						
	</c:forEach>
</c:forEach>
</div>
 -->