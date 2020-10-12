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
		
	// 글 리스트 조회
	function fnRetrieveList() {
		document.listForm.action = "<c:url value='/contents.do'/>";
		document.listForm.submit();
	}

	// 해당 파일 다운로드
	function fnDownload(index, contentsId) {
		var app = document.getElementById("append");
		app.innerHTML = "<input type=hidden class=Lcheckbox name=checkIndex id=checkIndex value="+ index +">";

		document.listForm.downloadId.value = contentsId;
		document.listForm.action = "<c:url value='/function/filedownload/downloadFileList.do'/>";
		document.listForm.submit();
	}
	
	// 글 상세 페이지 화면으로 이동
	function goContentsDetail(num) {
		document.listForm.seq.value = num;
		document.listForm.action = "<c:url value='/contents/journalDetail.do'/>";
		document.listForm.submit();
	}

	// 글 작성 화면으로 이동
	function goContentsWrite() {
		document.listForm.action = "<c:url value='/contents/journalWrite.do'/>";
		document.listForm.submit();
	}
	
	function goUpdateContents(num) {
		document.listForm.seq.value = num;
		document.listForm.action = "<c:url value='/contents/journalEdit.do'/>";
		document.listForm.submit();
	}	
	
	//]]>
</script>
			
<section id="FR050101-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Journal</h2>
	</header>
	
	<c:if test="${menuType=='FR'}">
		<div class="breadcrumb">
			<span class="home">home</span><span class="depth">Medical Platform</span><span class="page">Journal</span>
		</div>
	</c:if>
	
	<!-- [S] 썸네일 list -->
	<article class="list-wrap" data-list-type="thumbnail" data-combine-list="column-2-list">
		<form:form commandName="resultList" name="listForm" id="listForm" method="post">
			<input type="hidden" name="seq" id="seq" value="" />
			<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
			<input type="hidden" name="menuType" id="menuType" value="<c:out value='${menuType}'/>" />		
			<input type="hidden" name="downloadId" id="downloadId" value="" />	
			<div id="append"></div>
	
			<ul class="pdf-list" data-list-style="clfix">
				<c:forEach var="result" items="${resultList}" varStatus="status">
				<c:set var="index" value="${status.index}" />
					<li>
					<input type="hidden" name="fileName" value="<c:out value='${result.fileName}'/>" />
					<input type="hidden" name="uploadFilePath" value="<c:out value='${result.filePath}'/>" />
						<div class="img-area">
							<span class="img"><img src="<c:url value='${result.thumFilePath}'/>" onerror="this.src='/resource/images/common/contents/defaultimg_340x438.png';" alt="" /></span>
							<div class="caption">
								<span class="txt" data-text-style="ellipsisRow"><c:out value="${result.contents}" /></span>
								<strong class="tit"><span data-text-style="ellipsisRow"><c:out value="${result.title}" /></span></strong>
							</div>
							<c:if test="${menuType=='FR'}">
								<c:choose>
								    <c:when test="${empty result.contentsUrl}">									
										<a href="#none" class="sub-btn" onclick="goContentsDetail(<c:out value='${result.seq}'/>)">See more<i class="fas fa-plus"></i></a>
								    </c:when>
								    <c:otherwise>
										<a href="${result.contentsUrl}" target="_blank" class="sub-btn" >See more<i class="fas fa-plus"></i></a>
								    </c:otherwise>
								</c:choose>
							</c:if>
							<c:if test="${menuType=='AD'}">
								<a href="#none" class="sub-btn" onclick="goUpdateContents(<c:out value='${result.seq}'/>)">See more<i class="fas fa-plus"></i></a>
							</c:if>
						</div>
					</li>
				</c:forEach>
			</ul>
				
			<div class="button-area">
				<button type="button" class="more-sub-btn" data-btn-style="more">See more<i class="fas fa-plus"></i></button>
			</div>				
					
			<c:if test="${menuType=='AD'}">
				<div class="submit-area">
					<button type="submit" class="main-btn" onclick="goContentsWrite()">등록</button>
				</div>
			</c:if>
		</form:form>
	</article>
	<!-- [E] 썸네일 list -->
	
</section>
