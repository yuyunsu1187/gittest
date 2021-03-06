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
	function fnDetail(value) {
	    document.listForm.surveyId.value = value;
		document.listForm.action = "<c:url value='/admin/contents/questionDetail.do'/>";
		document.listForm.submit();
	}
	
	// 글 작성 화면으로 이동
	function fnWrite() {
		document.listForm.action = "<c:url value='/admin/contents/questionForm.do'/>";
		document.listForm.submit();
	}
	
	//]]>
</script>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">설문관리</h2>
	</header>
	
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
		<Tag:paging resultList='${resultList}' >
		<Tag:pagingOut value="showJavaScript" /> 
		<!-- 리스트 노출 개수는 최대 10줄 -->
		<div class="board-area">					
			<form:form commandName="resultList" name="listForm" id="listForm" method="post" onsubmit="fnWrite();">
				<input type="hidden" name="surveyId" id="surveyId" value="" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
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
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td><c:out value="${result.seq}" /></td>
								<td data-text-style="ellipsis">
									<a href="javascript:fnDetail('<c:out value="${result.surveyId}"/>')"><c:out value="${result.title}" /></a>
								</td>
								<td><Tag:mask mask="###########"><c:out value="${result.createDate}" /></Tag:mask></td>
							</tr>
						</c:forEach>
						
						<!-- 검색결과가 값이 없을 때 -->
						<c:if test="${empty resultList && !empty input}">
							<tr>
								<td colspan="3" data-td-type="board-noData">등록된 사용자가 없습니다</td>
							</tr>
						</c:if>
					</tbody>
				</table>
						
				<!-- [S] paging -->
				<div class="paging-area" <c:if test="${empty resultList}">style="display:none"</c:if>>
				    <Tag:pagingOut value='showMoveFirstPage' />
				    <Tag:pagingOut value='showMoveBeforePage' />
				    <Tag:pagingOut value='showIndex' />
				    <Tag:pagingOut value='showMoveNextPage' />
				    <Tag:pagingOut value='showMoveEndPage' />
				</div>
				<!-- [S] paging -->
				
				<div class="submit-area">
					<button type="submit" class="main-btn">등록</button>
				</div>
			</form:form>
		</div>
		</Tag:paging>
	</article>
	<!-- [E] 게시물 리스트 -->
</section>