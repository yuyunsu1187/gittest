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
	   	document.listForm.action = "<c:url value='/contents/webinarDetail.do'/>";
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
		document.listForm.action = "<c:url value='/contents/webinarWrite.do'/>";
		document.listForm.submit();
	}
	//]]>
</script>
			
<section id="FR070501-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Webinar replay</h2>
	</header>
	
	<div class="breadcrumb">
		<span class="home">home</span><span class="depth">Academy</span><span class="page">Webinar replay</span>
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
				<!-- [2020-09-22] more 버튼 기능 테스트 : data-btn-style="more" 값 추가 -->
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
