<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * LG Chem YVOIRE Academy JSP
 * NAME : contentsList.jsp
 * DESC : 컨텐츠 페이지 목록조회
 * VER  : v1.0
 * Copyright 2020 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"  %>
<%@ page import="devonframe.gyva.front.contents.model.Contents" %>
<%@ page import="devonframe.paging.*" %>
<%@ page import="devonframe.paging.ui.*" %>
<%@ page import="devonframe.paging.PagingUtil" %>

<script type="text/javascript" language="javascript">
//<![CDATA[
function fnRetrieveList() {
	document.searchForm.action = "<c:url value='/admin/contents/notice/retrieveContentsList.do'/>";
	document.searchForm.submit();
}
function fnDetail(value) {
    document.searchForm.seq.value = value;
	document.searchForm.action = "<c:url value='/admin/contents/notice/retrieveContents.do'/>";
	document.searchForm.submit();
}
//]]>
</script>

			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Notice</h2>
	</header>
				
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
		<Tag:paging resultList='${resultList}' >
		<Tag:pagingOut value="showJavaScript" /> 
		<!-- [S] 게시물 상단 폼 영역 -->
		<div class="form-wrap" data-board-type="inquiry">
			<form name="searchForm" method="post" onsubmit="fnRetrieveList();return false;">
				<Tag:pagingAddHiddenParam  />
		    	<input type="hidden" id="seq" name="seq" />
		    	<input type="hidden" id="contentsId" name="contentsId" />
		    	<input type="hidden" id="menuId" name="menuId" value="${MenuInfoInterceptor_menuId}" />
				<div class="form-area" data-combine-form="column-2-form" data-offset="right">
					<div class="form" data-form="select">
						<select class="select-form" id="categoryCode" name="categoryCode">
							<option value="" <c:if test="${input.categoryCode == ''}">selected="selected"</c:if>>All</option>
							<c:forEach items="${categoryCode}" var="category" >
								<option value="${category.code}" <c:if test="${input.categoryCode == category.code}">selected="selected"</c:if>><c:out value="${category.value}"/></option>
							</c:forEach>
	                    </select>
						<i class="fas fa-angle-down"></i>
					</div>
					<div class="form" data-mult-form="search">
						<input type="text" class="input-form" id="title" name=title value="${input.title}" placeholder="Please enter a search word." />
						<button type="button" class="icon-btn" onclick="fnRetrieveList();return false;"><i class="fab fa-sistrix"></i></button>
					</div>
				</div>
			</form>
		</div>
		<!-- [E] 게시물 상단 폼 영역 -->
					
		<!-- 리스트 노출 개수는 최대 10줄 -->
		<div class="board-area">
			<table class="default-table">
				<caption>Notice 리스트</caption>
				<colgroup>
					<col style="width:20%;" />
					<col style="width:auto;" />
					<col style="width:20%;" />
				</colgroup>
				
				<thead>
					<tr>
						<th scope="row">Category</th>
						<th scope="row">Title</th>
						<th scope="row">Registration Date</th>
					</tr>
				</thead>
	
				<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td><c:out value="${result.categoryName}" /></td>
							<td data-text-style="ellipsis"><a href="javascript:fnDetail('<c:out value="${result.seq}"/>')"><c:out value="${result.title}" /></a></td>
							<td><Tag:mask mask="###########"><c:out value="${result.createDate}" /></Tag:mask></td>
						</tr>
					</c:forEach>
					<c:if test="${empty resultList && !empty input}">
						<tr>
							<td colspan="3" data-td-type="board-noData">등록된 사용자가 없습니다</td>
						</tr>
					</c:if>
				</tbody>
			</table>				
		</div>
					
		<!-- [S] paging -->
		<div class="paging-area" <c:if test="${empty resultList}">style="display:none"</c:if>>
			<ul>
			    <Tag:pagingOut value='showMoveFirstPage' />
			    <Tag:pagingOut value='showMoveBeforePage' />
			    <Tag:pagingOut value='showIndex' />
			    <Tag:pagingOut value='showMoveNextPage' />
			    <Tag:pagingOut value='showMoveEndPage' />
		    </ul>
		</div>
		<!-- [S] paging -->
					
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
		
		</Tag:paging>
					
		<div class="submit-area">
			<button type="submit" class="main-btn">등록</button>
		</div>
			
	</article>
	
</section>