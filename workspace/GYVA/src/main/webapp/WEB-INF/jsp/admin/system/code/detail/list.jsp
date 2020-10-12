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
function fncRetrieveCodeList() {
	document.pForm.action = "<c:url value='/common/code/retrieveCodeList.do'/>";
	document.pForm.submit();
}
function fncRetrieveCode(code, codeGroup) {
	document.pForm.mode.value = "update";
	document.pForm.code.value = code;
	document.pForm.codeGroup.value = codeGroup;
   	document.pForm.action = "<c:url value='/common/code/retrieveCode.do'/>";
   	document.pForm.submit();
}
function fncRetrieveCodeForm() {
	document.pForm.mode.value = "insert";
	document.pForm.action = "<c:url value='/common/code/retrieveCodeForm.do'/>";
	document.pForm.submit();
}
function checkMessage() {
	if("${param.msg}" == "success") {
		alert("<spring:message code="common.message.processSuccess"/>");
	}
}
// ]]>
</script>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">상세코드관리</h2>
	</header>
	
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
		<!-- 리스트 노출 개수는 최대 20줄 -->
		<div class="board-area">
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
					<tr>
						<td data-text-style="ellipsis"><a href="#none" class="link-btn">관리자 그룹의 슈퍼 관리자 코드</a></td>
						<td>AD</td>
						<td>SU</td>
						<td>관리자 관리를 위한 그룹코드</td>
						<td>Y</td>
					</tr>
					
					<tr>
						<td data-text-style="ellipsis"><a href="#none" class="link-btn">관리자 그룹의 슈퍼 관리자 코드</a></td>
						<td>AD</td>
						<td>SU</td>
						<td>관리자 관리를 위한 그룹코드</td>
						<td>Y</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="button-area">
			<button type="button" class="sub-btn" data-btn-style="add-list">더보기<i class="fas fa-plus"></i></button>
		</div>
					
		<div class="submit-area">
			<button type="submit" class="main-btn" onclick="fncRetrieveCodeForm();">등록</button>
		</div>
	</article>
	<!-- [E] 게시물 리스트 -->
</section>
