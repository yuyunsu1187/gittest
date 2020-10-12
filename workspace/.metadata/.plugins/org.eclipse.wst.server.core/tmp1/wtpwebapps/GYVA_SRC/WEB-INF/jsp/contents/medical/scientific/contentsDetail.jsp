<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * LG Chem YVOIRE Academy JSP
 * NAME : contentsDetail.jsp
 * DESC : 컨텐츠 페이지 조회
 * VER  : v1.0
 * Copyright 2020 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script type="text/javaScript" language="javascript">
	//<![CDATA[
	
	function fnRetrieveList() {
		document.detailForm.action = "<c:url value='/contents.do'/>";
		document.detailForm.submit();
	}
	
	function fnDownloadDetail(index) {
		$("input:checkbox[name=checkIndex]").prop("checked", false);
		$("input:checkbox[id=checkIndex_"+index+"]").prop("checked", true);
		
		document.detailForm.action = "<c:url value='/function/filedownload/downloadFileList.do'/>";
		document.detailForm.submit();
	}
	function fnMoveContents(type) {
		if(type=='P') {
			document.detailForm.contentsId.value = document.detailForm.previousContentsId.value 
		} else if(type=='N') {
			document.detailForm.contentsId.value = document.detailForm.nextContentsId.value		
		}

		document.detailForm.action = "<c:url value='/contents/scientificDetail.do'/>";
		document.detailForm.submit();
	}
	function goUpdateContents() {
		document.detailForm.action = "<c:url value='/contents/scientificEdit.do'/>";
		document.detailForm.submit();
	}
	
	function fnDeleteContents() {
		var delConfirm = confirm('정말로 삭제 하시겠습니까?');
		if (delConfirm) {
			document.detailForm.action = "<c:url value='/contents/scientificDelete.do'/>";
			document.detailForm.submit();
		}
	}
	
	//취소 클릭시 컨텐츠 화면으로
	function goContentsList() {
		detailForm.action = "<c:url value='/contents.do'/>";
		detailForm.submit();
	}
	
	// ]]>
</script>

<section id="FR050103-10" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Scientific Data</h2>
	</header>
	
	<c:if test="${menuType=='FR'}">
		<div class="breadcrumb">
			<span class="home">home</span><span class="depth">Medical Platform</span><span class="page">Scientific Data</span>
		</div>
	</c:if>
	
	<!-- [S] 게시물 보기 --> 
	<article class="board-wrap" data-board-type="form-view">
	<!-- [2020-08-28] data-board-header="download" data- 속성값 추가 -->
		<form:form commandName="resultList" name="detailForm" id="detailForm" method="post">
			<input type="hidden" name="seq" id="seq" value=<c:out value='${result.seq }'/>" />
			<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
			<input type="hidden" name="categoryCode" id="categoryCode" value="<c:out value='${result.categoryCode}'/>" />
			<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
			<input type="hidden" name="fileId" id="fileId" value="<c:out value='${result.fileId}'/>" />
			<input type="hidden" name="previousContentsId" id="previousContentsId" value="<c:out value='${result.previousContentsId}'/>" />
			<input type="hidden" name="nextContentsId" id="nextContentsId" value="<c:out value='${result.nextContentsId}'/>" />
			<input type="hidden" name="type" id="type" value="" />
			

			<div width=0 height=0 style="visibility: hidden">
				<input type="checkbox" class="Lcheckbox" name="checkIndex" id="checkIndex_0" value="0" />
			</div>
			<input type="hidden" name="fileName" value="<c:out value='${result.fileName}'/>" />
			<input type="hidden" name="uploadFilePath" value="<c:out value='${result.filePath}'/>" />
			
			<header class="board-header" data-board-header="download">
				<h3 class="board-tit"><c:out value="${result.title}" /></h3>
				<c:if test="${result.fileType=='SLIDE'}">
					<a href="#none" class="download-main-btn" onclick="fnDownloadDetail(0);">DOWNLOAD<i class="fas fa-arrow-down"></i></a>
				</c:if>
			</header>
			
			<div class="keywordTag-area">
				<span class="txt" data-text-style="ellipsis"><c:out value="${result.keyword1}" /></span>
				<span class="txt" data-text-style="ellipsis"><c:out value="${result.keyword2}" /></span>
			</div>
			
			<c:if test="${result.fileType=='SLIDE'}">
			<!-- [S] 스와이프 적용된 타입일 때 -->
			<article class="board-content" data-type="swiper" data-swiper-option="progress">
				<div class="swiper-container">
					<ul class="swiper-wrapper">
						<c:forEach var="fileInfo" items="${fileInfoList}" varStatus="status">
							<c:set var="index" value="${status.index}" />
							<li class="swiper-slide"><span class="img-area"><img src="<c:url value='${fileInfo.uploadFilePath}'/>" alt="" /></span></li>
						</c:forEach>
					</ul>
	
					<div class="swiper-pagination"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
				
				<div class="swiper-navigation"></div>
				
				<div class="text-area">
					<c:out value="${result.contents}" />
				</div>
			</article>
			<!-- [E] 스와이프 적용된 타입일 때 -->
			</c:if>
			
			<c:if test="${result.fileType=='VIDEO'}">
			<!-- [S] 비디오가 적용된 타입일 때 -->
			<article class="board-content" data-type="video">
				<div class="video-area">
					<video autoplay controls muted poster="/images/w3html5.gif">
						<c:forEach var="fileInfo" items="${fileInfoList}" varStatus="status">
							<c:set var="index" value="${status.index}" />
							<source src="<c:url value='${fileInfo.uploadFilePath}'/>" type="video/mp4">
						</c:forEach>
					</video>
				</div>
				
				<div class="text-area">
					<strong class="tit">[<c:out value="${result.title}" />]</strong>
					<p class="txt"><c:out value="${result.contents}" /></p>
				</div>
			</article>
			<!-- [E] 비디오가 적용된 타입일 때 -->
			</c:if>
			
			<div class="submit-area">
				<c:if test="${menuType=='FR'}">
					<c:if test="${result.contentsId != result.previousContentsId}">
						<button type="submit" class="sub-btn" data-offset="left" onclick="fnMoveContents('P');"><i class="fas fa-chevron-left"></i>Previous</button>
					</c:if>
					<c:if test="${result.contentsId != result.nextContentsId}"> 
						<button type="submit" class="sub-btn" data-offset="left" onclick="fnMoveContents('N');">Next<i class="fas fa-chevron-right"></i></button>
					</c:if>
						<button type="button" class="sub-btn" onclick="fnRetrieveList();"><i class="fas fa-list left"></i>List</button>
				</c:if>
			</div>
			<c:if test="${menuType=='AD'}">
				<div class="submit-area">
					<button type="submit" class="sub-btn" data-offset="left"><i class="fas fa-chevron-left"></i>Previous</button>
					<button type="submit" class="sub-btn" data-offset="left">Next<i class="fas fa-chevron-right"></i></button>
					<button type="button" class="sub-btn" onclick="fnRetrieveList();">목록</button>
					<button type="button" class="sub-btn" onclick="fnDeleteContents();">삭제</button>
					<button type="button" class="main-btn" onclick="goUpdateContents();">수정</button>
				</div>
			</c:if>
		</form:form>
	</article>
	<!-- [E] 게시물 보기 -->
	
</section>

