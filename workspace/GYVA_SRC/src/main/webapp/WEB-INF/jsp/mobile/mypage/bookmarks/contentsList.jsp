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
	
	<!-- [S] tab wrap -->
	<div class="tab-wrap" data-type="tab" data-tab-division="link">
		<!-- [S] 프론트 모바일 탭 리스트 영역 -->
		<div class="form" data-mult-form="select-list" data-tab-area="tab-list">
			<button type="button" class="select-btn">Bookmark<i class="fas fa-angle-down"></i></button>
			<ul class="option-list">
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030100', 'list');">Recently viewed</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030300', 'list');">Profile</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030500', 'list');">Helpdesk</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030700', 'list');">Bookmark</a></li>
			</ul>
		</div>
		<!-- [E] 프론트 모바일 탭 리스트 영역 -->
		
		<form:form commandName="resultList" name="listForm" id="listForm" method="post">
			<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />
			<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />	
			<input type="hidden" name="bookmarkMenuId" id="bookmarkMenuId" value="" />	
			<input type="hidden" name="contentsId" id="contentsId" value="" />	
			<input type="hidden" name="bookmarkYn" id="bookmarkYn" value="Y" />	
			<!-- [S] 프론트 모바일 컨텐츠 리스트 영역 -->
			<article class="list-wrap" data-useragent="M">
				<ul class="board-list">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<li>
							<div class="img-area">
								<a href="#none" class="link-btn">
									<span class="img"><img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_390x220.png';" alt="" /></span>
									<div class="caption">
										<span class="category">[<c:out value="${result.menuName}" />]</span>
										<strong class="tit" data-text-style="ellipsis"><c:out value="${result.title}" /></strong>
										<span class="date"><c:out value="${result.createDate}" /></span>
									</div>
								</a>
								<button type="button" class="delete-btn" onclick="fnDelete('<c:out value='${result.menuId}'/>', '<c:out value='${result.contentsId}'/>');">x</button>
							</div>
						</li>
					</c:forEach>
				</ul>
			</article>
			<!-- [E] 프론트 모바일 컨텐츠 리스트 영역 -->
		</form:form>
	</div>
	<!-- [E] tab wrap -->
	
</section>
