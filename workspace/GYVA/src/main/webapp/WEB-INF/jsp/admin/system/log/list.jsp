<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * LG Chem YVOIRE Academy JSP
 * NAME : list.jsp
 * DESC : 로그 목록조회
 * VER  : v1.0
 * Copyright 2020 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script type="text/javascript" language="javascript">
	//<![CDATA[
	
	//]]>
</script>

<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">사용자 로그분석</h2>
	</header>
	
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
		<!-- [S] 게시물 상단 폼 영역 -->
		<div class="form-wrap" data-board-type="inquiry">
			<div class="form-area" data-combine-form="column-3-form">
				<div class="form" data-form="select">
					<select class="select-form">
						<option value="" selected>All</option>
						<option value="">Branding</option>
						<option value="">Material</option>
						<option value="">Library</option>
					</select>
					<i class="fas fa-angle-down"></i>
				</div>
				<div class="form" data-form="select">
					<select class="select-form">
						<option value="" selected>하위메뉴1</option>
						<option value="">하위메뉴2</option>
					</select>
					<i class="fas fa-angle-down"></i>
				</div>
				<div class="form" data-mult-form="btn">
					<button type="button" class="sub-btn">보기</button>
				</div>
			</div>
		</div>
		<!-- [E] 게시물 상단 폼 영역 -->
		
		<!-- 리스트 노출 개수는 최대 20줄 -->
		<div class="board-area">
			<table class="default-table">
				<caption>관리자 관리 리스트</caption>
				<colgroup>
					<col style="width:5%;" />
					<col style="width:15%;" />
					<col style="width:10%;" />
					<col style="width:10%;" />
					<col style="width:auto;" />
					<col style="width:10%;" />
				</colgroup>
				
				<thead>
					<tr>
						<th scope="row">No</th>
						<th scope="row">ID</th>
						<th scope="row">컨텐츠 메뉴</th>
						<th scope="row">하위메뉴</th>
						<th scope="row">제목</th>
						<th scope="row">확인일자</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>67</td>
						<td>Lgyvoire_master@lgcns.com</td>
						<td>Library</td>
						<td>Scientific Data</td>
						<td data-text-style="ellipsis"><a href="#none" class="link-btn">Scientific soda_20200810</a></td>
						<td>2020-07-27 18:16:23</td>
					</tr>
					
					<tr>
						<td>67</td>
						<td>Lgyvoire_master@lgcns.com</td>
						<td>Library</td>
						<td>Scientific Data</td>
						<td data-text-style="ellipsis"><a href="#none" class="link-btn">Scientific soda_20200810</a></td>
						<td>2020-07-27 18:16:23</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="button-area">
			<button type="button" class="sub-btn" data-btn-style="add-list">더보기<i class="fas fa-plus"></i></button>
		</div>
		
		<div class="submit-area">
			<button type="submit" class="main-btn">등록</button>
		</div>
	</article>
	<!-- [E] 게시물 리스트 -->
</section>