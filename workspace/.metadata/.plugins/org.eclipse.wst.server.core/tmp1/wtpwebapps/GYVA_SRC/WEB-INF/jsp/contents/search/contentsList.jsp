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
	function goDetail(menuId, contentsId) {
		document.listForm.menuId.value = menuId;
		document.listForm.contentsId.value = contentsId;
	   	document.listForm.action = "<c:url value='/contents/searchDetail.do'/>";
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
			
<section id="FR010901-05" class="content-section">
	<div class="breadcrumb">
		<span class="home">home</span><span class="page">Search Results</span>
	</div>
	
	<h2 class="content-tit"><em class="search"><c:out value="${param.keyWord}" /></em><span class="search-value"><c:out value="${resurltCnt}" /></span>results</h2>
	<form:form commandName="resultList" name="listForm" id="listForm" method="post">
		<input type="hidden" name="menuId" id="menuId" value="" />
		<input type="hidden" name="contentsId" id="contentsId" value="" />
	</form:form>
	
	<article class="board-wrap" data-board-type="form-list" data-useragent="P">
		<h3 class="article-tit">Branding Platform</h3>
		<div class="board-area">
			<table class="default-table">
				<caption>Branding Platform 리스트</caption>
				<colgroup>
					<col style="width:21%;">
					<col style="width:auto;">
				</colgroup>
				
				<tbody>
					<c:forEach var="result" items="${resultBrandingList}" varStatus="status">
						<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>" />
						<input type="hidden" name="menuId" id="menuId" value="<c:out value='${result.menuId}'/>" />
						<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
						<input type="hidden" name="remark" id="remark" value="<c:out value='${result.remark }'/>" /> <!-- etc 데이터  -->
						<input type="hidden" name="fileName" id="fileName" value="<c:out value='${result.fileName}'/>" />
						<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="<c:url value='${result.filePath}'/>" />
						<tr>
							<td data-type="category">[<c:out value="${result.menuName}" />]</td>
							<td data-text-style="ellipsis"><a href="#none" class="link-btn" data-btn-style="modal" data-btn-key="detail"><c:out value="${result.title}" /></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="button-area">
			<button type="button" class="more-sub-btn">See more<i class="fas fa-plus"></i></button>
		</div>
		
		<h3 class="article-tit">Medical Platform</h3>
		<div class="board-area">
			<table class="default-table">
				<caption>Medical Platform 리스트</caption>
				<colgroup>
					<col style="width:21%;">
					<col style="width:auto;">
				</colgroup>
				
				<tbody>
					<c:forEach var="result" items="${resultMedicalList}" varStatus="status">
						<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>" />
						<input type="hidden" name="menuId" id="menuId" value="<c:out value='${result.menuId}'/>" />
						<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
						<input type="hidden" name="remark" id="remark" value="<c:out value='${result.remark }'/>" /> <!-- etc 데이터  -->
						<input type="hidden" name="fileName" id="fileName" value="<c:out value='${result.fileName}'/>" />
						<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="<c:url value='${result.filePath}'/>" />
						<tr>
							<td data-type="category">[<c:out value="${result.menuName}" />]</td>
							<td data-text-style="ellipsis">
								<a href="#none" class="link-btn" <c:if test="${empty result.detailUrl}">data-btn-style="modal" data-btn-key="detail"</c:if> <c:if test="${!empty result.detailUrl}">onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');"</c:if>>
									<c:out value="${result.title}" />
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="button-area">
			<button type="button" class="more-sub-btn">See more<i class="fas fa-plus"></i></button>
		</div>
		
		<h3 class="article-tit">Academy Platform</h3>
		<div class="board-area">
			<table class="default-table">
				<caption>Academy 리스트</caption>
				<colgroup>
					<col style="width:21%;">
					<col style="width:auto;">
				</colgroup>
				
				<tbody>
					<c:forEach var="result" items="${resultAcademyList}" varStatus="status">
						<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>" />
						<input type="hidden" name="menuId" id="menuId" value="<c:out value='${result.menuId}'/>" />
						<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
						<input type="hidden" name="remark" id="remark" value="<c:out value='${result.remark }'/>" /> <!-- etc 데이터  -->
						<input type="hidden" name="fileName" id="fileName" value="<c:out value='${result.fileName}'/>" />
						<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="<c:url value='${result.filePath}'/>" />
						<tr>
							<td data-type="category">[<c:out value="${result.menuName}" />]</td>
							<td data-text-style="ellipsis"><a href="#none" class="link-btn" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');"><c:out value="${result.title}" /></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="button-area">
			<button type="button" class="more-sub-btn">See more<i class="fas fa-plus"></i></button>
		</div>
		
		<h3 class="article-tit">Registration</h3>
		<div class="board-area">
			<table class="default-table">
				<caption>Registration 리스트</caption>
				<colgroup>
					<col style="width:21%;">
					<col style="width:auto;">
				</colgroup>
				
				<tbody>
					<c:forEach var="result" items="${resultRegistrationList}" varStatus="status">
						<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>" />
						<input type="hidden" name="menuId" id="menuId" value="<c:out value='${result.menuId}'/>" />
						<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
						<input type="hidden" name="remark" id="remark" value="<c:out value='${result.remark }'/>" /> <!-- etc 데이터  -->
						<input type="hidden" name="contents" id="contents" value="<c:out value='${result.contents}'/>" />
						<input type="hidden" name="fileName" id="fileName" value="<c:out value='${result.fileName}'/>" />
						<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="<c:out value='${result.filePath}'/>" />
						<input type="hidden" name="yourHost" id="yourHost" value="<c:out value='${result.lecturer}'/>" />
						<input type="hidden" name="place" id="place" value="<c:out value='${result.place}'/>" />
						<input type="hidden" name="calendar" id="calendar" value="<c:out value='${result.startDate}'/> <c:if test="${empty result.date}">~ <c:out value='${result.endDate}'/></c:if> <c:out value='${result.date}'/>" />
						<input type="hidden" name="webinarUrl" id="webinarUrl" value="<c:out value='${result.contentsUrl}'/>" />
						<tr>
							<td data-type="category">[<c:out value="${result.menuName}" />]</td>
							<td data-text-style="ellipsis"><a href="#none" class="link-btn" data-btn-style="modal" data-btn-key="registration"><c:out value="${result.title}" /></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="button-area">
			<button type="button" class="more-sub-btn">See more<i class="fas fa-plus"></i></button>
		</div>
	</article>

	<!-- [S] 프론트 모바일 컨텐츠 리스트 영역 -->
	<article class="list-wrap" data-useragent="M">
		<h3 class="article-tit">Branding Platform</h3>
		<ul class="board-list">
			<c:forEach var="result" items="${resultBrandingList}" varStatus="status">
				<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${result.menuId}'/>" />
				<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
				<input type="hidden" name="remark" id="remark" value="<c:out value='${result.remark }'/>" /> <!-- etc 데이터  -->
				<input type="hidden" name="fileName" id="fileName" value="<c:out value='${result.fileName}'/>" />
				<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="<c:url value='${result.filePath}'/>" />
				<li>
					<a href="#none" class="link-btn" data-btn-style="modal" data-btn-key="detail">
						<span class="category">[<c:out value="${result.menuName}" />]</span>
						<strong class="tit" data-text-style="ellipsis"><c:out value="${result.title}" /></strong>
					</a>
				</li>				
			</c:forEach>
		</ul>
		
		<div class="button-area">
			<button type="button" class="more-sub-btn">See more<i class="fas fa-plus"></i></button>
		</div>
	</article>
	
	<article class="list-wrap" data-useragent="M">
		<h3 class="article-tit">Medical Platform</h3>
		<ul class="board-list">
			<c:forEach var="result" items="${resultMedicalList}" varStatus="status">
				<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${result.menuId}'/>" />
				<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
				<input type="hidden" name="remark" id="remark" value="<c:out value='${result.remark }'/>" /> <!-- etc 데이터  -->
				<input type="hidden" name="fileName" id="fileName" value="<c:out value='${result.fileName}'/>" />
				<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="<c:url value='${result.filePath}'/>" />
				<li>
					<a href="#none" class="link-btn" <c:if test="${empty result.detailUrl}">data-btn-style="modal" data-btn-key="detail"</c:if> <c:if test="${!empty result.detailUrl}">onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');"</c:if>>
						<span class="category">[<c:out value="${result.menuName}" />]</span>
						<strong class="tit" data-text-style="ellipsis"><c:out value="${result.title}" /></strong>
					</a>
				</li>
			</c:forEach>
		</ul>
		
		<div class="button-area">
			<button type="button" class="more-sub-btn">See more<i class="fas fa-plus"></i></button>
		</div>
	</article>
	
	<article class="list-wrap" data-useragent="M">
		<h3 class="article-tit">Academy Platform</h3>
		<ul class="board-list">
			<c:forEach var="result" items="${resultAcademyList}" varStatus="status">
				<input type="hidden" name="seq" id="seq" value="${result.seq}" />
				<input type="hidden" name="menuId" id="menuId" value="${result.menuId}" />
				<input type="hidden" name="contentsId" id="contentsId" value="${result.contentsId}" />
				<input type="hidden" name="remark" id="remark" value="${result.remark }" /> <!-- etc 데이터  -->
				<input type="hidden" name="fileName" id="fileName" value="${result.fileName}" />
				<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="${result.filePath}" />
				<li>
					<a href="#none" class="link-btn" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');">
						<span class="category">[<c:out value="${result.menuName}" />]</span>
						<strong class="tit" data-text-style="ellipsis"><c:out value="${result.title}" /></strong>
					</a>
				</li>
			</c:forEach>
		</ul>
		
		<div class="button-area">
			<button type="button" class="more-sub-btn">See more<i class="fas fa-plus"></i></button>
		</div>
	</article>
	
	<article class="list-wrap" data-useragent="M">
		<h3 class="article-tit">Registration</h3>
		<ul class="board-list">
			<c:forEach var="result" items="${resultRegistrationList}" varStatus="status">
				<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${result.menuId}'/>" />
				<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
				<input type="hidden" name="remark" id="remark" value="<c:out value='${result.remark }'/>" /> <!-- etc 데이터  -->
				<input type="hidden" name="contents" id="contents" value="<c:out value='${result.contents}'/>" />
				<input type="hidden" name="fileName" id="fileName" value="<c:out value='${result.fileName}'/>" />
				<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="<c:out value='${result.filePath}'/>" />
				<input type="hidden" name="yourHost" id="yourHost" value="<c:out value='${result.lecturer}'/>" />
				<input type="hidden" name="place" id="place" value="<c:out value='${result.place}'/>" />
				<input type="hidden" name="calendar" id="calendar" value="<c:out value='${result.startDate}'/> <c:if test="${empty result.date}">~ <c:out value='${result.endDate}'/></c:if> <c:out value='${result.date}'/>" />
				<input type="hidden" name="webinarUrl" id="webinarUrl" value="<c:out value='${result.contentsUrl}'/>" />
				<li>
					<a href="#none" class="link-btn" data-btn-style="modal" data-btn-key="registration">
						<span class="category">[<c:out value="${result.menuName}" />]</span>
						<strong class="tit" data-text-style="ellipsis"><c:out value="${result.title}" /></strong>
					</a>
				</li>
			</c:forEach>
		</ul>
		
		<div class="button-area">
			<button type="button" class="more-sub-btn">See more<i class="fas fa-plus"></i></button>
		</div>
	</article>
	<!-- [S] 프론트 모바일 컨텐츠 리스트 영역 -->	
</section>

	
<form:form commandName="result" name="detailForm" id="detailForm" method="post">
<input type="hidden" name="seq" id="seq" value="" />
<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
<input type="hidden" name="contentsId" id="contentsId" value="" />
<input type="hidden" name="fileName" id="fileName" value="" />
<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="" />

<div width=0 height=0 style="visibility: hidden">
	<input type="checkbox" class="Lcheckbox" name="checkIndex" id="checkIndex_0" value="0" />
</div>
<!-- [S] 레이어 팝업 : 상세보기 -->
<div class="layerPop-wrap" id="FR010901-10" data-pop-action="disabled">
	<article class="layerPop-area" data-pop-key="detail" data-pop-type="view">
		<header class="layerPop-header">
			<h3 class="layerPop-tit"></h3>
			<p class="layerPop-txt"></p>
			<button type="button" class="layerPop-close-btn" data-pop-btn="close">close<span class="icon-close"></span></button>
		</header>
		<article class="layerPop-contents">
			<span class="img-area"><img src="/resource/images/temp/@img-temp-detail.png" alt="" /></span>
			<ul class="list" data-list-type="content-detail">
				<li data-list-key="fileName">
					<strong class="tit">Name</strong>
					<span class="txt"></span>
				</li>
				<li data-list-key="fileExtension">
					<strong class="tit">Extender</strong>
					<span class="txt"></span>
				</li>
				<li data-list-key="date">
					<strong class="tit">Date</strong>
					<span class="txt"></span>
				</li>
				<li data-list-key="fileSize">
					<strong class="tit">Size</strong>
					<span class="txt"></span>
				</li>
				<li data-list-key="etc">
					<strong class="tit">Etc.</strong>
					<span class="txt"></span>
				</li>
			</ul>
		</article>
		<footer class="layerPop-footer">
			<a href="#" class="layerPop-download-btn" onclick="fnDownloadDetail(0);">DOWNLOAD <i class="fas fa-arrow-down"></i></a>
		</footer>
	</article>
</div>
<!-- [E] 레이어 팝업 -->
</form:form>

<form:form commandName="result" name="registrationForm" id="registrationForm" method="post">
<input type="hidden" name="seq" id="seq" value="" />
<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
<input type="hidden" name="contentsId" id="contentsId" value="" />
<input type="hidden" name="fileName" id="fileName" value="" />
<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="" />
<div width=0 height=0 style="visibility: hidden">
	<input type="checkbox" class="Lcheckbox" name="checkIndex" id="checkIndex_0" value="0" />
</div>
<!-- [S] 레이어 팝업 : 상세보기 -->
<div class="layerPop-wrap" id="FR010901-20" data-pop-action="disabled">
	<article class="layerPop-area" data-pop-key="registration" data-pop-type="view" >
		<header class="layerPop-header">
			<h3 class="layerPop-tit"></h3>
			<p class="layerPop-txt"></p>
			<button type="button" class="layerPop-close-btn" data-pop-btn="close">close<span class="icon-close"></span></button>
		</header>
		<article class="layerPop-contents">
			<span class="img-area"><img src="/resource/images/temp/@img-temp-detail.png" alt="" /></span>
			<ul class="list" data-list-type="content-detail">
				<li data-list-key="yourHost">
					<strong class="tit">YOUR HOST</strong>
					<span class="txt"></span>
				</li>
				<li data-list-key="place">
					<strong class="tit">PLACE</strong>
					<span class="txt"></span>
				</li>
				<li data-list-key="calendar">
					<strong class="tit">CALENDAR</strong>
					<span class="txt"></span>
				</li>
				<li data-list-key="etc">
					<strong class="tit">Etc.</strong>
					<span class="txt"></span>
				</li>
			</ul>
		</article>
		<footer class="layerPop-footer">
			<!-- [2020-09-09] 텍스트 수정 및 i 태그 내 class 명 수정 -->
			<a href="" class="layerPop-download-btn" target="_blank">REGISTER <i class="fas fa-arrow-right"></i></a>
		</footer>
	</article>
</div>
<!-- [E] 레이어 팝업 -->
</form:form>