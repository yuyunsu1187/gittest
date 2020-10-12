<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * LG Chem YVOIRE Academy JSP
 * NAME : contentsWrite.jsp
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
	
	// 필수 입력정보인 확인 함수
	function checkValue() {

		if (!document.contentsInfo.title.value) {
			alert("제목을 입력하세요.");
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

	// 파일 저장
	function fnSave() {
		document.contentsInfo.action = "<c:url value='/admin/contents/clinic/insertContents.do'/>";
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
		<h2 class="content-tit">Clinic Material</h2>
	</header>
	
	<!-- [S] 게시물 등록 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/admin/contents/clinic/insertContents.do" name="contentsInfo" id="contentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input type="hidden" name="contentsId" id="contentsId" maxlength="50" value="${nextContentsId}"/>
				<input type="hidden" name="menuId" id="menuId" maxlength="50" value="${menuId}"/>
				<input type="hidden" name="stateCode" id="stateCode" maxlength="50" value = "02"/>
				<table class="default-table">
					<caption>Clinic Material 입력</caption>
					<colgroup>
						<col style="width:30%;" />
						<col style="width:auto;" />
					</colgroup>
					
					<tbody>
						<tr>
							<th scale="col" data-text-style="essential">제목</th>
							<td>
								<div class="form"><input type="text" class="input-form" name="title" id="title" maxlength="50" placeholder ="Enter title" ></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col">안내 문구</th>
							<td>
								<div class="form"><textarea class="input-form" name="title" id="title" maxlength="50" placeholder="문의 내용을 입력해주세요." rows="12"></textarea></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">썸네일 이미지</th>
							<td>
								<div class="form" data-mult-form="file">
									<input type="file" class="input-form" id="uploadFile_1" name="uploadFile_1" multiple="multiple">
								</div>
							</td>
						</tr>
						<tr>
							<th scale="col" data-text-style="essential">등록 자료</th>
							<td>
								<div class="form" data-mult-form="file">
									<input type="file" class="input-form" id="uploadFile_2" name="uploadFile_2" multiple="multiple"> 
								</div>
							 </td>
						</tr>
						
						<tr>
							<th scale="col">비고</th>
							<td>
								<div class="form"><textarea class="input-form" name="remark" id="remark" maxlength="50" placeholder="비고 내용을 입력해주세요." rows="12"></textarea></div>
							</td>
						</tr>
					</tbody>
				</table>
		
				<div class="submit-area">
					<button type="button" class="sub-btn" onclick="goBack();">취소</button>
					<button type="submit" class="main-btn">등록</button>
				</div>
			</form>
		</div>
	</article>
	<!-- [E] 게시물 등록 -->
</section>

