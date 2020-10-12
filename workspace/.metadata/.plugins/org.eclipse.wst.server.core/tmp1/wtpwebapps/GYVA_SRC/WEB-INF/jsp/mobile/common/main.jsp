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
	function fnDetail(menuId, contentsId, categoryCode) {
		document.listForm.menuId.value = menuId;
		document.listForm.contentsId.value = contentsId;
		document.listForm.categoryCode.value = categoryCode;
		document.listForm.action = "<c:url value='/contentsDetail.do'/>";
		document.listForm.submit();
	}		
	//]]>
</script>

		
<!-- [S] contents -->
<section class="content-section">
	<div class="visual-wrap" data-type="swiper" data-swiper-option="visual">
		<div class="swiper-container">
			<ul class="swiper-wrapper">
				<li class="swiper-slide">
					<div class="text-area">
						<h3 class="visual-tit">LG Aesthetics<br />Medical Platform<sub>TM</sub></h3>
						<p class="visual-txt">is an online platform that aims to enlighten<br />distinguished healthcare professionals<br />about advanced aesthetic treatment,<br/>and a place that allows boundless experience<br />of LG aesthetics brands.</p>
					</div>
					<span class="img-area"><img src="/resource/images/mobile/contents/img-main-visual-01.jpg" alt="" /></span>
				</li>
			</ul>

			<div class="swiper-pagination"></div>
		</div>
	</div>
	
	<div class="post-wrap">
		<article class="post-board">
			<header class="post-header">
				<h3 class="post-tit">REGISTRTION</h3>
				<a href="#" class="link-btn" onclick="fnMenu('FR110000', 'list');">more<i class="fas fa-plus"></i></a>
			</header>
			
			<div class="post-content" data-type="swiper" data-swiper-option="navigation">
				<div class="swiper-container">
					<ul class="swiper-wrapper">
						<c:forEach var="result" items="${resultRegistrtionList}" varStatus="status">
						<c:set var="index" value="${status.index}" />
							<li class="swiper-slide">
								<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq }'/>" />
								<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId }'/>" />
								<input type="hidden" name="remark" id="remark" value="<c:out value='${result.remark }'/>" />
								<input type="hidden" name="contents" id="contents" value="<c:out value='${result.contents}'/>" />
								<input type="hidden" name="fileName" id="fileName" value="<c:out value='${result.fileName}'/>" />
								<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="<c:url value='${result.filePath}'/>" />
								<input type="hidden" name="yourHost" id="yourHost" value="<c:out value='${result.lecturer}'/>" />
								<input type="hidden" name="place" id="place" value="<c:out value='${result.place}'/>" />
								<input type="hidden" name="calendar" id="calendar" value="<c:out value='${result.startDate}'/> <c:if test="${empty result.date}">~ <c:out value='${result.endDate}'/></c:if> <c:out value='${result.date}'/>" />
								<input type="hidden" name="webinarUrl" id="webinarUrl" value="<c:out value='${result.contentsUrl}'/>" />
								<div class="img-area">
									<a href="#none" class="link-btn"><img src="<c:url value='${result.thumFilePath}'/>" alt="" /></a>
									<div class="caption">
										<strong class="tit" data-text-style="ellipsis"><c:out value="${result.title}" /></strong>
										<span class="host" data-text-style="ellipsis"><c:out value="${result.lecturer}" /></span>
										<span class="date"><c:out value='${result.startDate}'/> <c:if test="${empty result.date}">~ <c:out value='${result.endDate}'/></c:if> <c:out value='${result.date}'/></span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</div>
		</article>
		
		<article class="post-thumbnail">
			<header class="post-header">
				<!-- [2020-09-25] 타이틀명 변경 --> 
				<h3 class="post-tit">ACADEMY PLATFORM</h3>
				<a href="#" class="link-btn" onclick="fnMenu('FR090100', 'list');">more<i class="fas fa-plus"></i></a>
			</header>
			
			<div class="post-content">
				<div class="thumbnail-list" data-type="swiper" data-swiper-option="thumbnail">
					<div class="swiper-container">
						<ul class="swiper-wrapper">
							<c:forEach var="result" items="${resultAcademyList}" varStatus="status">
							<c:set var="index" value="${status.index}" />
							<li class="swiper-slide">
								<a href="#none" class="link-btn" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');">
									<img src="<c:url value='${result.thumFilePath}'/>" alt="" />
									<div class="caption" data-text-style="ellipsis">
										<strong class="tit"><c:url value='${result.title}'/></strong>
										<span class="txt">/ <c:url value='${result.menuName}'/></span>
									</div>
								</a>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>

<form:form commandName="resultList" name="listForm" id="listForm" method="post">
	<input type="hidden" name="menuId" id="menuId" value="" />
	<input type="hidden" name="contentsId" id="contentsId" value="" />
	<input type="hidden" name="categoryCode" id="categoryCode" value="" />
</form:form>
<!-- [E] contents -->