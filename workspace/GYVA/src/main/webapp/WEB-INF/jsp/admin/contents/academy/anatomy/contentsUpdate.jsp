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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javaScript" language="javascript">
//<![CDATA[
	
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		
		if (!document.anatomyContentsInfo.categoryCode.value || document.anatomyContentsInfo.categoryCode.value == "") {
			alert("카테고리를 선택하세요.");
			return false;
		}
		
		if (!document.anatomyContentsInfo.title.value || document.anatomyContentsInfo.title.value == "") {
			alert("title를 입력하세요.");
			return false;
		}
		
		if (!document.anatomyContentsInfo.uploadFileName1.value || document.anatomyContentsInfo.uploadFileName1.value == "") {
			if (!document.anatomyContentsInfo.uploadFile_1.value) {
				alert("thumbnail image를 등록하세요.");
				return false;
			}
		}
		
		if (!document.anatomyContentsInfo.uploadFileName2.value || document.anatomyContentsInfo.uploadFileName2.value == "") {
			if (!document.anatomyContentsInfo.uploadFile_2.value) {
				alert("업로드 할 파일을 등록하세요.");
				return false;
			}
		}
		
		if (!document.anatomyContentsInfo.readerUserId.value || document.anatomyContentsInfo.readerUserId.value == "") {
			alert("담당 강사를 선택 하세요.");
			return false;
		}
		
		/*
		if (!document.contentsInfo.readerUserId.value) {
			alert("readerUserId를 입력하세요.");
			return false;
		}
		*/
		
	}
	
// 파일 저장
function fnSave() {
	document.anatomyContentsInfo.action = "<c:url value='/admin/contents/academy/anatomy/updateContents.do'/>";
	document.anatomyContentsInfo.submit();
}


// 취소 클릭시 Anatomy 컨텐츠 화면으로
function goAnatomyContentsList() {
	var url = "/admin/contents/anatomy/retrieveContentsList.do?menuId=";
	var menuId = document.anatomyContentsInfo.menuId.value;
	url = url + menuId;
	//console.log(url);
	location.href = url;
}

function fnRetrieveLecturerInfo(id) {
	var lecturerId = id;
	
	$.ajax({
		url : "/admin/contents/academy/anatomy/retrieveLecturerInfo.do",
		type : "post",
		dataType : "json",
		data : {"readerUserId" : lecturerId},
		success : function(data) {
			console.log(typeof data);
			console.log(data);
			
			var dataString = "";
			dataString = "Career<br>" + data.career1 + "<br>" + data.career2 + "<br>" + data.career3 + "<br>"
			dataString += "<img src='" + data.lecturerImgPath + "'/>";
			console.log(dataString);
			
			var lecturerInfo = document.getElementById('lecturerInfo');
			lecturerInfo.innerHTML = dataString;
			
		},
	})
}

function show() {
	console.log("thumnail filename");
	console.log(document.injectionContentsInfo.uploadFile_1.value);
	console.log("file name");
	console.log(document.injectionContentsInfo.uploadFile_2.value);
}

function deleteFileName(element) {
	element.value = null;
}

// ]]>
</script>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Anatomy Contents</h2>
	</header>
					
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<form method="post" action="/admin/contents/academy/anatomy/updateContents.do" name="anatomyContentsInfo" id="anatomyContentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input type="hidden" name="seq" id="seq" value="${contentsResult.seq}" />
				<input type="hidden" name="fileId" id="fileId" value="${contentsResult.fileId}" />
				<input type="hidden" name="contentsId" id="contentsId" value="${contentsResult.contentsId}" />
				<input type="hidden" name="menuId" id="menuId" value="${contentsResult.menuId}"/>
				
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
								<select id="categoryCode" name="categoryCode">
									<option value=""> 카테고리를 반드시 선택하세요 </option>
									<c:forEach var="categoryCode" items="${categoryCodeList}" varStatus="status">
										<option value="<c:out value='${categoryCode.code}'/>" 
										<c:if test="${contentsResult.categoryCode == categoryCode.code}"> selected="selected"</c:if> > 
										<c:out value="${categoryCode.value}"/> </option>
						     		</c:forEach>
					     		</select>
					     		
								<ul class="form" data-form="radio">
									<li>
										<input type="radio" class="check-form" id="radio01" name="category" checked />
										<label for="radio01" class="label-form"><i class="fa-dot-circle"></i>Upper Face</label>
									</li>
									<li>
										<input type="radio" class="check-form" id="radio02" name="category" />
										<label for="radio02" class="label-form"><i class="fa-dot-circle"></i>Mid Face</label>
									</li>
									<li>
										<input type="radio" class="check-form" id="radio03" name="category" />
										<label for="radio03" class="label-form"><i class="fa-dot-circle"></i>Low Face</label>
									</li>
								</ul>				     				
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">제목</th>
							<td>
								<div class="form"><input type="text" class="input-form" name="contents" id="contents" maxlength="70" placeholder="제목을 입력해주세요." value="<c:out value="${contentsResult.title}" />" /></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col">강의 내용</th>
							<td>
								<div class="form"><textarea class="input-form" name="contents" id="contents" maxlength="70" placeholder="문의 내용을 입력해주세요." rows="12"><c:out value="${contentsResult.contents}" /></textarea></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">썸네일 이미지</th>
							<td>
								<input type="file" id="uploadFile_1" name="uploadFile_1" class="Lbtn"  multiple="multiple">
							</td>
						</tr>
						
						<tr>
							<td id="title">existing thumbnail image</td>
							<td>
								<input type="text" name="uploadFileName1" id="uploadFileName1" maxlength="70" value=<c:out value="${contentsResult.thumFileName}" />>
								<input type="button" value="삭제" onclick="javascript:deleteFileName(document.getElementById('uploadFileName1'))">
							</td>
						</tr>
						
						<tr>
							<td id="title">upload file </td>
							<td>
								<input type="file" id="uploadFile_2" name="uploadFile_2" class="Lbtn"  multiple="multiple"> 
							 </td>
						</tr>
						
						<tr>
							<td id="title">existing upload file</td>
							<td>
								<input type="text" name="uploadFileName2" id="uploadFileName2" maxlength="70" value=<c:out value="${contentsResult.fileName}" />>
								<input type="button" value="삭제" onclick="javascript:deleteFileName(document.getElementById('uploadFileName2'))">
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">담당 강사</th>
							<td>
								<div class="form" data-form="select">
									<select class="select-form" id="readerUserId" name="readerUserId">
										<option value=""> 담당 강사를 반드시 선택하세요 </option>
										<c:forEach var="result" items="${resultList}" varStatus="status">
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
					<input type="submit" value="등록" /> 
					<input type="button" value="취소" onclick="goAnatomyContentsList();">
					<input type="button" value="파일 확인" onclick="show();">
				</div>
			</form>
		</div>
	</article>
	
</section>

