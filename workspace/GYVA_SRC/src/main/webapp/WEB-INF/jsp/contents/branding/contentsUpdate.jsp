<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	}

	// 삭제
	function fnDeleteContents() {
		var delConfirm = confirm('정말로 삭제 하시겠습니까?');
		if (delConfirm) {
			document.contentsInfo.action = "<c:url value='/contents/logoDelete.do'/>";
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
		<h2 class="content-tit">Branding Platform</h2>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/contents/logoUpdate.do" name="contentsInfo" id="contentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input type="hidden" name="seq" id="seq" value="<c:out value='${contentsResult.seq}'/>" />
				<input type="hidden" name="contentsId" id="contentsId" maxlength="50" value="<c:out value='${contentsResult.contentsId}'/>"/>
				<input type="hidden" name="stateCode" id="stateCode" maxlength="50" value="<c:out value='${contentsResult.stateCode}'/>"/>
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>"/>
				<input type="hidden" name="thumFileName" id="thumFileName" value="<c:out value='${contentsResult.thumFileName }'/>"/>
				<input type="hidden" name="fileName" id="fileName" value="<c:out value='${contentsResult.fileName}'/>"/>
				<input type="hidden" name="fileId" id="fileId" value="<c:out value='${contentsResult.fileId}'/>"/>
				<table class="default-table">
					<caption>Branding Platform 수정</caption>
					<colgroup>
						<col style="width:30%;" />
						<col style="width:auto;" />
					</colgroup>
					
					<tbody>
						<tr>
							<th scale="col" data-text-style="essential">카테고리 </th>
							<td>
							<ul class="form" data-form="radio">
							<c:forEach var="menuCodeList" items="${menuCodeList}" varStatus="status">
								<c:set var="index" value="${status.index}" />

								<li><input type="radio" class="check-form" name="menuCodeList" id="menuId_<c:out value='${index}'/>" value="<c:out value='${menuCodeList.code}'/>" 
									<c:if test="${contentsResult.menuId == menuCodeList.code}">checked</c:if> />
									<label for="menuId_<c:out value='${index}'/>" class="label-form"><c:out value='${menuCodeList.value}'/></label>
								</li>
							</c:forEach>
							</ul>
							</td>
						</tr>
					
						<!-- [S] 라디오 [data-radio-key="file"] : [data-row-key="file"] 연결되는 tr의 data- 값 -->
						<tr>
							<th scale="col" data-text-style="essential">제목 </th>
							<td>
								<div class="form"><input type="text" class="input-form" name="title" id="title" maxlength="50" placeholder ="Enter title" value="<c:out value='${contentsResult.title}'/>" /></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col">안내 문구</th>
							<td>
								<div class="form"><textarea class="input-form" name="contents" id="contents" placeholder="문의 내용을 입력해주세요." rows="12"><c:out value='${contentsResult.contents}'/></textarea></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">썸네일 이미지 </th>
							<td>
								<div class="form-area">
									<input type="hidden" name="fileName" value="<c:out value='${contentsResult.thumFileName}'/>" />
									<input type="hidden" name="uploadFilePath" value="<c:url value='${contentsResult.thumFilePath}'/>" />
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
							<th scale="col" data-text-style="essential">등록 자료 </th>
							<td>
								<div class="form-area">
									<input type="hidden" name="fileName" value="<c:out value='${contentsResult.fileName}'/>" />
									<input type="hidden" name="uploadFilePath" value="<c:url value='${contentsResult.filePath}'/>" />
									<div class="form" data-mult-form="uploade-file">
										<a href="#" class="link-btn" onclick="fnDownload(1);"><c:out value='${contentsResult.fileName}'/></a>
									</div>
									<div class="form" data-mult-form="file">
										<input type="text" class="input-form" readonly />
										<input type="file" class="file-form" name="uploadFileDetail" id="uploadFileDetail" />
										<label for="uploadFileDetail" class="file-label">찾아보기</label>
									</div>
								</div>
							 </td>
						</tr>
						
						<tr>
							<th scale="col">비고</th>
							<td>
								<div class="form">
									<textarea class="input-form" name="remark" id="remark" placeholder="비고 내용을 입력해주세요." rows="12"><c:out value='${contentsResult.remark}'/></textarea>
								</div>
							</td>
						</tr>
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