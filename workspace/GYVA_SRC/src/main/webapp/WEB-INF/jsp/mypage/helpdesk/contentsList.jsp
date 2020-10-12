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
		<ul class="tab-list" data-combine-tab="column-4-tab">
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0301'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030100', 'list');">Recently viewed</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0303'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030300', 'list');">Profile</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0305'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030500', 'list');">Helpdesk</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0307'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030700', 'list');">Bookmark</a></li>
		</ul>
		
		<article class="list-wrap">
			<header class="list-header">
				<h3 class="article-tit">Helpdesk</h3>
			</header>

			<section class="list-section">
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
					<ul class="sort-list">
						<li <c:if test="${param.stateCode == 'All' or empty param.stateCode}">class="active"</c:if>><button type="button" class="sort-btn" onclick="fnRetrieveList('All');">All</button></li>
						<li <c:if test="${param.stateCode == '01'}">class="active"</c:if>><button type="button" class="sort-btn" onclick="fnRetrieveList('01');">Submitted</button></li>
						<li <c:if test="${param.stateCode == '02'}">class="active"</c:if>><button type="button" class="sort-btn" onclick="fnRetrieveList('02');">Completed</button></li>
					</ul>
					
					<header class="section-header">
						<span data-target-info="no">NO</span>
						<span data-target-info="community">Community</span>
						<span data-target-info="title">Title</span>
						<span data-target-info="date">Date of contact</span>
						<span data-target-info="contact">Contact Status</span>
					</header>
					<ul class="section-content" data-list-type="question-view">
						<!-- [S] 리스트 영역 -->
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<li>
								<!-- [S] 토글 section -->
								<section class="toggle-section" data-type="toggle" data-toggle-action="slide">
									<header class="toggle-header">										                                             
										<span data-target-info="no"><c:out value="${result.num}" /></span>
										<span data-target-info="community"><c:out value="${result.menuName}" /></span>
										<span data-target-info="title"><button type="button" class="toggle-btn"><c:out value="${result.title}" /></button> <a href="#" class="list-sub-btn" onclick="goDetail('<c:out value='${result.menuId}'/>','<c:out value='${result.contentsId}'/>');">See all</a></span>
										<span data-target-info="date"><c:out value="${result.questionDate.substring(0,10)}" /></span>
										<c:if test="${result.stateCode=='01'}"><span data-target-info="contact" data-comment-condition="waiting"></c:if>
										<c:if test="${result.stateCode=='02'}"><span data-target-info="contact" data-comment-condition="completed"></c:if>
											<c:out value="${result.stateName}" />
										</span>										
									</header>
									
									<article class="toggle-content" data-toggle-type="contents">
										<!-- [S] comment -->
										<ul class="comment-list">
											<li>
												<div class="comment-wrap" data-comment-type="certified-instructor">
													<article class="comment-contents">
														<pre class="text-area"><c:out value="${result.questionContents}" /></pre>
													</article>
													<c:if test="${result.stateCode=='02'}">
														<article class="comment-contents" data-comment-condition="reply">
															<pre class="text-area"><c:out value="${result.answerContents}" /></pre>
															<c:if test="${result.readerUserId == userId}">
																<button type="button" class="modify-sub-btn" data-btn-style="modal" data-btn-key="comment" onclick="fnAnswerWrite(<c:out value='${result.seq}'/>, '<c:out value='${result.answerContents}'/>');"></button>
																<button type="button" class="delete-sub-btn" onclick="fnAnswerSave(<c:out value='${result.seq}'/>, 'D');"></button>
															</c:if>
														</article>
													</c:if>
												</div>
											</li>
										</ul>
										<!-- [E] comment -->
									</article>
								</section>
								<!-- [E] 토글 section -->
							</li>
						</c:forEach>
						<!-- [E] 리스트 영역 -->
					</ul>
				</form:form>
			</section>
		</article>
	</div>
	<!-- [E] tab wrap -->
	
</section>



<!-- [S 2020-09-09] 레이어 팝업 : 댓글작성 팝업 -->
<div class="layerPop-wrap" id="FR010505-20" data-pop-action="disabled">
	<article class="layerPop-area" data-pop-key="comment" data-pop-type="comment">
		<form:form commandName="inquiryAnswer" name="answerForm" id="answerForm" method="post">
			<input type="hidden" name="seq" id="seq" value="" />
			<header class="layerPop-header">
				<h3 class="layerPop-tit">1:1 Inquiry Answer</h3>
				<button type="button" class="layerPop-close-btn" data-pop-btn="close">close<span class="icon-close"></span></button>
			</header>
			<article class="layerPop-contents">
				<div class="form" data-mult-form="comment"><textarea class="input-form" name="answerContents" id="answerContents" placeholder="Please enter your answer."></textarea></div>
			</article>
			<footer class="layerPop-footer">
				<button type="button" class="layerPop-main-btn" onclick="fnAnswerSave('', 'S');">Save</button>
				<!-- [2020-09-09] 팝업 소스 삭제 data-pop-btn="delete" -->
				<button type="button" class="layerPop-sub-btn" data-pop-btn="close">Cancel</button>
			</footer>
		</form:form>
	</article>
</div>
<!-- [E] 레이어 팝업 -->