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
		<h2 class="content-tit">설문관리</h2>
	</header>
	
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
		<!-- 리스트 노출 개수는 최대 10줄 -->
		<div class="board-area">
			<table class="default-table">
				<caption>설문관리 리스트</caption>
				<colgroup>
					<col style="width:10%;" />
					<col style="width:auto;" />
					<col style="width:20%;" />
				</colgroup>
				
				<thead>
					<tr>
						<th scope="row">No</th>
						<th scope="row">설문 제목</th>
						<th scope="row">등록일자</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>67</td>
						<td data-text-style="ellipsis"><a href="#none" class="link-btn">Scientific Data 설문01</a></td>
						<td>2020-07-27</td>
					</tr>
					
					<tr>
						<td>66</td>
						<td data-text-style="ellipsis"><a href="#none" class="link-btn">Anatomy Webinars 설문 01</a></td>
						<td>2020-07-27</td>
					</tr>
					
					<!-- 검색결과가 값이 없을 때 -->
					<tr>
						<td colspan="3" data-td-type="board-noData">등록된 사용자가 없습니다</td>
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
		
		<div class="submit-area">
			<button type="submit" class="main-btn">등록</button>
		</div>
	</article>
	<!-- [E] 게시물 리스트 -->
</section>