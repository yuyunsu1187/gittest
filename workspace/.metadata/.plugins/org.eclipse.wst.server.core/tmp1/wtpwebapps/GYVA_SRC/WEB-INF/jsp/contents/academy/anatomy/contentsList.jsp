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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" language="javascript">
//<![CDATA[
function fnDetail(form, menuId, contentsId) {
	form.menuId.value = menuId;
	form.contentsId.value = contentsId;
	form.action = "<c:url value='/contents/anatomyDetail.do'/>";
	form.submit();
}
function fnBookmark(menuId, contentsId, bookmarkYn) {	
	$.ajax({
		url : "/contents/updateBookmark.do",
		type : "post",
		dataType : "json",
		data : {"menuId" : menuId, "contentsId" : contentsId, "bookmarkYn" : bookmarkYn},
		success : function(data) {

		},
	})
}
// 글 작성 화면으로 이동
function goContentsWrite(form) {
	form.action = "<c:url value='/contents/anatomyWrite.do'/>";
	form.submit();
}
//]]>
</script>
			
<section id="FR070101-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Anatomy</h2>
	</header>
	
	<div class="breadcrumb">
		<span class="home">home</span><span class="depth">Academy Platform</span><span class="page">Anatomy</span>
	</div>
	
	<!-- [S] tab wrap -->
	<div class="tab-wrap" data-type="tab" data-tab-division="article">
		<ul class="tab-list" data-combine-tab="column-3-tab">
			<li data-tab-type="list" data-tab-action="active"><button type="button" class="list-btn">Upper Face</buton></li>
			<li data-tab-type="list"><button type="button" class="list-btn">Mid Face</buton></li>
			<li data-tab-type="list"><button type="button" class="list-btn">Low Face</buton></li>
		</ul>
		<!-- [S] 프론트 모바일 탭 리스트 영역 -->
		<div class="form" data-mult-form="select-list" data-tab-area="tab-list">
			<button type="button" class="select-btn">Upper Face<i class="fas fa-angle-down"></i></button>
			<ul class="option-list">
				<li data-tab-type="list"><button type="button" class="list-btn">Upper Face</buton></li>
				<li data-tab-type="list"><button type="button" class="list-btn">Mid Face</buton></li>
				<li data-tab-type="list"><button type="button" class="list-btn">Low Face</buton></li>
			</ul>
		</div>
		<!-- [E] 프론트 모바일 탭 리스트 영역 -->
	
		<!-- [S] tab contents : index, 0 -->
		<article class="tab-contents" data-tab-type="contents">
			<form:form commandName="upperList" name="upperListForm" id="upperListForm" method="post">
				<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
				<input type="hidden" name="contentsId" id="contentsId" value="" />
				<input type="hidden" name="categoryCode" id="categoryCode" value="01" />
				<!-- [S] 썸네일 list -->
				<article class="list-wrap" data-list-type="thumbnail" data-combine-list="column-4-list">
					<ul class="thumbnail-list" data-list-style="clfix">
						<c:forEach var="result" items="${upperList}" varStatus="status">
							<li>
								<div class="img-area" data-type="toggle" data-toggle-action="bookmark">
									<a href="#none" class="link-btn" onclick="javascript:fnDetail(document.getElementById('upperListForm'), '<c:out value='${menuId}'/>', '<c:out value='${result.contentsId}'/>');">
										<img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_340x190.png';" alt="" />
										<div class="caption">
											<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.title}" /></strong>
											<div class="profile">
												<span class="img"><img src="<c:out value='${result.lecturerImgPath}'/>" /></span>
												<div class="text-area">
													<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.lecturerName}" /></strong>
													<div class="txt" data-text-style="ellipsisRow03"><c:out value="${result.career1}" /></div>
												</div>
											</div>
										</div>
									</a>
									<button type="button" class="bookmark-btn<c:if test="${result.bookmarkYn =='Y'}"> active</c:if>" onclick="fnBookmark('<c:out value='${result.menuId}'/>', '<c:out value='${result.contentsId}'/>', '<c:out value='${result.bookmarkYn}'/>');"></button>
								</div>
							</li>
						</c:forEach>
					</ul>
					
					<div class="button-area">
						<button type="button" class="more-sub-btn" data-btn-style="more">See more<i class="fas fa-plus"></i></button>
					</div>
						
					<c:if test="${menuType=='AD'}">
						<div class="submit-area">
							<button type="button" class="main-btn" onclick="goContentsWrite(this.form);">등록</button>
						</div>
					</c:if>
				</article>
				<!-- [E] 썸네일 list -->
			</form:form>
		</article>
		<!-- [E] tab contents -->
		
		<!-- [S] tab contents : index, 1 -->
		<article class="tab-contents" data-tab-type="contents">
			<form:form commandName="midList" name="midListForm" id="midListForm" method="post">
				<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
				<input type="hidden" name="contentsId" id="contentsId" value="" />
				<input type="hidden" name="categoryCode" id="categoryCode" value="02" />
				<!-- [S] 썸네일 list -->
				<article class="list-wrap" data-list-type="thumbnail" data-combine-list="column-4-list">
					<ul class="thumbnail-list" data-list-style="clfix">
						<c:forEach var="result" items="${midList}" varStatus="status">
							<li>
								<div class="img-area" data-type="toggle" data-toggle-action="bookmark">
									<a href="#none" class="link-btn" onclick="javascript:fnDetail(document.getElementById('midListForm'), '<c:out value='${menuId}'/>', '<c:out value='${result.contentsId}'/>');">
										<img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_340x190.png';" alt="" />
										<div class="caption">
											<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.title}" /></strong>
											<div class="profile">
												<span class="img"><img src="<c:url value='${result.lecturerImgPath}'/>" /></span>
												<div class="text-area">
													<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.lecturerName}" /></strong>
													<div class="txt" data-text-style="ellipsisRow03"><c:out value="${result.career1}" /></div>
												</div>
											</div>
										</div>
									</a>
									<button type="button" class="bookmark-btn<c:if test="${result.bookmarkYn =='Y'}"> active</c:if>" onclick="fnBookmark('<c:out value='${result.menuId}'/>', '<c:out value='${result.contentsId}'/>', '<c:out value='${result.bookmarkYn}'/>');"></button>
								</div>
							</li>
						</c:forEach>
					</ul>
					
					<div class="button-area">
						<button type="button" class="more-sub-btn" data-btn-style="more">See more<i class="fas fa-plus"></i></button>
					</div>
						
					<c:if test="${menuType=='AD'}">
						<div class="submit-area">
							<button type="button" class="main-btn" onclick="goContentsWrite(this.form);">등록</button>
						</div>
					</c:if>
				</article>
				<!-- [E] 썸네일 list -->
			</form:form>
		</article>
		<!-- [E] tab contents -->
		
		<!-- [S] tab contents : index, 2 -->
		<article class="tab-contents" data-tab-type="contents">
			<form:form commandName="lowList" name="lowListForm" id="lowListForm" method="post">
				<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
				<input type="hidden" name="contentsId" id="contentsId" value="" />
				<input type="hidden" name="categoryCode" id="categoryCode" value="03" />
				<!-- [S] 썸네일 list -->
				<article class="list-wrap" data-list-type="thumbnail" data-combine-list="column-4-list">
					<ul class="thumbnail-list" data-list-style="clfix">					
						<c:forEach var="result" items="${lowList}" varStatus="status">
							<li>
								<div class="img-area" data-type="toggle" data-toggle-action="bookmark">
									<a href="#none" class="link-btn" onclick="javascript:fnDetail(document.getElementById('lowListForm'), '<c:out value='${menuId}'/>', '<c:out value='${result.contentsId}'/>');">
										<img src="<c:out value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_340x190.png';" alt="" />
										<div class="caption">
											<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.title}" /></strong>
											<div class="profile">
												<span class="img"><img src="<c:out value='${result.lecturerImgPath}'/>" /></span>
												<div class="text-area">
													<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.lecturerName}" /></strong>
													<div class="txt" data-text-style="ellipsisRow03"><c:out value="${result.career1}" /></div>
												</div>
											</div>
										</div>
									</a>
									<button type="button" class="bookmark-btn<c:if test="${result.bookmarkYn =='Y'}"> active</c:if>" onclick="fnBookmark('<c:out value='${result.menuId}'/>', '<c:out value='${result.contentsId}'/>', '<c:out value='${result.bookmarkYn}'/>');"></button>
								</div>
							</li>
						</c:forEach>
					</ul>
					
					<div class="button-area">
						<button type="button" class="more-sub-btn" data-btn-style="more">See more<i class="fas fa-plus"></i></button>
					</div>	
						
					<c:if test="${menuType=='AD'}">
						<div class="submit-area">
							<button type="button" class="main-btn" onclick="goContentsWrite(this.form);">등록</button>
						</div>
					</c:if>					
				</article>
				<!-- [E] 썸네일 list -->
			</form:form>
		</article>
		<!-- [E] tab contents -->
	</div>
	<!-- [E] tab wrap -->
	
</section>
