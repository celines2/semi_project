<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<div class="submenu" style="background-color: cornflowerblue;">
	<!-- 관리자용 서브헤더 색깔 다르게 설정 -->
	<ul>
		<li><a class="subhome"
			href="<%=request.getContextPath()%>/main.jsp">HOME</a></li>
		<li><a class="subhome" href="#">고객예약현황</a></li>
		<li><a class="subhome" href="ptn_review.html">리뷰관리</a></li>
		<li><a class="subhome" href="ptn_qna.html">문의관리</a></li>
	</ul>
</div>
<!-- 서브메뉴 끝 -->

<!-- 본문 시작-->
<div class="cst-status">
	<h1>고객 예약 현황</h1>
</div>


<div class="container">
	<form id="bbsVO" name="bbsVO" action="partBbs.do" method="post">

		<input type="hidden" id="pageMode" name="pageMode" value="List">
		<input type="hidden" id="pageIndex" name="pageIndex" value="1">
		<input type="hidden" id="nttId" name="nttId" value=""> <input
			type="hidden" id="nttNo" name="nttNo" value="0"> <input
			type="hidden" id="nowNum" name="nowNum">

		<div class="board-header">
			<p class="cnt">
				총 게시물 : <strong>21</strong>
			</p>
			<div class="board-search-form">
				<label for="searchCondition" class="hidden">검색 구분</label> <select
					id="searchCondition" name="searchCondition" class="select">
					<option value="sj">제목</option>
					<option value="cn">내용</option>
					<option value="all">제목+내용</option>
				</select> <label for="searchWord" class="hidden">검색어 입력란</label> <input
					type="text" class="inp" name="searchWord" id="searchWord"
					title="검색어 입력" value="">
				<button type="button" onclick="javascript:fn_se();return false;">검색버튼</button>
			</div>
		</div>

		<div class="tbl-box">
			<table class="tbl-list">
				<caption>고객 예약 현황 테이블</caption>
				<thead>
					<tr>
						<th scope="col">NO</th>
						<th scope="col">예약업체</th>
						<th scope="col">예약자명</th>
						<th scope="col">예약날짜</th>
						<th scope="col">예약시간</th>
						<th scope="col">연락처</th>
						<th scope="col">예약인원</th>
						<th scope="col">요구사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>21</td>
						<td class="al"><span>아웃백 스테이크 하우스 </span></a></td>
						<td><span>이현정정</span></td>
						<td>2020-09-14</td>
						<td>3:00pm</td>
						<td>010-1234-1234</td>
						<td>3</td>
						<td><a class="Select">없어요</a>
							<div class="popupLayer">
								<div>

									<span onClick="closeLayer(this)"
										style="cursor: pointer; font-size: 1.5em; padding-right: 10px;"
										title="닫기">X</span>
								</div>
								클릭하였을때 나오는곳
							</div></td>

					</tr>
					<tr>
						<td>20</td>
						<td class="al"><span>아웃백 스테이크 하우스 </span></a></td>
						<td><span>이현정정</span></td>
						<td>2020-09-14</td>
						<td>3:00pm</td>
						<td>010-1234-1234</td>
						<td>3</td>
						<td><a class="Select">없어요</a>
							<div id="divView">dfdf</div>
							<div class="popupLayer">
								<div>

									<span onClick="closeLayer(this)"
										style="cursor: pointer; font-size: 1.5em; padding-right: 10px;"
										title="닫기">X</span>
								</div>
								클릭하였을때 나오는곳
							</div></td>

					</tr>

				</tbody>
			</table>
		</div>


		<div class="board-bottom board-view-btn">
			<div class="paging">
				<a href="javascript:void(0)" class="on" title="선택됨">1</a>&nbsp;<a
					href="?pageIndex=2" onclick="fn_list(2);return false; "
					title="페이지로 이동">2</a>&nbsp;<a href="?pageIndex=3"
					onclick="fn_list(3);return false; " title="페이지로 이동">3</a>&nbsp;

			</div>

		</div>

	</form>
	<!-- 본문 끝 -->


	<!-- /.container -->
</div>
<style>
.cst-status {
	margin: 50px;
}

.cst-status h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
}

.imgSelect {
	cursor: pointer;
}

.popupLayer {
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 350px;
	height: 150px;
	padding: 10px;
}

.popupLayer div {
	position: absolute;
	top: 5px;
	right: 5px
}

td a.Select {
	justify-content: center;
}

a.Select:hover {
	cursor: pointer;
}

#divView {
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 350px;
	height: 150px;
	padding: 10px;
}
</style>

<script>
	$(function() {

		function closeLayer(obj) {
			$(obj).parent().parent().hide();
		}

		$('.Select').click(function(e) {
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;

			var oWidth = $('.popupLayer').width();
			var oHeight = $('.popupLayer').height();

			// 레이어가 나타날 위치를 셋팅한다.
			var divLeft = e.clientX + 10;
			var divTop = e.clientY + 5;

			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			if (divLeft + oWidth > sWidth)
				divLeft -= oWidth;
			if (divTop + oHeight > sHeight)
				divTop -= oHeight;

			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
			if (divLeft < 0)
				divLeft = 0;
			if (divTop < 0)
				divTop = 0;

			$('.popupLayer').css({
				"top" : divTop,
				"left" : divLeft,
				"position" : "absolute"
			}).show();

		});

	});
</script>
<%@ include file="/views/common/footer.jsp"%>