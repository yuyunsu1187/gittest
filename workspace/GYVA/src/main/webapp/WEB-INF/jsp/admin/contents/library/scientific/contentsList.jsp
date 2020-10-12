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
function fnRetrieveList() {
	document.searchForm.action = "<c:url value='/admin/contents/scientific/retrieveContentsList.do'/>";
	document.searchForm.submit();
}
function fnDetail(num) {
	document.searchForm.num.value = num;
   	document.searchForm.action = "<c:url value='/admin/contents/scientific/retrieveContents.do'/>";
   	document.searchForm.submit();
}

// 글 작성 화면으로 이동
function goContentsWrite() {
	document.listForm.action = "<c:url value='/admin/contents/library/scientific/contentsWrite.do'/>";
	document.listForm.submit();
}
//]]>
</script>

<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Scientific Data</h2>
	</header>
	
	<article class="board-wrap" data-board-type="form-list">
		<div class="board-area">
		
			<form:form commandName="resultList" name="listForm" id="listForm" method="post">
				<input type="hidden" name="seq" id="seq" value="" />
				<input type="hidden" name="menuId" id="menuId" value="${param.menuId}" />
			<table summary="Scientific Data" style="font:100%/1.5em Gulim;">
				<caption>Scientific Data</caption>
				<thead>
					<tr>
						<th class="Lfirst"><spring:message code="gyva.front.user.num" /></th>
						<th><spring:message code="gyva.front.user.name" /></th>
						<th><spring:message code="gyva.front.user.joblevel" /></th>
						<th><spring:message code="gyva.front.user.skill" /></th>
						<th class="Llast"><spring:message code="gyva.front.user.birthdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="Lfirst">		
							<td class="Lfirst"><c:out value="${result.fileExtension}" /></td>
							<td><c:out value="${result.title}" /></td>
							<td><c:out value="${result.contents}" /></td>
							<td><c:out value="${result.createDate}" /></td>
							<td class="Llast"><c:out value="${result.fileSize}" /></td>
						</tr>
					</c:forEach>
					<c:if test="${empty resultList && !empty input}">
						<tr id="empty" style="background-color: #FFFFFF">
							<td colspan="5"><spring:message code="dev.inf.com.nodata" /></td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div>				
				<input type="button" value="Contents 작성" onclick="goContentsWrite();" />
			</div>
			</form:form>
			
		</div>
	</article>
	
</section>