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
	function fnDetail(contentsId) {
		document.listForm.contentsId.value = contentsId;
	   	document.listForm.action = "<c:url value='/contents/exerciseDetail.do'/>";
	   	document.listForm.submit();
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
	function goContentsWrite() {
		document.listForm.action = "<c:url value='/contents/exerciseWrite.do'/>";
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
			
<section id="FR071101-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">YVOIRE Exercise</h2>
	</header>
	
	<div class="breadcrumb">
		<span class="home">home</span><span class="depth">Academy</span><span class="page">YVOIRE Exercise</span>
	</div>
	
	<!-- [S] 썸네일 list -->
	<article class="list-wrap" data-list-type="thumbnail" data-combine-list="column-1-list">
		<form:form commandName="resultList" name="listForm" id="listForm" method="post">
			<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />
			<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
			<input type="hidden" name="contentsId" id="contentsId" value="" />
			<ul class="thumbnail-list" data-list-style="clfix">
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<li>						
						<a href="#none" class="link-btn" onclick="fnDetail(<c:out value='${result.contentsId}'/>);">
							<div class="img-area">
								<span class="img"><img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_390x220.png';" alt="" /></span>
								<div class="caption">
									<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.title}" /></strong>
									<span class="txt" data-text-style="ellipsisRow03"><c:out value="${result.contents}" /></span>
									<span class="date"><c:out value="${result.createDate}" /></span>
									<div class="keywordTag-area">
										<span class="txt" data-text-style="ellipsis"><c:out value="${result.keyword1}" /></span>
										<span class="txt" data-text-style="ellipsis"><c:out value="${result.keyword2}" /></span>
									</div>
									<div class="profile">
										<span class="img"><img src="<c:url value='${result.lecturerImgPath}'/>" /></span>
										<div class="text-area">
											<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.lecturerName}" /></strong>
											<div class="txt" data-text-style="ellipsisRow03"><c:out value="${result.career1}" /></div>
										</div>
									</div>
								</div>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		
			<div class="button-area">
				<button type="button" class="more-sub-btn" data-btn-style="more">See more<i class="fas fa-plus"></i></button>
			</div>
						
			<c:if test="${menuType=='AD'}">
				<div class="submit-area">
					<button type="button" class="main-btn" onclick="goContentsWrite()">등록</button>
				</div>
			</c:if>
		</form:form>
	</article>
	<!-- [E] 썸네일 list -->
	
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
<div class="layerPop-wrap" id="FR071101-10" data-pop-action="disabled">
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