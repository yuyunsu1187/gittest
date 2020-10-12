<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * LG Chem YVOIRE Academy JSP
 * NAME : contentsUpdate.jsp
 * DESC : 컨텐츠 업데이트 페이지 
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


<html>
<head>
<title>scientific Contents 수정 화면</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javaScript" language="javascript">
//<![CDATA[
	
	// 필수 입력정보인 확인 함수
	function checkValue() {

		if (!document.contentsInfo.title.value) {
			alert("title를 입력하세요.");
			return false;
		}

 		if (!document.contentsInfo.uploadFile_1.value) {
			alert("썸네일 이미지를 등록하세요.");
			return false;
		}

		if (!document.contentsInfo.uploadFile_2.value) {
			alert("업로드 할 파일을 등록하세요.");
			return false;
		} 

	}

	// 삭제
	function fnDeleteContents() {
		document.contentsInfo.action = "<c:url value='/admin/contents/library/scientific/deleteContents.do'/>";
		document.contentsInfo.submit();
	}
	
	// 취소
	function goBack(){
		window.history.back();
	}

	
	// ]]>
</script>
<%
String menuId = (String) request.getAttribute("menuId");
%>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Scientific Data</h2>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/admin/contents/library/scientific/updateContents.do" name="contentsInfo" id="contentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input type="hidden" name="seq" id="seq" value="${contentsResult.seq}" />
				<input type="hidden" name="contentsId" id="contentsId" maxlength="50" value="${contentsResult.contentsId}"/>
				<input type="hidden" name="menuId" id="menuId" maxlength="50" value="${contentsResult.menuId}"/>
				<input type="hidden" name="stateCode" id="stateCode" maxlength="50" value="${contentsResult.stateCode}"/>
	
				<table class="default-table">
					<caption>Scientific Data 입력</caption>
					<colgroup>
						<col style="width:30%;" />
						<col style="width:auto;" />
					</colgroup>
					
					<tbody>	
						<tr>
							<th scale="col" data-text-style="essential">제목</th>
							<td>
								<input type="text" name="title" id="title" maxlength="50" value="${contentsResult.title}" placeholder ="Enter title" >
							</td>
						</tr>
						
						<tr>
							<th id="title">안내문구 </td>
							<td>
								<input type="text" name="contents" id="contents" maxlength="50" value="${contentsResult.contents}" placeholder ="Enter contents" >
							</td>
						</tr>
						
						<tr>
							<thid="title">썸네일 이미지</td>
							<td>
								${contentsResult.thumFileName} <input type="file" id="uploadFile_1" name="uploadFile_1" class="Lbtn"  multiple="multiple" value="${contentsResult.thumFilePath}"/>
							</td>
						</tr>
						<tr>
							<th id="title">등록 자료 </td>
							<td>
								${contentsResult.fileName} <input type="file" id="uploadFile_2" name="uploadFile_2" class="Lbtn"  multiple="multiple">
							 </td>
						</tr>
						
						<tr>
							<th id="title">비고 </td>
							<td>
								<input type="text" name="remark" id="remark" maxlength="50" value="${contentsResult.remark}" >
							</td>
						</tr>
						<!-- [E] 라디오 [data-radio-key="image"] -->
					</tbody>
				</table>
		
				<div class="submit-area">
					<button type="button" class="sub-btn" data-offset="left" onclick="fnDeleteContents();">삭제</button>
					<button type="button" class="sub-btn" onclick="geBack()">취소</button>
					<button type="submit" class="main-btn">수정</button>
				</div>
					 
			</form>
		</div>
	</article>
	<!-- [E] 게시물 수정/삭제 -->
</section>

