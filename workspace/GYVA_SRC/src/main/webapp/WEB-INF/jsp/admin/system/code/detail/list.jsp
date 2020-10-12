<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%---------------------------------------------------------
    파일명 : codeList.jsp
    프로젝트명 : 이브아르 아카데미 프로젝트

    Copyright(c) 2012 LG CNS,  All rights reserved.

    설 명 : 본 화면은 코드 정보를 조회하는 목록 화면입니다.
    작성자 : XXX팀 OOO
-------------------------------------------------------------%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script type="text/javaScript" language="javascript">
	// <![CDATA[
	function fnDetail(groupId, code) {
	    document.listForm.groupId.value = groupId;
	    document.listForm.code.value = code;
		document.listForm.action = "<c:url value='/admin/system/detailCodeDetail.do'/>";
		document.listForm.submit();
	}
	
	// 글 작성 화면으로 이동
	function fnWrite() {
		document.listForm.action = "<c:url value='/admin/system/detailCodeForm.do'/>";
		document.listForm.submit();
	}
	// ]]>
</script>
			
<section id="AD070301-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">상세코드관리</h2>
	</header>
	
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
		<!-- 리스트 노출 개수는 최대 20줄 -->
		<div class="board-area">
			<form:form commandName="resultList" name="listForm" id="listForm" method="post" onsubmit="fnWrite();">
				<input type="hidden" name="groupId" id="groupId" value="" />
				<input type="hidden" name="code" id="code" value="" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
				<table class="default-table">
					<caption>상세코드관리 리스트</caption>
					<colgroup>
						<col style="width:30%;" />
						<col style="width:10%;" />
						<col style="width:10%;" />
						<col style="width:auto;" />
						<col style="width:10%;" />
					</colgroup>
					
					<thead>
						<tr>
							<th scope="row">상세 코드명</th>
							<th scope="row">그룹ID</th>
							<th scope="row">상세 ID</th>
							<th scope="row">설명</th>
							<th scope="row">사용여부</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td data-text-style="ellipsis"><a href="javascript:fnDetail('<c:out value="${result.groupId}"/>', '<c:out value="${result.code}"/>')"><c:out value="${result.codeName}" /></a></td>
								<td><c:out value="${result.groupId}" /></td>
								<td><c:out value="${result.code}" /></td>
								<td><c:out value="${result.description}" /></td>
								<td><c:out value="${result.useYn}" /></td>
							</tr>
						</c:forEach>
						
						<!-- 검색결과가 값이 없을 때 -->
						<c:if test="${empty resultList && !empty input}">
							<tr>
								<td colspan="5" data-td-type="board-noData">등록된 코드가 없습니다</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				
				<div class="button-area">
					<button type="button" class="more-sub-btn" data-btn-style="boardMore">See more<i class="fas fa-plus"></i></button>
				</div>
							
				<div class="submit-area">
					<button type="submit" class="main-btn">등록</button>
				</div>
			</form:form>
		</div>
	</article>
	<!-- [E] 게시물 리스트 -->
</section>
