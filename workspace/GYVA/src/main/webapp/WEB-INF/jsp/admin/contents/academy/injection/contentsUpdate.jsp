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
		
		if (!document.injectionContentsInfo.categoryCode.value || document.injectionContentsInfo.categoryCode.value == "") {
			alert("카테고리를 선택하세요.");
			return false;
		}
	
		if (!document.injectionContentsInfo.title.value || document.injectionContentsInfo.title.value == "") {
			alert("title를 입력하세요.");
			return false;
		}
		
		if (!document.injectionContentsInfo.uploadFileName1.value || document.injectionContentsInfo.uploadFileName1.value == "") {
			if (!document.injectionContentsInfo.uploadFile_1.value) {
				alert("thumbnail image를 등록하세요.");
				return false;
			}
		}
		
		if (!document.injectionContentsInfo.uploadFileName2.value || document.injectionContentsInfo.uploadFileName2.value == "") {
			if (!document.injectionContentsInfo.uploadFile_2.value) {
				alert("업로드 할 파일을 등록하세요.");
				return false;
			}
		}
		
		if (!document.injectionContentsInfo.readerUserId.value || document.injectionContentsInfo.readerUserId.value == "") {
			alert("담당 강사를 선택 하세요.");
			return false;
		}
			
	}
	
// 파일 저장
function fnSave() {
	document.injectionContentsInfo.action = "<c:url value='/admin/contents/academy/injection/updateContents.do'/>";
	document.injectionContentsInfo.submit();
}


// 취소 클릭시 Injection 컨텐츠 화면으로
function goInjectionContentsList() {
	var url = "/admin/contents/injection/retrieveContentsList.do?menuId=";
	var menuId = document.injectionContentsInfo.menuId.value;
	url = url + menuId;
	//console.log(url);
	location.href = url;
}

function fnRetrieveLecturerInfo(id) {
	var lecturerId = id;
	console.log("select value : " + id);
	
	$.ajax({
		url : "/admin/contents/academy/injection/retrieveLecturerInfo.do",
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
			
		}
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
		<h2 class="content-tit">YVOIRE Injection</h2>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/admin/contents/academy/injection/updateContents.do" name="injectionContentsInfo" id="injectionContentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input type="hidden" name="seq" id="seq" value="${contentsResult.seq}" />
				<input type="hidden" name="fileId" id="fileId" value="${contentsResult.fileId}" />
				<input type="hidden" name="contentsId" id="contentsId" value="${contentsResult.contentsId}" />
				<input type="hidden" name="menuId" id="menuId" value="${contentsResult.menuId}"/>
				<table class="default-table">
					<caption>YVOIRE Injection 수정</caption>
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
									<li>
										<input type="radio" class="check-form" id="radio03" name="category" />
										<label for="radio03" class="label-form"><i class="fa-dot-circle"></i>YVOIRE Exclusive</label>
									</li>
								</ul>		
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">제목</th>
							<td>
								<input type="text" name="title" id="title" maxlength="70" value=<c:out value="${contentsResult.title}" />>
							</td>
						</tr>
						
						<tr>
							<th scale="col">강의 내용</th>
							<td>
								<input type="text" name="contents" id="contents" maxlength="70" value=<c:out value="${contentsResult.contents}" />>
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
								<input type="text" name="uploadFileName1" id="uploadFileName1" maxlength="70" value=<c:out value="${contentsResult.thumFileName}" /> readonly="readonly">
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
								<input type="text" name="uploadFileName2" id="uploadFileName2" maxlength="70" value=<c:out value="${contentsResult.fileName}" /> readonly="readonly">
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
					<button type="button" class="sub-btn" data-offset="left">삭제</button>
					<button type="button" class="sub-btn" onclick="goInjectionContentsList();">취소</button>
					<button type="submit" class="main-btn">수정</button>
				</div>
			</form>
		</div>
	</article>
	<!-- [E] 게시물 등록 -->
</section>

