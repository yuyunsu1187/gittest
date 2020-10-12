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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javaScript" language="javascript">
//<![CDATA[
	
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		
		if (!document.contentsInfo.title.value) {
			alert("title를 입력하세요.");
			return false;
		}
		
 		if (!document.contentsInfo.uploadFile_1.value) {
			alert("썸네일 이미지를 등록하세요.");
			return false;
		}
		
 		if (!document.contentsInfo.uploadFile_2.value
				&& !document.contentsInfo.contentsUrl.value) {
			alert("컨텐츠 타입을 선택후 등록하세요.");
			return false;
		}

	}

	// 삭제
	function fnDeleteContents() {
		document.contentsInfo.action = "<c:url value='/admin/contents/library/journal/deleteContents.do'/>";
		document.contentsInfo.submit();
	}
	
	// 취소
	function goBack(){
		window.history.back();
	}
	
	/* ============================================== */
	
	// contentsType으로 div구분
	function fnDispList(selectList) {
	
		var obj1 = document.getElementById("divFile"); // 파일 등록
		var obj2 = document.getElementById("divUrl"); // URL 등록
	
		if (selectList == "0") { // 파일 등록
			obj1.style.display = "block";
			obj2.style.display = "none";
	
			var arr_url = document.getElementsByName("contentsUrl");
			arr_url[0].value = null;
		} else { // URL 등록
			obj1.style.display = "none";
			obj2.style.display = "block";
			
			var arr_file = document.getElementsByName("uploadFile_2");
			arr_file[0].value = null;
		}
	}
	
// ]]>
</script>
<%
String menuId = (String) request.getAttribute("menuId");
%>
</head>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Journal</h2>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/admin/contents/library/journal/updateContents.do" name="contentsInfo" id="contentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input type="hidden" name="seq" id="seq" value="${contentsResult.seq}" />
				<input type="hidden" name="contentsId" id="contentsId" maxlength="50" value="${contentsResult.contentsId}"/>
				<input type="hidden" name="menuId" id="menuId" maxlength="50" value="${contentsResult.menuId}"/>
				<input type="hidden" name="stateCode" id="stateCode" maxlength="50" value="${contentsResult.stateCode}"/>
				<table class="default-table">
					<caption>Journal 수정</caption>
					<colgroup>
						<col style="width:30%;" />
						<col style="width:auto;" />
					</colgroup>
					
					<tbody>						
						<tr>
							<th scale="col" data-text-style="essential">제목</th>
							<td>
								<div class="form"><input type="text" class="input-form" name="title" id="title" maxlength="50" value="${contentsResult.title}" /></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col">설명 문구</th>
							<td>
								<div class="form"><input type="text" class="input-form" name="contents" id="contents" maxlength="50" value="${contentsResult.contents}" /></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">썸네일 이미지</th>
							<td>
								<div class="form-area">
									<div class="form" data-mult-form="uploade-file">
										<a href="#none" target="_blank" titile="새창열기" class="link-btn">${contentsResult.thumFileName}</a>
										<button type="button" class="icon-btn"><i class="far fa-trash-alt"></i></button>
									</div>
									<div class="form" data-mult-form="file">
										<input type="file" class="input-form" id="uploadFile_1" name="uploadFile"  multiple="multiple" value="${contentsResult.thumFilePath}" />
									</div>
									<p class="form-txt"><span class="point-color">000 X 000</span> 해상도 이미지 파일로 업로드하여 주시기 바랍니다</p>
								</div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">PDF 등록 설정</th>
							<td>
								<ul class="form" data-form="radio">
									<li>
										<input type="radio" class="check-form" name="contentsType" id="contentsFileType" data-radio-key="file" onclick="fnDispList('0');" checked />
										<label for="contentsFileType" class="label-form"><i class="fa-dot-circle"></i>파일 등록</label>
									</li>
									<li>
										<input type="radio" class="check-form" name="contentsType" id="contentsUrlType" data-radio-key="URL" onclick="fnDispList('1');" />
										<label for="contentsUrlType" class="label-form"><i class="fa-dot-circle"></i>URL 등록</label>
									</li>
								</ul>
							</td>
						</tr>
						
						<!-- [S] 라디오 [data-radio-key="file"] : [data-row-key="file"] 연결되는 tr의 data- 값 -->
						<tr data-row-key="file">
							<th scale="col">파일 등록</th>
							<td>
								<div class="form" id="divFile" style="display:"><c:if test="${not empty contentsResult.filePath}">${contentsResult.fileName}</c:if>
									<input type="file" class="input-form" id="uploadFile_2" name="uploadFile_2" multiple="multiple">
								</div>
							 </td>
						</tr>
						<!-- [E] 라디오 [data-radio-key="file"] -->
						
						<!-- [S] 라디오 [data-radio-key="URL"] : [data-row-key="URL"] 연결되는 tr의 data- 값 -->
						<tr data-row-key="URL">
							<th scale="col">URL 등록</th>
							<td>
								<div class="form" id="divUrl" style="display:none">
									<input type="text" class="input-form" id="contentsUrl" name="contentsUrl" maxlength="100" <c:if test="${not empty contentsResult.contentsUrl}">value="${contentsResult.contensUrl}"</c:if>>
								</div>
							</td>
						</tr>
						<!-- [E] 라디오 [data-radio-key="URL"] -->				
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

