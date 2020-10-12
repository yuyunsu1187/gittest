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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script type="text/javascript" language="javascript">
//<![CDATA[

	function fnRetrieveList() {
		document.listForm.action = "<c:url value='/contents.do'/>";
		document.listForm.submit();
	}
	
	// 파일 다운로드
	function fnDownloadDetail(index) {
		
		$("input:checkbox[name=checkIndex]").prop("checked", false);	
		$("input:checkbox[id=checkIndex_"+index+"]").prop("checked", true);	
		
		document.detailForm.action = "<c:url value='/function/filedownload/downloadFileList.do'/>";
		document.detailForm.submit();
	}
	
	//글 수정 화면으로 이동
	function goUpdateContents() {
		document.detailForm.action = "<c:url value='/contents/registrationEdit.do'/>";
		document.detailForm.submit();
	}
	
	// 글 작성 화면으로 이동
	function goContentsWrite() {
		document.listForm.action = "<c:url value='/contents/registrationWrite.do'/>";
		document.listForm.submit();
	}
	
	//글 삭제
	function fnDeleteContents() {
		var delConfirm = confirm('정말로 삭제 하시겠습니까?');
		if (delConfirm) {
			document.detailForm.action = "<c:url value='/contents/registrationDelete.do'/>";
			document.detailForm.submit();
		}
	}
	//지난 이벤트 종료 메시지 
	function fnMessage() {
		alert('This event has ended.');
	}
//]]>

</script>


