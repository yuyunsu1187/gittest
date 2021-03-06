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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script type="text/javascript" language="javascript">
	//<![CDATA[
	function fnDelete(menuId, contentsId) {
		document.listForm.bookmarkMenuId.value = menuId;
		document.listForm.contentsId.value = contentsId;
	   	document.listForm.action = "<c:url value='/mypage/bookmark/deleteBookmark.do'/>";
	   	document.listForm.submit();
	}
	function goDetail(menuId, contentsId) {
		document.listForm.menuId.value = menuId;
		document.listForm.contentsId.value = contentsId;
	   	document.listForm.action = "<c:url value='/mypage/bookmarkDetail.do'/>";
	   	document.listForm.submit();
	}
	// 파일 다운로드
	function fnDownloadDetail(index) {
		
		$("input:checkbox[name=checkIndex]").prop("checked", false);	
		$("input:checkbox[id=checkIndex_"+index+"]").prop("checked", true);	
		
		document.detailForm.action = "<c:url value='/function/filedownload/downloadFileList.do'/>";
		document.detailForm.submit();
	}
	//]]>
</script>
			
<section id="FR010507-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">My page</h2>
	</header>
	
	<div class="breadcrumb">
		<span class="home">home</span><span class="depth">My page</span><span class="page">Bookmark</span>
	</div>
	
	<!-- [S] tab wrap -->
	<div class="tab-wrap" data-type="tab" data-tab-division="link">
		<ul class="tab-list" data-combine-tab="column-4-tab">
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0301'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030100', 'list');">Recently viewed</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0303'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030300', 'list');">Profile</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0305'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030500', 'list');">Helpdesk</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0307'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030700', 'list');">Bookmark</a></li>
		</ul>
		
		<article class="board-wrap" data-board-type="form-list">
			<h3 class="article-tit">Bookmark</h3>
			<form:form commandName="resultList" name="listForm" id="listForm" method="post">
				<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />	
				<input type="hidden" name="bookmarkMenuId" id="bookmarkMenuId" value="" />	
				<input type="hidden" name="contentsId" id="contentsId" value="" />	
				<input type="hidden" name="bookmarkYn" id="bookmarkYn" value="Y" />			
				<div class="board-area">
					<table class="default-table">
						<caption>Bookmark 리스트</caption>
						<colgroup>
							<col style="width:130px;">
							<col style="width:270px;">
							<col style="width:auto;">
							<col style="width:200px;">
							<col style="width:220px;">
						</colgroup>
						
						<tbody>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr>
									<td><c:out value="${result.seq}" /></td>
									<td class="img">
										<span class="img-area"><img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_390x220.png';" alt="" /></span>
									</td>
									<td>
										<a href="#none" class="link-btn" data-text-style="ellipsis" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');">
											<strong class="link-tit"><c:out value="${result.title}" /></strong>
											<strong class="link-txt"><c:out value="${result.parentMenuName}" />&nbsp;<c:out value="${result.menuName}" /></strong>
										</a>
									</td>
									<td><c:out value="${result.createDate}" /></td>
									<td><button type="button" class="board-sub-btn" onclick="fnDelete('<c:out value='${result.menuId}'/>', '<c:out value='${result.contentsId}'/>');">Delete</button></td>
								</tr>
							</c:forEach>
							<c:if test="${empty resultList && !empty input}">
								<tr id="empty" style="background-color: #FFFFFF">
									<td colspan="5">등록된 즐겨찾기가 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				
				<div class="button-area">
					<button type="button" class="more-sub-btn" data-btn-style="more">See more<i class="fas fa-plus"></i></button>
				</div>
			</form:form>
		</article>
	</div>
	<!-- [E] tab wrap -->
	
</section>
