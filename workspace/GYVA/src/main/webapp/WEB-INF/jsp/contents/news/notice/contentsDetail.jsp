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
function fnRetrieveList() {
	document.detailForm.action = "<c:url value='/contents/notice/retrieveContentsList.do'/>";
	document.detailForm.submit();
}
// ]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Notice</h1>
		</div>
	</div>

	<form:form commandName="result" name="detailForm" method="post" >
		<input type="hidden" id="menuId" name="menuId" value="${MenuInfoInterceptor_menuId}" />
	</form:form>

	<div id="LblockBodyMain">

		<div id="LblockDetail01" class="LblockDetail">
			<table summary="<spring:message code="gyva.front.user.detailInfo"/>">
				<caption><spring:message code="gyva.front.user.detailInfo" /></caption>
				<colgroup>
					<col style="width: 20%;" />
					<col style="width: *;" />
					<col style="width: 20%;" />
				</colgroup>
				<tbody>
					<tr>
						<th><c:out value="${result.categoryName}" /></th>
						<td><c:out value="${result.title}" /></td>
						<td><c:out value="${result.createDate}" /></td>
					</tr>
					<tr>
						<td colspan="3">${result.contents}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnRetrieveList();"><span><spring:message code="common.label.list"/></span></a>
	</div>
	
</div>
