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
	function fnDownload() {
		document.listForm.action = "<c:url value='/admin/contents/result/downloadResultDetail.do'/>";
		document.listForm.submit();	
	}
// ]]>
</script>
			
<section id="AD050903-10" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">설문결과</h2>
	</header>
	
	<!-- [S] 게시물 보기 --> 
	<article class="board-wrap" data-board-type="form-view">
		<header class="board-header" data-board-header="download">
			<em class="category-txt"><c:out value="${detail.menuName}" /></em>
			<h3 class="board-tit"><c:out value="${detail.title}" /></h3>
			<a href="#none" class="download-main-btn" onclick="fnDownload();return false">다운로드<i class="fas fa-arrow-down"></i></a>
		</header>
		
		<form:form commandName="resultList" name="listForm" id="listForm" method="post">
			<input type="hidden" name="surveyId" id="surveyId" value="<c:out value='${param.surveyId}'/>" />
			<input type="hidden" name="surveyMenuId" id="surveyMenuId" value="<c:out value='${param.surveyMenuId}'/>" />
			<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${param.contentsId}'/>" />
			<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
			
			<ul class="board-content" data-list-type="question-view">
				<c:forEach var="result" items="${resultList}" varStatus="status">
				<!-- 리스트 노출 개수는 최대 20줄 -->
				<li>
					<!-- [S] 토글 section -->
					<section class="toggle-section" data-type="toggle" data-toggle-action="slide">
						<header class="toggle-header">
							<button type="button" class="toggle-btn">
								<span data-target-info="id"><c:out value="${result.email}" /></span>
								<span data-target-info="name"><c:out value="${result.userName}" /></span>
								<span data-target-info="country"><c:out value="${result.country}" /></span>
								<span data-target-info="city"><c:out value="${result.specialty}" /></span>
							</button>
						</header>
						
						<article class="toggle-content" data-toggle-type="contents">
							<ol class="list-area">
								<li>
									<div class="question"><c:out value="${result.question1}" /></div>
									<div class="answer"><c:out value="${result.answer1}" /></div>
								</li>
								
								<li>
									<div class="question"><c:out value="${result.question2}" /></div>
									<div class="answer"><c:out value="${result.answer2}" /></div>
								</li>
								
								<li>
									<div class="question"><c:out value="${result.question3}" /></div>
									<div class="answer"><c:out value="${result.answer3}" /></div>
								</li>
								
								<li>
									<div class="question"><c:out value="${result.question4}" /></div>
									<div class="answer"><c:out value="${result.answer4}" /></div>
								</li>
								
								<li>
									<div class="question"><c:out value="${result.question5}" /></div>
									<div class="answer"><c:out value="${result.answer5}" /></div>
								</li>
							</ol>
						</article>
					</section>
					<!-- [E] 토글 section -->
				</li>
				</c:forEach>
			</ul>
			
			<div class="button-area">
				<button type="button" class="sub-btn" data-btn-style="add-list">더보기<i class="fas fa-plus"></i></button>
			</div>
		</form:form>
	</article>
	<!-- [E] 게시물 보기 -->
</section>