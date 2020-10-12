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
	function goDetail(menuId, contentsId) {
		document.listForm.menuId.value = menuId;
		document.listForm.contentsId.value = contentsId;
	   	document.listForm.action = "<c:url value='/contents/searchDetail.do'/>";
	   	document.listForm.submit();
	}
	// 해당 파일 다운로드
	function fnDownload(index, contentsId) {
		var app = document.getElementById("append");
		app.innerHTML = "<input type=hidden class=Lcheckbox name=checkIndex id=checkIndex value="+ index +">";

		document.scientificForm.downloadId.value = contentsId;
		document.scientificForm.action = "<c:url value='/function/filedownload/downloadFileList.do'/>";
		document.scientificForm.submit();
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
	//]]>
</script>
			
<section id="FR010501-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">My page</h2>
	</header>
	
	<div class="breadcrumb">
		<span class="home">home</span><span class="depth">My page</span><span class="page">Profile</span>
	</div>
	
	<!-- [S] tab wrap -->
	<div class="tab-wrap" data-type="tab" data-tab-division="link">
		<ul class="tab-list" data-combine-tab="column-4-tab">
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0301'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030100', 'list');">Recently viewed</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0303'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030300', 'list');">Profile</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0305'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030500', 'list');">Helpdesk</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0307'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030700', 'list');">Bookmark</a></li>
		</ul>
		
		<article class="list-wrap" data-list-type="thumbnail" data-combine-list="column-4-list">
			<form:form commandName="resultScientificList" name="scientificForm" id="scientificForm" method="post">
				<input type="hidden" name="seq" id="seq" value="" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
				<input type="hidden" name="menuType" id="menuType" value="<c:out value='${menuType}'/>" />		
				<input type="hidden" name="downloadId" id="downloadId" value="" />		
				<input type="hidden" name="fileId" id="fileId" value="" />
				<div id="append"></div>
				<h3 class="article-tit">Scientific Data</h3>
				
				<ul class="thumbnail-list" data-list-style="clfix">
					<c:forEach var="result" items="${resultScientificList}" varStatus="status">
						<c:set var="index" value="${status.index}" />
						<li>
							<input type="hidden" name="fileName" value="<c:out value='${result.fileName}'/>" />
							<input type="hidden" name="uploadFilePath" value="<c:url value='${result.filePath}'/>" />
							<div class="img-area">
								<img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_340x190.png';" alt="" onclick="javascript:goContentsDetail('<c:out value='${result.seq}'/>','<c:out value='${result.fileId}'/>');"  />
								<div class="caption">
									<a href="#none" class="link-btn"><strong class="tit" data-text-style="ellipsisRow" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');"><c:out value='${result.title}'/></strong></a>
									<div class="keywordTag-area">
										<span class="txt" data-text-style="ellipsis"><c:out value="${result.keyword1}" /></span>
										<span class="txt" data-text-style="ellipsis"><c:out value="${result.keyword2}" /></span>
									</div>
									<!-- 프론트에서만 노출되는 버튼 -->
								<a href="#none" class="download-main-btn" onclick="fnDownload(<c:out value='${index}'/>);">DOWNLOAD<i class="fas fa-arrow-down"></i></a>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</form:form>
		</article>
		
		<article class="list-wrap" data-list-type="thumbnail" data-combine-list="column-4-list">
			<form:form commandName="resultAcademyList" name="ListForm" id="ListForm" method="post">
				<input type="hidden" name="seq" id="seq" value="" />
				<input type="hidden" name="menuId" id="menuId" value="FR090100" />
				<input type="hidden" name="categoryCode" id="categoryCode" value="" />
				<input type="hidden" name="contentsId" id="contentsId" value="" />
				<h3 class="article-tit">Anatomy</h3>
				<ul class="thumbnail-list" data-list-style="clfix">
					<c:forEach var="result" items="${resultAnatomyList}" varStatus="status">
						<li>
							<input type="hidden" name="fileName" value="<c:out value='${result.fileName}'/>" />
							<input type="hidden" name="uploadFilePath" value="<c:url value='${result.filePath}'/>" />
							<a href="#none" class="link-btn" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');">
								<div class="img-area">
									<img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_340x190.png';"  alt="" />
									<div class="caption" data-type="toggle" data-toggle-action="bookmark">
										<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.title}" /></strong>
										<button type="button" class="bookmark-btn<c:if test="${result.bookmarkYn =='Y'}"> active</c:if>" onclick="fnBookmark('<c:out value='${result.menuId}'/>', '<c:out value='${result.contentsId}'/>', '<c:out value='${result.bookmarkYn}'/>');"></button>
										<div class="profile">
											<span class="img"><img src="<c:url value='${result.lecturerImgPath}'/>" /></span>
											<div class="text-area">
												<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.lecturerName}" /></strong>
												<div class="txt" data-text-style="ellipsisRow03"><c:out value="${result.career1}" /><br /><c:out value="${result.career2}" /><br /><c:out value="${result.career3}" /></div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</form:form>
		</article>
		
		<article class="list-wrap" data-list-type="thumbnail" data-combine-list="column-4-list">
			<form:form commandName="resultInjectionList" name="upperListForm" id="upperListForm" method="post">
				<input type="hidden" name="seq" id="seq" value="" />
				<input type="hidden" name="menuId" id="menuId" value="FR090300" />
				<input type="hidden" name="categoryCode" id="categoryCode" value="" />
				<input type="hidden" name="contentsId" id="contentsId" value="" />
				<input type="hidden" name="mode" id="mode" value="" />
				<h3 class="article-tit">YVOIRE Injection</h3>
				<ul class="thumbnail-list" data-list-style="clfix">
					<c:forEach var="result" items="${resultInjectionList}" varStatus="status">
						<li>
							<input type="hidden" name="fileName" value="<c:out value='${result.fileName}'/>" />
							<input type="hidden" name="uploadFilePath" value="<c:url value='${result.filePath}'/>" />
							<a href="#none" class="link-btn" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');">
								<div class="img-area">
									<img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_340x190.png';" alt="" />
									<div class="caption" data-type="toggle" data-toggle-action="bookmark">
										<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.title}" /></strong>
										<button type="button" class="bookmark-btn<c:if test="${result.bookmarkYn =='Y'}"> active</c:if>" onclick="fnBookmark('<c:out value='${result.menuId}'/>', '<c:out value='${result.contentsId}'/>', '<c:out value='${result.bookmarkYn}'/>');"></button>
										<div class="profile">
											<span class="img"><img src="<c:url value='${result.lecturerImgPath}'/>" /></span>
											<div class="text-area">
												<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.lecturerName}" /></strong>
												<div class="txt" data-text-style="ellipsisRow03"><c:out value="${result.career1}" /><br /><c:out value="${result.career2}" /><br /><c:out value="${result.career3}" /></div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</form:form>
		</article>
		
		<article class="list-wrap" data-list-type="thumbnail" data-combine-list="column-1-list">
			<form:form commandName="resultExerciseList" name="upperListForm" id="upperListForm" method="post">
				<input type="hidden" name="seq" id="seq" value="" />
				<input type="hidden" name="menuId" id="menuId" value="FR091100" />
				<input type="hidden" name="categoryCode" id="categoryCode" value="" />
				<input type="hidden" name="contentsId" id="contentsId" value="" />
				<input type="hidden" name="mode" id="mode" value="" />
				<h3 class="article-tit">YVOIRE Exercise</h3>
				<ul class="thumbnail-list" data-list-style="clfix">
					<c:forEach var="result" items="${resultExerciseList}" varStatus="status">
						<li>
							<input type="hidden" name="fileName" value="<c:out value='${result.fileName}'/>" />
							<input type="hidden" name="uploadFilePath" value="<c:url value='${result.filePath}'/>" />
							<a href="#none" class="link-btn" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');">
								<div class="img-area">
									<span class="img"><img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_340x190.png';" alt=""></span>
									<div class="caption">
										<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.title}" /></strong>
										<span class="txt" data-text-style="ellipsisRow03"><c:out value="${result.contents}" /></span>
										<span class="date"><c:out value="${result.createDate}" /></span>
										<div class="keywordTag-area">
											<span class="txt" data-text-style="ellipsis"><c:out value="${result.keyword1}" /></span>
											<span class="txt" data-text-style="ellipsis"><c:out value="${result.keyword2}" /></span>
										</div>
										<div class="profile">
											<span class="img"><img src="<c:url value='${result.lecturerImgPath}'/>"></span>
											<div class="text-area">
												<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.lecturerName}" /></strong>
												<div class="txt" data-text-style="ellipsisRow03"><c:out value="${result.career1}" /><br><c:out value="${result.career2}" /><br><c:out value="${result.career3}" /></div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</form:form>
		</article>
	</div>
	<!-- [E] tab wrap -->
	<form:form commandName="resultList" name="listForm" id="listForm" method="post">
		<input type="hidden" name="seq" id="seq" value="" />
		<input type="hidden" name="menuId" id="menuId" value="" />
		<input type="hidden" name="contentsId" id="contentsId" value="" />
		<input type="hidden" name="categoryCode" id="categoryCode" value="" />
	</form:form>
	
</section>
