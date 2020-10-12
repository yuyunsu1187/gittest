<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">사용자정보조회/승인</h2>
	</header>
	
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
		<!-- [S] 게시물 상단 폼 영역 -->
		<div class="form-wrap" data-board-type="inquiry">
			<div class="form" data-mult-form="btn">
				<button type="button" class="sub-btn">승인</button>
				<button type="button" class="sub-btn">삭제</button>
			</div>
		</div>
		<!-- [E] 게시물 상단 폼 영역 -->
		
		<!-- 리스트 노출 개수는 최대 10줄 -->
		<div class="board-area">
			<table class="default-table">
				<caption>사용자정보조회/승인 리스트</caption>
				<colgroup>
					<col style="width:5%;" />
					<col style="width:10%;" />
					<col style="width:auto;" />
					<col style="width:auto;" />
					<col style="width:10%;" />
					<col style="width:10%;" />
					<col style="width:10%;" />
				</colgroup>
				
				<thead>
					<tr>
						<th scope="row">
							<div class="form" data-form-type="checkbox">
								<input type="checkbox" class="check-form" id="allcheck" />
								<label for="allcheck" class="label-form"><i class="fa-check-square"></i></label>
							</div>
						</th>
						<th scope="row">가입 포지션</th>
						<th scope="row">이름</th>
						<th scope="row">ID(이메일)</th>
						<th scope="row">의사ID 인증</th>
						<th scope="row">얼굴 인증</th>
						<th scope="row">가입일자</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>
							<div class="form" data-form-type="checkbox">
								<input type="checkbox" class="check-form" id="checkbox01" />
								<label for="checkbox01" class="label-form"><i class="fa-check-square"></i></label>
							</div>
						</td>
						<td>일반 의사</td>
						<td data-text-style="ellipsis">Dr. KimlgmaterDr. KimlgmaterDr. KimlgmaterDr. KimlgmaterDr. KimlgmaterDr. KimlgmaterDr. KimlgmaterDr. KimlgmaterDr. KimlgmaterDr. Kimlgmater</td>
						<td data-text-style="ellipsis">Material01@lgcns.com</td>
						<td><button type="button" class="board-main-btn" data-btn-style="modal" data-btn-key="doctor"><i class="fas fa-address-card"></i>의사ID</button></td>
						<td><button type="button" class="board-main-btn" data-btn-style="modal" data-btn-key="face"><i class="far fa-grin-beam"></i>얼굴 인증</button></td>
						<td>2020-07-27</td>
					</tr>
					
					<tr>
						<td>
							<div class="form" data-form-type="checkbox">
								<input type="checkbox" class="check-form" id="checkbox01" />
								<label for="checkbox01" class="label-form"><i class="fa-check-square"></i></label>
							</div>
						</td>
						<td>일반 의사</td>
						<td data-text-style="ellipsis">Dr. Kimlgmater</td>
						<td data-text-style="ellipsis">Material01@lgcns.com</td>
						<td><button type="button" class="board-main-btn" data-btn-style="modal" data-btn-key="doctor"><i class="fas fa-address-card"></i>의사ID</button></td>
						<td><button type="button" class="board-main-btn" data-btn-style="modal" data-btn-key="face"><i class="far fa-grin-beam"></i>얼굴 인증</button></td>
						<td>2020-07-27</td>
					</tr>
					
					<!-- 검색결과가 값이 없을 때 -->
					<tr>
						<td colspan="7" data-td-type="board-noData">등록된 사용자가 없습니다</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- [S] paging -->
		<div class="paging-area">
			<button type="button" class="paging-btn"><i class="fas fa-angle-double-left"></i></button>
			<button type="button" class="paging-btn"><i class="fas fa-angle-left"></i></button>
			<strong>1</strong>
			<button type="button" class="paging-btn">2</button>
			<button type="button" class="paging-btn">3</button>
			<button type="button" class="paging-btn">4</button>
			<button type="button" class="paging-btn">5</button>
			<button type="button" class="paging-btn">6</button>
			<button type="button" class="paging-btn">7</button>
			<button type="button" class="paging-btn">8</button>
			<button type="button" class="paging-btn">9</button>
			<button type="button" class="paging-btn">10</button>
			<button type="button" class="paging-btn"><i class="fas fa-angle-right"></i></button>
			<button type="button" class="paging-btn"><i class="fas fa-angle-double-right"></i></button>
		</div>
		<!-- [S] paging -->
	</article>
	<!-- [E] 게시물 리스트 -->
</section>

<!-- [S] 레이어 팝업 : 의사 ID 인증 이미지 보기 -->
<div class="layerPop-wrap" data-pop-action="disabled">
	<article class="layerPop-area" data-pop-key="doctor">
		<header class="layerPop-header">
			<h3 class="layerPop-tit">의사 ID 인증 이미지</h3>
			<button type="button" class="layerPop-close-btn" data-pop-btn="close">&#10006;</button>
		</header>
		<article class="layerPop-contents">
			<span class="img-area"><img src="/resource/images/temp/@img_temp-pop.jpg" /></span>
		</article>
		<footer class="layerPop-footer">
			<button type="button" class="sub-btn" data-pop-btn="close">닫기</button>
		</footer>
	</article>
</div>
<!-- [S] 레이어 팝업 : 의사 ID 인증 이미지 보기 -->

<!-- [S] 레이어 팝업 : 얼굴 인증 이미지 보기 -->
<div class="layerPop-wrap" data-pop-action="disabled">
	<article class="layerPop-area" data-pop-key="face">
		<header class="layerPop-header">
			<h3 class="layerPop-tit">얼굴 인증 이미지</h3>
			<button type="button" class="layerPop-close-btn" data-pop-btn="close">&#10006;</button>
		</header>
		<article class="layerPop-contents">
			<span class="img-area"><img src="/resource/images/temp/@img_temp-pop.jpg" /></span>
		</article>
		<footer class="layerPop-footer">
			<button type="button" class="sub-btn" data-pop-btn="close">닫기</button>
		</footer>
	</article>
</div>
<!-- [S] 레이어 팝업 : 얼굴 인증 이미지 보기 -->
