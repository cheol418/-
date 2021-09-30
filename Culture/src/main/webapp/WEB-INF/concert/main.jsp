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
	
	function goDetail(svc){
		svc.submit();
	}
</script>
<style>
	.slideImg{
		margin: 15px;
		width: 200px;
		height: 170px;
	}
	.slide{
		overflow: hidden;
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
</style>
<!-- header -->
<div class="slide">	
	슬라이드
	<table border="1">
		<tr>
			<td>
				<a onclick="slideLift()">
					<img src="resources/images/arrowLeft.png">
				</a>
			</td>
			<c:forEach items="${concertList}" var="concert" varStatus="status">
					<td width="230" align="center" id="slide_td${status.count}">
						<form name="${concert.SVCID}" method="post" action="concertDetail.do">
							<a onclick="goDetail(${concert.SVCID})">
								<img src="${concert.IMGURL}" class="slideImg">
							</a><br>
							${concert.PLACENM}
							<input type="hidden" name="svcid" value="${concert.SVCID}">
						</form>
					</td>
			</c:forEach>
			<td>
				<a onclick="slideRight()">
					<img src="resources/images/arrowRight.png">
				</a>
			</td>
		</tr>
		<tr>
			<td id="slideDot">
			</td>
		</tr>
	</table> 
</div>
<div>
	공지사항
	<table>
		<tr>
			<td>
				
			</td>
		</tr>
	</table>
</div>
<div>
	게시글
	<table>
		<tr>
			<td>
				
			</td>
		</tr>
	</table>
</div>
<!-- footer -->