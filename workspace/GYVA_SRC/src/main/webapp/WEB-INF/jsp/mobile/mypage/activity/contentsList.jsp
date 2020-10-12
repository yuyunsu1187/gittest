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
	
	<!-- [S] tab wrap -->
	<div class="tab-wrap" data-type="tab" data-tab-division="link">
		<!-- [S] 프론트 모바일 탭 리스트 영역 -->
		<div class="form" data-mult-form="select-list" data-tab-area="tab-list">
			<button type="button" class="select-btn">Recently viewed<i class="fas fa-angle-down"></i></button>
			<ul class="option-list">
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030100', 'list');">Recently viewed</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030300', 'list');">Profile</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030500', 'list');">Helpdesk</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030700', 'list');">Bookmark</a></li>
			</ul>
		</div>
		<!-- [E] 프론트 모바일 탭 리스트 영역 -->
		
		<article class="list-wrap" data-list-type="thumbnail" data-combine-list="column-4-list">
			<form:form commandName="resultScientificList" name="scientificForm" id="scientificForm" method="post">
				<input type="hidden" name="seq" id="seq" value="" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
				<input type="hidden" name="menuType" id="menuType" value="<c:out value='${menuType}'/>" />				
				<input type="hidden" name="fileId" id="fileId" value="" />
				<div id="append"></div>
				<h3 class="article-tit">Scientific Data</h3>
				
				<ul class="board-list">
					<c:forEach var="result" items="${resultScientificList}" varStatus="status">
						<c:set var="index" value="${status.index}" />
						<li>
							<input type="hidden" name="fileName" value="<c:out value='${result.fileName}'/>" />
							<input type="hidden" name="uploadFilePath" value="<c:url value='${result.filePath}'/>" />
							<a href="#none" class="link-btn" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');" >
								<strong class="tit" data-text-style="ellipsisRow"><c:out value='${result.title}'/></strong>
								<div class="keywordTag-area">
									<span class="txt" data-text-style="ellipsis"><c:out value="${result.keyword1}" /></span>
									<span class="txt" data-text-style="ellipsis"><c:out value="${result.keyword2}" /></span>
								</div>
								<i class="fas fa-angle-right"></i>
							</a>
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
				<ul class="board-list">
					<c:forEach var="result" items="${resultAnatomyList}" varStatus="status">
						<li>
							<a href="#none" class="link-btn" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');">
								<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.title}" /></strong>
								<span class="name"><c:out value="${result.lecturerName}" /></span>
								<i class="fas fa-angle-right"></i>
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
				<ul class="board-list">
					<c:forEach var="result" items="${resultInjectionList}" varStatus="status">
						<li>
							<a href="#none" class="link-btn" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');">
								<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.title}" /></strong>
								<span class="name"><c:out value="${result.lecturerName}" /></span>
								<i class="fas fa-angle-right"></i>
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
				<<ul class="thumbnail-list" data-list-style="clfix" data-useragent="common">
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
