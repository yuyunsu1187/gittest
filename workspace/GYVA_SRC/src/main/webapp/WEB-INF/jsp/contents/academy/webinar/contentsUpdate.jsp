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

<script type="text/javascript" language="javascript">
//<![CDATA[
// 필수 입력정보인 확인 함수
	function checkValue() {
        
		if (!document.contentsInfo.title.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		
		if (!document.contentsInfo.contents.value) {
			alert("안내 문구를 입력하세요.");
			return false;
		}
		
		if (!document.contentsInfo.startDate.value) {
			alert("시작일자를 입력하세요.");
			return false;
		}
		
		if ($("input:checkbox[id=allcheck]").is(":checked") == true) {
			if (!document.contentsInfo.date.value) {
				alert("일자를 입력하세요.");
				return false;
			}
		}
		
		if ($("input:checkbox[id=allcheck]").is(":checked") == false) {
			if (!document.contentsInfo.endDate.value) {
				alert("종료일자를 입력하세요.");
				return false;
			}
		}
		
		if (!document.contentsInfo.contentsUrl.value) {
			alert("링크 URL을 입력하세요.");
			return false;
		}

		if (!document.contentsInfo.readerUserId.value) {
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
	
	// 삭제
	function fnDeleteContents() {
		var delConfirm = confirm('정말로 삭제 하시겠습니까?');
		if (delConfirm) {
			document.contentsInfo.action = "<c:url value='/contents/webinarDelete.do'/>";
			document.contentsInfo.submit();
		}
	}

	function goBack(){
		window.history.back();
	}

	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
	});
	
//]]>
</script>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Webinar replay</h2>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<form method="post" action="/contents/webinarUpdate.do" name="contentsInfo" id="contentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
			<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>" />
			<input type="hidden" name="fileId" id="fileId" value="<c:out value='${result.fileId}'/>" />
			<input type="hidden" name="contentsId" id="contentsId" value="<c:out value='${result.contentsId}'/>" />
			<input type="hidden" name="stateCode" id="stateCode" value="<c:out value='${result.stateCode}'/>"/>
			<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>"/>
			<div id="append"></div>
			
			<table class="default-table">
				<caption>Webinar replay 입력</caption>
				<colgroup>
					<col style="width:30%;" />
					<col style="width:auto;" />
				</colgroup>
				
				<tbody>
					<tr>
						<th scale="col" data-text-style="essential">제목</th>
						<td><div class="form"><input type="text" class="input-form" name="title" id="title" placeholder="제목을 입력해주세요." value="<c:out value='${result.title}'/>" /></div></td>
					</tr>
					
					<tr>
						<th scale="col">키워드 태그</th>
						<td>
							<div class="form-area" data-combine-form="column-2-form">
								<div class="form"><input type="text" class="input-form" name="keyword1" id="keyword1" maxlength="255" value="<c:out value='${result.keyword1}'/>" placeholder ="Enter keyWord 1"></div>
								<div class="form"><input type="text" class="input-form" name="keyword2" id="keyword2" maxlength="255" value="<c:out value='${result.keyword2}'/>" placeholder ="Enter keyWord 2"></div>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">기간 설정</th>
						<td>
							<div class="form-area" data-combine-form="datepicker" name="datepicker" id="datepicker">
								<div class="form" data-mult-form="date">
									<input type="text" class="input-form" name="startDate" id="startDate" value="<c:out value='${fn:substring(result.startDate,0,10)}'/>" autocomplete="off"/>
									<button type="button" class="icon-btn"><i class="far fa-calendar-alt"></i></button>
								</div>
								
								<span class="symbol">-</span>
								
								<div class="form" data-mult-form="date">
									<input type="text" class="input-form" name="endDate" id="endDate" value="<c:out value='${fn:substring(result.endDate,0,10)}'/>" autocomplete="off"/>
									<button type="button" class="icon-btn"><i class="far fa-calendar-alt"></i></button>
								</div>
								
								<div class="form" data-form-type="checkbox">
									<input type="checkbox" class="check-form" id="allcheck" <c:if test="${not empty result.date}"> checked</c:if>/>
									<label for="allcheck" class="label-form"><i class="fa-check-square"></i> 당일</label>
									<!-- [2020-09-23] 당일 선택 시 시간입력 폼 추가 -->
									<input type="text" class="input-form" name="date" id="date" placeholder="18 ~ 22시" value="<c:out value='${result.date}'/>" />
								</div>

							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">링크 URL</th>
						<td><div class="form"><input type="text" name="contentsUrl" id="contentsUrl" class="input-form" placeholder="제목을 입력해주세요." value="<c:out value='${result.contentsUrl}'/>" /></div></td>
					</tr>
								
					<tr>
						<th scale="col" data-text-style="essential">썸네일 이미지</th>
						<td>
							<div class="form-area">
								<input type="hidden" name="fileName" value="<c:out value='${result.thumFileName}'/>" />
								<input type="hidden" name="uploadFilePath" value="<c:out value='${result.thumFilePath}'/>" />
								<div class="form" data-mult-form="uploade-file">
									<a href="#" class="link-btn" onclick="fnDownload(0);"><c:out value='${result.thumFileName}'/></a>
								</div>
								<div class="form" data-mult-form="file">
									<input type="text" class="input-form" readonly />
									<input type="file" class="file-form" name="uploadFileThum" id="uploadFileThum" />
									<label for="uploadFileThum" class="file-label">찾아보기</label>
								</div>
								<p class="form-txt"><span class="point-color">390 X 220</span> 해상도 이미지 파일로 업로드하여 주시기 바랍니다</p>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">강의 영상</th>
						<td>
							<div class="form-area">
								<input type="hidden" name="fileName" value="<c:out value='${result.fileName}'/>" />
								<input type="hidden" name="uploadFilePath" value="<c:out value='${result.filePath}'/>" />
								<div class="form" data-mult-form="uploade-file">
									<a href="#" class="link-btn" onclick="fnDownload(1);"><c:out value='${result.fileName}'/></a>
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
									<c:forEach var="lecturer" items="${lecturerList}" varStatus="status">
										<option value="<c:out value='${lecturer.readerUserId}'/>"
										<c:if test="${result.readerUserId == lecturer.readerUserId}"> selected="selected"</c:if> > 
										<c:out value="${lecturer.nameFirst} ${lecturer.nameLast}"/> </option>
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
										<c:if test="${result.surveyId == survey.code}"> selected="selected"</c:if> > 
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
				<button type="button" class="sub-btn" onclick="goBack();">취소</button>
				<button type="submit" class="main-btn">수정</button>
			</div>
			</form>
		</div>
	</article>
	<!-- [E] 게시물 수정/삭제 -->
</section>
