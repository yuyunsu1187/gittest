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
	function fnRetrieveList(value) {
		document.listForm.stateCode.value = value;
		document.listForm.action = "<c:url value='/mypage.do'/>";
		document.listForm.submit();
	}
	function fnAnswerWrite(seq, answerContents) {
		document.answerForm.seq.value = seq;
		document.answerForm.answerContents.value = answerContents;	
	}
	function fnAnswerSave(seq, type) {
		if(type=='S') {
			document.listForm.seq.value = document.answerForm.seq.value;
			document.listForm.answerContents.value = document.answerForm.answerContents.value;
		} else {
			document.listForm.seq.value = seq;
		}
		document.listForm.type.value = type;
		document.listForm.action = "<c:url value='/mypage/helpdesk/updateQuestionInfo.do'/>";
		document.listForm.submit();	
	}
	function goDetail(menuId, contentsId) {
		document.listForm.menuId.value = menuId;
		document.listForm.contentsId.value = contentsId;
	   	document.listForm.action = "<c:url value='/contents.do'/>";
	   	document.listForm.submit();
	}
	//]]>
</script>
			
<section id="FR010505-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">My page</h2>
	</header>
	
	<div class="breadcrumb">
		<span class="home">home</span><span class="depth">My page</span><span class="page">Helpdesk</span>
	</div>
	
	<!-- [S] tab wrap -->
	<div class="tab-wrap" data-type="tab" data-tab-division="link">
		<!-- [S] 프론트 모바일 탭 리스트 영역 -->
		<div class="form" data-mult-form="select-list" data-tab-area="tab-list">
			<button type="button" class="select-btn">Helpdesk<i class="fas fa-angle-down"></i></button>
			<ul class="option-list">
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030100', 'list');">Recently viewed</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030300', 'list');">Profile</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030500', 'list');">Helpdesk</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030700', 'list');">Bookmark</a></li>
			</ul>
		</div>
		<!-- [E] 프론트 모바일 탭 리스트 영역 -->
		
		<form:form commandName="resultList" name="listForm" id="listForm" method="post">
			<input type="hidden" name="stateCode" id="stateCode" value="<c:out value='${param.stateCode}'/>" />
			<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />
			<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
			<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
			<input type="hidden" name="readerUserId" id="readerUserId" value="<c:out value='${result.readerUserId}'/>" />
			<input type="hidden" name="seq" id="seq" value="" />
			<input type="hidden" name="type" id="type" value="" />
			<input type="hidden" name="answerContents" id="answerContents" value="" />
			<input type="hidden" name="answerDate" id="answerDate" value="" />
			<!-- [S] 프론트 모바일 컨텐츠 리스트 영역 -->
			<article class="list-wrap" data-useragent="M">
				<ul class="board-list">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<li>
							<a href="#none" class="link-btn" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');">
								<span class="category">[<c:out value="${result.menuName}" />]</span>
								<strong class="tit" data-text-style="ellipsisRow"><c:out value="${result.title}" /></strong>
								<span class="date"><c:out value="${result.questionDate.substring(0,10)}" /></span>
								<c:if test="${result.stateCode=='01'}"><span data-target-info="contact" data-comment-condition="waiting"></c:if>
								<c:if test="${result.stateCode=='02'}"><span data-target-info="contact" data-comment-condition="completed"></c:if>
									<c:out value="${result.stateName}" />
								</span>	
								<i class="fas fa-angle-right"></i>
							</a>
						</li>
					</c:forEach>
				</ul>
			</article>
			<!-- [E] 프론트 모바일 컨텐츠 리스트 영역 -->
		</form:form>
	</div>
	<!-- [E] tab wrap -->	
</section>