<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>


<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">사용자 관리</h2>
	</header>
	
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
		<!-- [S] 게시물 상단 폼 영역 -->
		<div class="form-wrap" data-board-type="inquiry">
			<div class="form-area" data-combine-form="column-2-form">
				<div class="form" data-form="select">
					<select class="select-form">
						<option value="">All</option>
						<option value="" selected>인증강사</option>
						<option value="">일반의사</option>
						<option value="">협력업체</option>
					</select>
					<i class="fas fa-angle-down"></i>
				</div>
				<div class="form" data-mult-form="btn">
					<button type="button" class="sub-btn">보기</button>
					<button type="button" class="sub-btn">변경</button>
					<button type="button" class="sub-btn">삭제</button>
				</div>
			</div>
			
			<div class="form-area" data-combine-form="column-2-form">
				<div class="form" data-form="select">
					<select class="select-form">
						<option value="" selected>All</option>
						<option value="">아이디</option>
						<option value="">이름</option>
					</select>
					<i class="fas fa-angle-down"></i>
				</div>
				<div class="form" data-mult-form="search">
					<input type="text" class="input-form" placeholder="Please enter a search word." />
					<button type="button" class="icon-btn"><i class="fab fa-sistrix"></i></button>
				</div>
			</div>
		</div>
		<!-- [E] 게시물 상단 폼 영역 -->
		
		<!-- 리스트 노출 개수는 최대 10줄 -->
		<div class="board-area">
			<table class="default-table">
				<caption>사용자 관리 리스트</caption>
				<colgroup>
					<col style="width:5%;" />
					<col style="width:15%;" />
					<col style="width:auto;" />
					<col style="width:auto;" />
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
						<th scope="row">회원등급</th>
						<th scope="row">이름</th>
						<th scope="row">ID(이메일)</th>
						<th scope="row">국가</th>
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
						<td>인증 강사</td>
						<td data-text-style="ellipsis"><a href="#none" class="link-btn">Dr. Kimlgmater</a></td>
						<td data-text-style="ellipsis"><a href="#none" class="link-btn">Material01@lgcns.com</a></td>
						<td>U.S.A.</td>
						<td>2020-07-27</td>
					</tr>
					
					<tr>
						<td>
							<div class="form" data-form-type="checkbox">
								<input type="checkbox" class="check-form" id="checkbox01" />
								<label for="checkbox01" class="label-form"><i class="fa-check-square"></i></label>
							</div>
						</td>
						<td>인증 강사</td>
						<td data-text-style="ellipsis"><a href="#none" class="link-btn">Dr. Kimlgmater</a></td>
						<td data-text-style="ellipsis"><a href="#none" class="link-btn">Lgyvoire_master@lgcns.com</a></td>
						<td>U.S.A.</td>
						<td>2020-07-27</td>
					</tr>
					
					<!-- 검색결과가 값이 없을 때 -->
					<tr>
						<td colspan="6" data-td-type="board-noData">등록된 사용자가 없습니다</td>
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