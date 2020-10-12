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
	document.detailForm.action = "<c:url value='/admin/contents/notice/retrieveContentsList.do'/>";
	document.detailForm.submit();
}
// ]]>
</script>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Notice</h2>
	</header>
	
	<article class="board-wrap" data-board-type="form-list">

		<form:form commandName="result" name="detailForm" method="post" >
			<input type="hidden" id="menuId" name="menuId" value="${MenuInfoInterceptor_menuId}" />
		</form:form>		
		<header class="board-header">
			<em class="category-txt"><c:out value="${result.categoryName}" /></em>
			<h3 class="board-tit"><c:out value="${result.title}" /></h3>
			<span class="date-txt"><c:out value="${result.createDate}" /></span>
		</header>
		
		<article class="board-content">
			<span class="img-area"><img src="/resource/images/temp/@img_notice-view.png" alt="" /></span>
			<p class="board-txt">${result.contents}</p>
		</article>
					
		<div class="submit-area">
			<button type="submit" class="sub-btn" data-offset="left"><i class="fas fa-chevron-left"></i>Previous</button>
			<button type="submit" class="sub-btn" data-offset="left">Next<i class="fas fa-chevron-right"></i></button>
			<button type="submit" class="sub-btn" onclick="fnRetrieveList();"><i class="fas fa-list left"></i>List</button>
			<button type="submit" class="sub-btn">삭제</button>
			<button type="submit" class="main-btn">수정</button>
		</div>
			
	</article>
	
</section>
