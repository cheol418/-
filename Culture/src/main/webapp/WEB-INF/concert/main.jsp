<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script type="text/javascript">
	var slideCnt = 15;		// 가져오는 데이터 개수
	var slideSize = 3;		// 페이지 개수
	var activePage = 1;		// 첫 페이지
	
	$(function(){
		// $(document).ready() 와 같음
		$("#slideDot").attr("colspan",slideCnt);	//슬라이드 하단 점 생성,공간 생성
		showSlide();
		setInterval(function(){slideRight()},5000);
		bOffBoard();
		nOffBoard();
	});
	
	function showSlide(){
		var maxSlideCnt = slideCnt/slideSize;	// 페이지에서 나오는 데이터 개수
		var startSlide= maxSlideCnt*(activePage-1);	// 시작데이터 번호
		var lastSlide= maxSlideCnt*(activePage);	// 끝데이터 번호
		
		for(i=0;i<slideCnt;i++){
			var tdName = "#slide_td"+(i+1); 
			if(i>=startSlide && i<lastSlide){
				$(tdName).css("display","table-cell");
			}else{
				$(tdName).css("display","none")
			}
		}
		createDot();
	}
	
	function slideLift(){
		if(activePage==1){
			activePage=3;
		}else{
			activePage--; 
		}
		showSlide();
	}
	
	function slideRight(){
		if(activePage==3){
			activePage=1;
		}else{
			activePage++; 
		}
		showSlide();
	}
	
	function sildeMove(num){
		activePage = num;
		showSlide();
	}
	
	function createDot(){
		$("#slideDot").empty()
		for(i=0;i<slideSize;i++){
			var imgStr = "<img class='slideDot' src='resources/images/";
			if(i==activePage-1){
				imgStr += "blackCircle.png' onclick='sildeMove("+(i+1)+")'/>";
			}else{
				imgStr += "grayCircle.png' onclick='sildeMove("+(i+1)+")'/>";
			}
			$("#slideDot").append(imgStr);
		}
	}
	
	function nAddBoard(){
		$("#noticeOff").attr("class","mActive");
		$("#noticeAdd").attr("class","mDeActive");
		
		for(i=0;i<10;i++){
			$("#noticeRow"+(i+1)).css("display","table-row");
		}
	}
	
	function nOffBoard(){
		$("#noticeOff").attr("class","mDeActive");
		$("#noticeAdd").attr("class","mActive");
		
		for(i=5;i<10;i++){
			$("#noticeRow"+(i+1)).css("display","none");
		}
	}
	
	function bAddBoard(){
		$("#boardOff").attr("class","mActive");
		$("#boardAdd").attr("class","mDeActive");
		
		for(i=0;i<10;i++){
			$("#boardRow"+(i+1)).css("display","table-row");
		}
	}
	
	function bOffBoard(){
		$("#boardOff").attr("class","mDeActive");
		$("#boardAdd").attr("class","mActive");
		
		for(i=5;i<10;i++){
			$("#boardRow"+(i+1)).css("display","none");
		}
	}
	
	function goDetail(svc){
		svc.submit();
	}
</script>
<style>
	.slideImg{
		margin: 10px;
		width: 135px;
		height: 125px; 
	}
	.slide{
		overflow: hidden;
	}
	.slideTable{
		width: 980px;
		height: 280px;
	}
	#slideDot{
		text-align: center;
	}
	.slideDot{
		margin: 3px;
		width: 15px;
		height: 15px;
	}
	.slideDot, .slideImg{
		cursor: pointer;
	}
	.mDeActive{
		display: none;
	}
	.mActive{
		display: table-row;
	}
	.mainboard{
		width: 430px;
		margin: 10px;
		float: left;
		font-size: 13px;
	}
	.concertName{
		height: 40px;
	}
	.slideDotTr{
		height: 38px;
	}
	.boardNum{
		width: 40px;
	}
	.boardTitle{
		width: 130px;
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	.boardContent{
	    width: 165px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	.boardDate{
	    width: 65px;
		font-size: 12px;
	}
	.arrowImg{
		vertical-align: middle !important;
	}
	th{
		background-color: #dddddd94;
	}
</style>
<!-- header -->
<div class="slide">	
	슬라이드
	<table class="table table-bordered slideTable">
		<tr>
			<td class="arrowImg">
				<a onclick="slideLift()">
					<img src="resources/images/arrowLeft.png">
				</a>
			</td>
			<c:forEach items="${concertList}" var="concert" varStatus="status">
					<td width="230" align="center" id="slide_td${status.count}">
						<form name="${concert.SVCID}" method="post" action="concertDetail.do">
							<a onclick="goDetail(${concert.SVCID})">
								<img src="${concert.IMGURL}" class="slideImg">
							</a>
							<div class="concertName">
								${concert.PLACENM}
							</div>
							<input type="hidden" name="svcid" value="${concert.SVCID}">
						</form>
					</td>
			</c:forEach>
			<td class="arrowImg">
				<a onclick="slideRight()">
					<img src="resources/images/arrowRight.png">
				</a>
			</td>
		</tr>
		<tr class="slideDotTr">
			<td id="slideDot">
			</td>
		</tr>
	</table> 
</div>
<div>
	<table class="table table-bordered table-hover mainboard">
		<caption>공지사항</caption>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${noticeList}" var="notice" varStatus="status">
			<tr id="noticeRow${status.count}">
				<td>
					<div class="boardNum">
						${notice.num}
					</div>
				</td>
				<td>
					<div class="boardTitle">
						${notice.title} 
					</div>
				</td>
				<td>
					<div class="boardContent">
						${notice.content}
					</div>
				</td>
				<td>
					<fmt:parseDate value="${notice.regdate}" var="pRedDate" pattern="yy-MM-dd hh:mm"/>
					<fmt:formatDate value="${pRedDate}" var="fRedDate" pattern="MM-dd hh:mm"/>
					<div class="boardDate">
						${fRedDate}
					</div>
				</td>
			</tr>
		</c:forEach>
		<tr id="noticeOff" class="mDeActive" onclick="nOffBoard()" >
			<td colspan="4">
				<div align="center">접기</div>
			</td>
		</tr>
		<tr id="noticeAdd" class="mActive" onclick="nAddBoard()">
			<td colspan="4">
				<div align="center">펼치기</div>
			</td>
		</tr>
	</table>
	<table class="table table-bordered mainboard" border="1">
		<caption>게시글</caption>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${boardList}" var="board" varStatus="status">
			<tr id="boardRow${status.count}">
				<td>
					<div class="boardNum">
						${board.num}
					</div>
				</td>
				<td>
					<div class="boardTitle">
						${board.title}
					</div>
				</td>
				<td>
					<div class="boardContent">
						${board.content}
					</div>
				</td>
				<td>
					<fmt:parseDate value="${board.regdate}" var="pRedDate" pattern="yy-MM-dd hh:mm"/>
					<fmt:formatDate value="${pRedDate}" var="fRedDate" pattern="MM-dd hh:mm"/>
					<div class="boardDate">
						${fRedDate}
					</div>
				</td>
			</tr>
		</c:forEach>
		<tr id="boardOff" class="mDeActive" onclick="bOffBoard()" >
			<td colspan="4">
				<div align="center">접기</div>
			</td>
		</tr>
		<tr id="boardAdd" class="mActive" onclick="bAddBoard()">
			<td colspan="4">
				<div align="center">펼치기</div>
			</td>
		</tr>
	</table>
</div>
<!-- footer -->