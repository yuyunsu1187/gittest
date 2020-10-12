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
		
	// Contents 리스트 조회
	function fnRetrieveList() {
		document.listForm.action = "<c:url value='/contents/journal/retrieveContentsList.do'/>";
		document.listForm.submit();
	}

	// 해당 파일 다운로드
	function fnDownload(index) {
		var app = document.getElementById("append");
		app.innerHTML = " : <input type=hidden class=Lcheckbox name=checkIndex id=checkIndex value="+ index +"><br>";

		document.listForm.action = "<c:url value='/function/filedownload/downloadFileList.do'/>";
		document.listForm.submit();
	}

	// 글 상세 페이지 화면으로 이동
	function goContentsDetail(num) {
		document.listForm.seq.value = num;
		document.listForm.action = "<c:url value='/contents/journal/retrieveContents.do'/>";
		document.listForm.submit();
	}

	// 글 작성 화면으로 이동
	function goContentsWrite() {
		document.listForm.action = "<c:url value='/admin/contents/library/journal/contentsWrite.do'/>";
		document.listForm.submit();
	}
	
	// 새창 링크 호출
	function goContentsUrl(target) {
		window.open(target, "new", "toolbar=0,location=0,menubar=0");
	}
	
	//]]>
</script>

<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Journal</h2>
	</header>
	
	<article class="board-wrap" data-board-type="form-list">
		<div class="board-area">
		
			<form:form commandName="resultList" name="listForm" id="listForm" method="post">
				<input type="hidden" name="seq" id="seq" value="" />
				<input type="hidden" name="menuId" id="menuId" value="${param.menuId}" />
				<table summary="Journal" style="font:100%/1.5em Gulim;">
					<caption>Journal</caption>
					<tbody>

						<c:forEach var="result" items="${resultList}" varStatus="status">
							<c:set var="index" value="${status.index}" />
								<c:if test='${index % 2 == 0}' >
									<tr class="Lfirst">
									<td class="Lfirst">
										<c:out value="${result.contents}" /><br> 
										<c:out value="${result.title}" /><br> 
										<c:out value="${result.thumFilePath}" /><br>
										<c:out value="${result.contentsUrl}" /><br>
										<c:choose>
										    <c:when test="${empty result.contentsUrl}">
												<button type="button" class="journal_detail" onclick="goContentsDetail(${result.seq})" style="cursor:hand">See more</button>
										    </c:when>
										    <c:otherwise>
											<button type="button" class="journal_detail" onclick="goContentsUrl('${result.contentsUrl}')" style="cursor:hand">See more</button>
										    </c:otherwise>
										</c:choose>
									</td>
								</c:if>
								<c:if test='${index % 2 == 1}' >
									<td class="Lfirst">
										<c:out value="${result.contents}" /><br> 
										<c:out value="${result.title}" /><br> 
										<c:out value="${result.thumFilePath}" /><br>
										<c:out value="${result.contentsUrl}" /><br>
										<c:choose>
										    <c:when test="${empty result.contentsUrl}">
												<button type="button" class="journal_detail" onclick="goContentsDetail(${result.seq})" style="cursor:hand">See more</button>
										    </c:when>
										    <c:otherwise>
												<button type="button" class="journal_detail" onclick="goContentsUrl('${result.contentsUrl}')" style="cursor:hand">See more</button>
										    </c:otherwise>
										</c:choose>
									</tr>
									</td>
								</c:if>
						</c:forEach>

						<c:if test="${empty resultList && !empty input}">
							<tr id="empty" style="background-color: #FFFFFF">
								<td colspan="5"><spring:message code="dev.inf.com.nodata" /></td>
							</tr>
						</c:if>		
					</tbody>
					<input type="button" value="Contents 작성" onclick="goContentsWrite()" />
				</table>
			</form:form>
			
		</div>
	</article>
	
</section>