<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
      div {
        width: 600px;        
      }
      img {
  		max-width: 100%;
      }
</style>

<!-- 
	*. user table의 id(P-Key)와 board table의 category값과 api의 SVCID값으로 ClubBoard(같이가 Board)를 제어한다.
		- 생성되는 ClubBoard(같이가 Board) 게시물 -> board table의 category값은 'id+SCVID'면 될 것 같다... 아닌가? 아냐, 괜찮아. 삭제까지 깔끔할 듯...?
		
			
	*. category의 값에 id(P-Key)가 포함되면 내가 admin인 ClubBoard(같이가 Board).
		- admin에서 ClubBoard(같이가 Board) listing 할 때도 무리 없을 거...같다?
		- id 긁어오는 건, SCVID가 시작되기 전에 기호하나 붙여두고, 그 앞에 글자가 id라고 sql로 지정하면 문제 없을 거고.
		- 오케이 오케이
				
	*. category의 값에 id(P-Key)에 포함되지 않았는데, 내 id(P-key)로 덧글을 달았다면 다른 User의 ClubBoard(같이가 Board)에 멤버로 참여중이라고 판단.
		- 그럼 Admin(주인)은 해결되는데, 가입자는? 어떻게 선별하지? 회원 가입까지 갈 필요는 없잖아, 사실.
		- 여기서 쓰지 않는 Board 컬럼이 뭐냐. content 있는데... content에 참여한 멤버들 ID를 넣어놨다가 읽어서 리스팅할까. 너무 주먹구구식 아닌가?
		- 아니지, 내가 덧글단 게시물만 따로 검색해서 보여주는 page도 많은데, 그게 뭐 대수인가. 그래, 덧글로 파악할까? 내가 admin은 아닌데, 덧글을 단 ClubBoard(같이가 Board) 게시물을 소팅해주면 되지 않나.
		- 그래 그렇게 가자. ClubBoard(같이가 Board) 게시물에 가입할 때, 안보이는 덧글이나 그런 걸 달게 하면 되지 뭐...아니면, '가입하셨습니다.' 덧굴이 자동으로 달리게 하면 되겠다. 오케이 오케이.		
	
	
	*. 화면 구성
		A1. 제일 위에 간단히 추린 공연 정보.
			- 어떤 공연에 대한 ClubBoard(같이가 Board)인지 필요한 정보.. SVCID(서비스 아이디), SVCNM(서비스 네임), IMGURL(사진)을 일단 가져오자. 쬐끄맣게 보여주고.
			- 대분류(MAXCLASSNM)가 아니면 이게 뭔 행사인지 알 수가 없는데? 제목이랑 뭐 이리 다 잘라놨어... PLACENM(장소명)도 일단 표기 필요...
			- 아니다, 다들 공연 보고, 관련 ClubBoard(같이가 Board)를 Listing해서 들어올텐데, 걍 IMGURL + MAXCLASSNM + PLACENM 이면 끝이겠다.
			
		A2. ClubBoard(같이가 Board)에서 어떤 규칙으로 게시판을 리스팅해서 보여줄 것인가. - 지금의 동호회 page에 표시될 정보.
			- 전체 리스트: Table Category에 clubboard 또는 cboard 문자열이 들어가는 보드들을 그냥 다 리스팅 (검색 키워드는 나중에 정하면 되고)
			- admin 리스트: Table Category에 Login한 user의 id와 같은 문자열이 들어가는 보드들을 리스팅
			- member 리스트: 해당 ID가 덧글을 단 ClubBoard(같이가 Board)를 찾아서 리스팅
			
				맨왼쪽에 |유저 정보| 리스트 표시 영역|
				
				대충 이런 모양으로.
				소팅과 검색은 아래냐 위냐 오른쪽에 붙이냐.. 
				버튼 형식 소팅은 리스트 위에 
				검색 형식 소팅은 리스트 아래에.
				겸허하고 뻔하게 가자.
				
				인피닛 스크롤로 할까, 페이징으로 할까. 고민해보자. 이건 게시글(Club Board)와 게시글 전체 리스팅 둘 다에 관해서. 
			 
		B1. Admin이 설정하는 같이가 조건들이 표시 된다.
			- 같이 갈 사람 수(참여자 수 설정)
			- 참여자 Kick 기능 + 가능하다면 Ban 기능 - kick이든 Ban이든 쫓겨난 ID는 관련 덧글 모두 삭제.
			- 같이갈 일시 + 시간 + 가능하다면 장소 지정
			- 같이갈 일시까지는 필수 설정.
			 
		B2. Member 기능
			- 참가 - 참가시 - '같이가 참가하였습니다.' 라는 덧글을 무조건 최초에 자동 작성하게 된다. 
			- 덧글 소통 
			- 그리고 탈퇴 - 탈퇴시 ID가 쓴 덧글 모두 삭제.
			
		
		C. 그 아래는 사실은 덧글이 이어질 뿐이지만, 카카오 대화창 처럼 보이도록 속인다.
			- Admin은 오른쪽
			- 참가자는 왼쪽
			- 말풍선 처럼.
			- 읽음 체크는 안함. 시간 없음.
			
		D. Admin이 설정한 같이 보기로 한 날짜와 시간이 지나면, 보드는 자동으로 삭제 된다.
			- 공연 정보의 종료 날짜로 판단하면 끝.
		
		E. 필요 기능 정리
			- 간추린 공연 정보 표기
			- Admin 기능 - 참여자 수 설정 - kick/ban - 덧굴 - 게시물 폭파?
			- Member 기능 - 참가 / 덧글/ 탈최
			- 공연 정보의 종료 날짜에 따라 게시글 자동 삭제. <- 어느 단계에서? 어떤 권한으로?
	 
	 	F. 으아아악
	 		- boardreply table에 image 넣는 거 깜빡해는데... 필요 없나? 필요 없을까? 있으면 좋은가? 있으면 엄청 좋은가?!
-->