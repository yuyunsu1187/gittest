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

 		if (!document.contentsInfo.uploadFileThum.value) {
			alert("썸네일 이미지를 등록하세요.");
			return false;
		}
 		
 		if (!document.contentsInfo.uploadFileDetail.value) {
			alert("상세 이미지를 등록하세요.");
			return false;
		}
		
		if (!document.contentsInfo.readerUserId.value) {
			alert("담당 강사를 선택 하세요.");
			return false;
		}
		
	}

	// 취소
	function goBack(){
		window.history.back();
	}

	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
	});
	
//]]>
</script>
			
<section id="AD050511-15" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">YVOIRE Exercise</h2>
	</header>
	
	<!-- [S] 게시물 등록 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
		<form method="post" action="/contents/webinarInsert.do" name="contentsInfo" id="contentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
			<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>"/>
			<input type="hidden" name="contentsId" id="contentsId" maxlength="50" value="<c:out value='${nextContentsId}'/>"/>
			<input type="hidden" name="stateCode" id="stateCode" maxlength="50" value = "02"/>
			<input type="hidden" name="categoryCode" id="categoryCode" value=""/>
			<table class="default-table">
				<caption>YVOIRE Exercise 입력</caption>
				<colgroup>
					<col style="width:30%;" />
					<col style="width:auto;" />
				</colgroup>
				
				<tbody>						
					<tr>
						<th scale="col" data-text-style="essential">제목</th>
						<td><div class="form"><input type="text" class="input-form" name="title" id="title" placeholder="제목을 입력해주세요." /></div></td>
					</tr>
					
					<tr>
						<th scale="col">키워드 태그</th>
						<td>
							<div class="form-area" data-combine-form="column-2-form">
								<div class="form"><input type="text" class="input-form" name="keyword1" id="keyword1" maxlength="255" value="" placeholder ="Enter keyWord 1"></div>
								<div class="form"><input type="text" class="input-form" name="keyword2" id="keyword2" maxlength="255" value="" placeholder ="Enter keyWord 2"></div>
							</div>
						</td>
					</tr>

					<tr>
						<th scale="col" data-text-style="essential">기간 설정</th>
						<td>
							<div class="form-area" data-combine-form="datepicker" name="datepicker" id="datepicker">
								<div class="form" data-mult-form="date">
									<input type="text" class="input-form" name="startDate" id="startDate" autocomplete="off"/>
									<button type="button" class="icon-btn"><i class="far fa-calendar-alt"></i></button>
								</div>
								
								<span class="symbol">-</span>
								
								<div class="form" data-mult-form="date">
									<input type="text" class="input-form" name="endDate" id="endDate" autocomplete="off"/>
									<button type="button" class="icon-btn"><i class="far fa-calendar-alt"></i></button>
								</div>
								
								<div class="form" data-form-type="checkbox">
									<input type="checkbox" class="check-form" id="allcheck" />
									<label for="allcheck" class="label-form"><i class="fa-check-square"></i> 당일</label>
									<!-- [2020-09-23] 당일 선택 시 시간입력 폼 추가 -->
									<input type="text" class="input-form" name="date" id="date" placeholder="18 ~ 22시" value="" />
								</div>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">링크 URL</th>
						<td><div class="form"><input type="text" class="input-form" name="contentsUrl" id="contentsUrl" placeholder="링크 URL을 입력해주세요." /></div></td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">썸네일 이미지</th>
						<td>
							<div class="form-area">
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
						<th scale="col" data-text-style="essential">상세 이미지</th>
						<td>
							<div class="form-area">
								<div class="form" data-mult-form="file">
									<input type="text" class="input-form" readonly />
									<input type="file" class="file-form" name="uploadFileDetail" id="uploadFileDetail" />
									<label for="uploadFileDetail" class="file-label">찾아보기</label>
								</div>
								<p class="form-txt"><span class="point-color">390 X 220</span> 해상도 이미지 파일로 업로드하여 주시기 바랍니다</p>
							</div>
						</td>
					</tr>
						
					<tr>
						<th scale="col" data-text-style="essential">담당 강사</th>
						<td>
							<div class="form" data-form="select">
								<select class="select-form" name="readerUserId" id="readerUserId">
									<option value=""> 담당 강사를 반드시 선택하세요 </option>
									<c:forEach var="result" items="${lecturerList}" varStatus="status">
										<option value="<c:out value='${result.readerUserId}'/>"> <c:out value="${result.nameLast} ${result.nameFirst} "/> </option>
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
										<option value="<c:out value='${survey.code}'/>"> <c:out value="${survey.value}"/> </option>
						     		</c:forEach>
					     		</select>
								<i class="fas fa-angle-down"></i>
							</div>
						</td>
					</tr>			
				</tbody>
			</table>
		
			<div class="submit-area">
				<button type="button" class="sub-btn" onclick="goBack()">취소</button>
				<button type="submit" class="main-btn">등록</button>
			</div>
		</form>
		</div>
	</article>
	<!-- [E] 게시물 등록 -->
</section>