<section id="FR090301-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Registration</h2>
	</header>
	<!-- 현재 시간값 jsp 세팅 -->
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
	
	<form:form commandName="resultList" name="listForm" id="listForm" method="post">
	<input type="hidden" id="seq" name="seq" />
	<input type="hidden" id="contentsId" name="contentsId" />
	<input type="hidden" id="menuId" name="menuId" value="<c:out value='${menuId}'/>" />
	<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />

	<c:if test="${menuType=='FR'}">
		<div class="breadcrumb">
			<span class="home">home</span><span class="depth">Registration</span>
		</div>
	</c:if>
	
	<!-- [S] 썸네일 list : 스와이프 - 스크롤바 -->
	<article class="list-wrap" data-list-type="thumbnail" data-type="swiper" data-swiper-option="scrollbar">
		<h3 class="article-tit">Upcoming Event</h3>
		<div class="swiper-container">
			<ul class="swiper-wrapper">
			<c:forEach var="result" items="${resultList}" varStatus="status">
			
			<c:set var="endDt" value="${fn:substring(result.endDate,0,19)}"/>
				<c:if test="${today <= endDt }">
					<li class="swiper-slide">
						<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>" />
						<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
						<input type="hidden" name="remark" id="remark" value="<c:out value='${result.remark }'/>" /> <!-- etc 데이터  -->
						<input type="hidden" name="contents" id="contents" value="<c:out value='${result.contents}'/>" />
						<input type="hidden" name="fileName" id="fileName" value="<c:out value='${result.fileName}'/>" />
						<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="<c:out value='${result.filePath}'/>" />
						<input type="hidden" name="yourHost" id="yourHost" value="<c:out value='${result.lecturer}'/>" />
						<input type="hidden" name="place" id="place" value="<c:out value='${result.place}'/>" />
						<input type="hidden" name="calendar" id="calendar" value="<c:out value='${result.startDate}'/> <c:if test="${empty result.date}">~ <c:out value='${result.endDate}'/></c:if> <c:out value='${result.date}'/>" />
						<input type="hidden" name="webinarUrl" id="webinarUrl" value="<c:out value='${result.contentsUrl}'/>" />
					
						<button type="button" class="link-btn" data-btn-style="modal" data-btn-key="detail">
							<figure class="img-area">
								<!-- <img src="/resource/images/temp/@img-temp-event-list.png" alt="" /> -->
								<img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_378x260.png';" alt="" />
								<figcaption class="caption"><strong class="tit" data-text-style="ellipsisRow"><c:out value='${result.title}'/></strong></figcaption>
							</figure>
						</button>
					</li>
				</c:if>
			</c:forEach>
			</ul>
			<div class="swiper-scrollbar"></div>
			<!-- [S] 모바일에 적용되는 마크업 -->
			<div class="swiper-pagination"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<!-- [E] 모바일에 적용되는 마크업 -->
		</div>
	</article>
	<!-- [E] 썸네일 list -->
	
	<!-- [S] 썸네일 list : 지난이벤트 data- 설정 [data-list-style="dim"] -->
	<article class="list-wrap" data-list-type="thumbnail" data-list-style="dim" data-type="swiper" data-swiper-option="scrollbar">
		<h3 class="article-tit">past Event</h3>
		<div class="swiper-container">
			<ul class="swiper-wrapper">
			<c:forEach var="result" items="${resultList}" varStatus="status">
			
			<c:set var="endDt" value="${fn:substring(result.endDate,0,19)}"/>
			<c:if test="${today > endDt }">
				<li class="swiper-slide">
					<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>" />
					<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
					<input type="hidden" name="remark" id="remark" value="<c:out value='${result.remark }'/>" /> <!-- etc 데이터  -->
					<input type="hidden" name="contents" id="contents" value="<c:out value='${result.contents}'/>" />
					<input type="hidden" name="fileName" id="fileName" value="<c:out value='${result.fileName}'/>" />
					<input type="hidden" name="uploadFilePath" id="uploadFilePath" value="<c:out value='${result.filePath}'/>" />
					<input type="hidden" name="yourHost" id="yourHost" value="<c:out value='${result.lecturer}'/>" />
					<input type="hidden" name="place" id="place" value="<c:out value='${result.place}'/>" />
					<input type="hidden" name="calendar" id="calendar" value="<c:out value='${result.startDate}'/> <c:if test="${empty result.date}">~ <c:out value='${result.endDate}'/></c:if> <c:out value='${result.date}'/>" />
					<input type="hidden" name="webinarUrl" id="webinarUrl" value="<c:out value='${result.contentsUrl}'/>" />
					
					<c:if test="${menuType=='AD'}">
					
					<button type="button" class="link-btn" data-btn-style="modal" data-btn-key="detail">
						<figure class="img-area">
							<!-- <img src="/resource/images/temp/@img-temp-event-list.png" alt="" /> -->
							<img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_378x260.png';" alt="" />
							<figcaption class="caption"><strong class="tit" data-text-style="ellipsisRow"><c:out value='${result.title}'/></strong></figcaption>
						</figure>
					</button>
					</c:if>
					<c:if test="${menuType!='AD'}">
					<button type="button" class="link-btn" data-btn-style="modal" onclick="fnMessage()" >
						<figure class="img-area">
							<!-- <img src="/resource/images/temp/@img-temp-event-list.png" alt="" /> -->
							<img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_378x260.png';" alt="" />
							<figcaption class="caption"><strong class="tit" data-text-style="ellipsisRow"><c:out value='${result.title}'/></strong></figcaption>
						</figure>
					</button>
					</c:if>
					</li>
				</c:if>
			</c:forEach>			
			</ul>
			<div class="swiper-scrollbar"></div>
			<!-- [S] 모바일에 적용되는 마크업 -->
			<div class="swiper-pagination"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<!-- [E] 모바일에 적용되는 마크업 -->
		</div>
		
		<c:if test="${menuType=='AD'}">			
			<div class="submit-area">
				<button type="submit" onclick="goContentsWrite()" class="main-btn">등록</button>
			</div>
		</c:if>
	</article>
	<!-- [E] 썸네일 list  -->
	</form:form>
		
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
<div class="layerPop-wrap" id="FR090301-10" data-pop-action="disabled">
	<article class="layerPop-area" data-pop-key="detail" data-pop-type="view" >
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
			<a href="https://www.naver.com" class="layerPop-download-btn" target="_blank">REGISTER <i class="fas fa-arrow-right"></i></a>
			
			<c:if test="${menuType=='AD'}">
				<div class="submit-area">
					<button type="button" class="sub-btn" onclick="fnDeleteContents();">삭제</button>
					<button type="submit" class="main-btn" onclick="goUpdateContents();">수정</button>
				</div>
			</c:if>
		</footer>
	</article>
</div>
<!-- [E] 레이어 팝업 -->
</form:form>