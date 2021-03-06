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
		
 		/* if (!document.contentsInfo.uploadFileThum.value) {
			alert("썸네일 이미지를 등록하세요.");
			return false;
		}
		
 		if (!document.contentsInfo.uploadFileDetail.value
				&& !document.contentsInfo.contentsUrl.value) {
			alert("컨텐츠 타입을 선택후 등록하세요.");
			return false;
		} */

	}
	
	// 해당 파일 다운로드
	function fnDownload(index) {
		var app = document.getElementById("append");
		app.innerHTML = "<input type=hidden class=Lcheckbox name=checkIndex id=checkIndex value="+ index +">";
		
		document.contentsInfo.action = "<c:url value='/function/filedownload/downloadFileList.do'/>";
		document.contentsInfo.submit();
	}

	// 삭제
	function fnDeleteContents() {
		var delConfirm = confirm('정말로 삭제 하시겠습니까?');
		if (delConfirm) {
			document.contentsInfo.action = "<c:url value='/contents/journalDelete.do'/>";
			document.contentsInfo.submit();
		}
	}
	
	// 취소
	function goBack(){
		window.history.back();
	}
	
// ]]>
</script>
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Journal</h2>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/contents/journalUpdate.do" name="contentsInfo" id="contentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input type="hidden" name="seq" id="seq" value="<c:out value='${contentsResult.seq}'/>" />
				<input type="hidden" name="contentsId" id="contentsId" maxlength="50" value="<c:out value='${contentsResult.contentsId}'/>"/>
				<input type="hidden" name="stateCode" id="stateCode" maxlength="50" value="<c:out value='${contentsResult.stateCode}'/>"/>
				<input type="hidden" name="fileId" id="fileId" value="<c:out value='${contentsResult.fileId}'/>"/>
				<div id="append"></div>
				
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
								<div class="form"><input type="text" class="input-form" name="title" id="title" maxlength="50" value="<c:out value='${contentsResult.contents}'/>" /></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col">설명 문구</th>
							<td>
								<div class="form"><input type="text" class="input-form" name="contents" id="contents" maxlength="50" value="<c:out value='${contentsResult.contents}'/>" /></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">썸네일 이미지</th>
							<td>
								<div class="form-area">
									<input type="hidden" name="fileName" value="<c:out value='${contentsResult.thumFileName}'/>" />
									<input type="hidden" name="uploadFilePath" value="<c:out value='${contentsResult.thumFilePath}'/>" />
									<div class="form" data-mult-form="uploade-file">
										<a href="#" class="link-btn" onclick="fnDownload(0);"><c:out value='${contentsResult.thumFileName}'/></a>
									</div>
									<div class="form" data-mult-form="file">
										<input type="text" class="input-form" readonly />
										<input type="file" class="file-form" name="uploadFileThum" id="uploadFileThum" />
										<label for="uploadFileThum" class="file-label">찾아보기</label>
									</div>
									<p class="form-txt"><span class="point-color">378 X 260</span> 해상도 이미지 파일로 업로드하여 주시기 바랍니다</p>
								</div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">PDF 등록 설정 </th>
							<td>
								<ul class="form" data-form="radio">
									<li>
										<input type="radio" class="check-form" name="contentsType" id="contentsFileType" data-radio-key="file" 
										<c:if test="${not empty contentsResult.filePath}">checked</c:if> disabled>
										<label for="contentsFileType" class="label-form">파일 등록</label>
									</li>
									<li>
										<input type="radio" class="check-form" name="contentsType" id="contentsUrlType" data-radio-key="URL" 
										<c:if test="${not empty contentsResult.contentsUrl}">checked</c:if> disabled>
										<label for="contentsUrlType" class="label-form">URL 등록</label>
									</li>
								</ul>
							</td>
						</tr>
						
						<!-- [S] 라디오 [data-radio-key="file"] : [data-row-key="file"] 연결되는 tr의 data- 값 -->					
						<tr data-radio-target="position" data-position-key="file">
							<th scale="col">파일 등록</th>
							<td>
								<div class="form-area">
									<input type="hidden" name="fileName" value="<c:out value='${contentsResult.fileName}'/>" />
									<input type="hidden" name="uploadFilePath" value="<c:out value='${contentsResult.filePath}'/>" />
									<div class="form" data-mult-form="uploade-file">
										<a href="#" class="link-btn" onclick="fnDownload(1);"><c:if test="${not empty contentsResult.filePath}"><c:out value='${contentsResult.fileName}'/></c:if></a>
									</div>
									<div class="form" data-mult-form="file">
										<input type="text" class="input-form" /> <input type="file" class="file-form" name="uploadFileDetail" id="uploadFileDetail" /> 
										<label for="uploadFileDetail" class="file-label">찾아보기</label>
									</div>
								</div>
							</td>
						</tr>
						<!-- [E] 라디오 [data-radio-key="file"] -->


						<!-- [S] 라디오 [data-radio-key="URL"] : [data-row-key="URL"] 연결되는 tr의 data- 값 -->
						<tr data-radio-target="position" data-position-key="URL">
							<th scale="col">URL 등록</th>
							<td>
								<div class="form">
									<input type="text" class="input-form" id="contentsUrl" name="contentsUrl" value="<c:out value='${contentsResult.contentsUrl}'/>" maxlength="100" placeholder ="URL을 입력해주세요." >
								</div>
							</td>
						</tr>
						<!-- [E] 라디오 [data-radio-key="URL"] -->
					</tbody>
				</table>
			
				<div class="submit-area">
					<button type="button" class="sub-btn" data-offset="left" onclick="fnDeleteContents();">삭제</button>
					<button type="button" class="sub-btn" onclick="goBack();">취소</button>
					<button type="submit" class="main-btn">수정</button>
				</div>
			</form>
		</div>
	</article>
	<!-- [E] 게시물 수정/삭제 -->
</section>