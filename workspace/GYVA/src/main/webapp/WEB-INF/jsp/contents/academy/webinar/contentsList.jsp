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
	document.searchForm.action = "<c:url value='/contents/webinar/retrieveContentsList.do'/>";
	document.searchForm.submit();
}
function fnDetail(num) {
	document.searchForm.num.value = num;
   	document.searchForm.action = "<c:url value='/contents/webinar/retrieveContents.do'/>";
   	document.searchForm.submit();
}
//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Webinar replay</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Llast"><span>Webinar replay</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">

		<div id="LblockListTable01" class="LblockListTable" >
			
			<div class="Lwrapper">
				<table summary="Webinar replay" style="font:100%/1.5em Gulim;">
					<caption>Webinar replay</caption>
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
			</div>
		</div>
		</div>

</div>