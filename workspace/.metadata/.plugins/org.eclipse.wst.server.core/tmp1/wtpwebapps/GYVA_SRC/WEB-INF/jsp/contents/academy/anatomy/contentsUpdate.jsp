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
	
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
	
		if (!document.anatomyContentsInfo.title.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		
		if (!document.anatomyContentsInfo.readerUserId.value) {
			alert("담당 강사를 선택 하세요.");
			return false;
		}

	}
	
	// 해당 파일 다운로드
	function fnDownload(index) {
		var app = document.getElementById("append");
		app.innerHTML = "<input type=hidden class=Lcheckbox name=checkIndex id=checkIndex value="+ index +">";
		
		document.contentsInfo.action = "<c:url value='/function/filedownload/downloadFileList.do'/>";
		document.contentsInfo.submit();
	}
	
	// 파일 저장
	function fnSave() {
		document.anatomyContentsInfo.action = "<c:url value='/contents/anatomyUpdate.do'/>";
		document.anatomyContentsInfo.submit();
	}
	
	
	// 취소 클릭시 Academy 컨텐츠 화면으로
	function goAcademyContentsList() {
		var url = "/contents/anatomyList.do";
		location.href = url;
	}
		
	function deleteFileName(element) {
		element.value = null;
	}
	
	// 삭제
	function fnDeleteContents() {
		var delConfirm = confirm('정말로 삭제 하시겠습니까?');
		if (delConfirm) {
			document.contentsInfo.action = "<c:url value='/contents/anatomyDelete.do'/>";
			document.contentsInfo.submit();
		}
	}

// ]]>
</script>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Anatomy Contents</h2>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/contents/anatomyUpdate.do" name="anatomyContentsInfo" id="anatomyContentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input type="hidden" name="seq" id="seq" value="<c:out value='${contentsResult.seq}'/>" />
				<input type="hidden" name="fileId" id="fileId" value="<c:out value='${contentsResult.fileId}'/>" />
				<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${contentsResult.contentsId}'/>" />
				<input type="hidden" name="stateCode" id="stateCode" maxlength="50" value="<c:out value='${contentsResult.stateCode}'/>"/>
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>"/>
				<input type="hidden" name="thumFileName" id="thumFileName" value="<c:out value='${contentsResult.thumFileName }'/>"/>
				<input type="hidden" name="fileName" id="fileName" value="<c:out value='${contentsResult.fileName}'/>"/>
				<div id="append"></div>
				
				<table class="default-table">
					<caption>Anatomy 수정</caption>
					<colgroup>
						<col style="width:30%;" />
						<col style="width:auto;" />
					</colgroup>
					
					<tbody>
					<tr>
							<th scale="col" data-text-style="essential">카테고리</th>
							<td>
							<ul class="form" data-form="radio">
							<c:forEach var="categoryCodeList" items="${categoryCodeList}" varStatus="status">
								<c:set var="index" value="${status.index}" />

								<li><input type="radio" class="check-form" name="categoryCode" id="menuId_<c:out value='${index}'/>" value="<c:out value='${categoryCodeList.code}'/>" 
									<c:if test="${contentsResult.categoryCode == categoryCodeList.code}">checked</c:if> />
									<label for="menuId_<c:out value='${index}'/>" class="label-form"><c:out value='${categoryCodeList.value}'/></label>
								</li>
							</c:forEach>
							</ul>
							</td>
						</tr>
					
					
						
						<tr>
							<th scale="col" data-text-style="essential">제목</th>
							<td>
								<div class="form"><input type="text" class="input-form" name="title" id="title" maxlength="70" placeholder="제목을 입력해주세요." value="<c:out value="${contentsResult.title}" />" /></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col">강의 내용</th>
							<td>
								<div class="form"><textarea class="input-form" name="contents" id="contents" placeholder="문의 내용을 입력해주세요." rows="12"><c:out value="${contentsResult.contents}" /></textarea></div>
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
									<p class="form-txt"><span class="point-color">340 X 190</span> 해상도 이미지 파일로 업로드하여 주시기 바랍니다</p>
								</div>
							</td>
						</tr>
						<tr>
									<th scale="col" data-text-style="essential">강의 영상</th>
							<td>
								<div class="form-area">
									<input type="hidden" name="fileName" value="<c:out value='${contentsResult.fileName}'/>" />
									<input type="hidden" name="uploadFilePath" value="<c:out value='${contentsResult.filePath}'/>" />
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
							<th scale="col" data-text-style="essential">담당 강사</th>
							<td>
								<div class="form" data-form="select">
									<select class="select-form" id="readerUserId" name="readerUserId">
										<option value=""> 담당 강사를 반드시 선택하세요 </option>
										<c:forEach var="result" items="${lecturerList}" varStatus="status">
											<option value="<c:out value='${result.readerUserId}'/>"
											<c:if test="${contentsResult.readerUserId == result.readerUserId}"> selected="selected"</c:if> > 
											<c:out value="${result.nameLast} ${result.nameFirst} "/> </option>
							     		</c:forEach>
						     		</select>
									<i class="fas fa-angle-down"></i>
								</div>
					     				
							</td>
						</tr>
						
						<tr>
							<th scale="col">설문 조사</th>
							<td>
								<div class="form" data-form="select">
									<select class="select-form" id="surveyId" name="surveyId">
										<option value=""> 설문조사를 선택하세요 </option>
										<c:forEach var="survey" items="${surveyList}" varStatus="status">
											<option value="<c:out value='${survey.code}'/>"
											<c:if test="${contentsResult.surveyId == survey.code}"> selected="selected"</c:if> > 
											<c:out value="${survey.value}"/> </option>
							     		</c:forEach>
						     		</select>
									<i class="fas fa-angle-down"></i>
								</div>
							</td>
						</tr>
					</tbody>				
				</table>
			
				<div class="submit-area">
					<button type="button" class="sub-btn" data-offset="left" onclick="fnDeleteContents();">삭제</button>
					<button type="button" class="sub-btn" onclick="goAcademyContentsList();">취소</button>
					<button type="submit" class="main-btn">수정</button>
				</div>
			</form>
		</div>
	</article>
	<!-- [E] 게시물 수정/삭제 -->

</section>
