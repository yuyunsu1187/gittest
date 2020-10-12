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

		if (!document.contentsInfo.uploadFileThum.value) {
			alert("썸네일 이미지를 등록하세요.");
			return false;
		}

		if (!document.contentsInfo.uploadFileDetail.value
				&& !document.contentsInfo.contentsUrl.value) {
			alert("컨텐츠 타입을 선택후 등록하세요.");
			return false;
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
	
	<!-- [S] 게시물 등록 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<form method="post" action="/contents/journalInsert.do" name="contentsInfo" id="contentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
			<input type="hidden" name="contentsId" id="contentsId" maxlength="50" value="<c:out value='${nextContentsId}'/>"/>
			<input type="hidden" name="stateCode" id="stateCode" maxlength="50" value = "02"/>
			<table class="default-table">
				<caption>Journal 입력</caption>
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
						<th scale="col">설명 문구</th>
						<td>
							<div class="form"><input type="text" class="input-form" name="contents" id="contents" maxlength="50" placeholder ="Enter contents" ></div>
						</td>
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
								<p class="form-txt"><span class="point-color">378 X 260</span> 해상도 이미지 파일로 업로드하여 주시기 바랍니다</p>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">PDF 등록 설정</th>
						<td>
							<ul class="form" data-form="radio">
								<li>
									<input type="radio" class="check-form" name="contentsType" id="contentsFileType" data-radio-key="file" checked>
									<label for="contentsFileType" class="label-form">파일 등록</label>
								</li>
								<li>
									<input type="radio" class="check-form" name="contentsType" id="contentsUrlType" data-radio-key="URL">
									<label for="contentsUrlType" class="label-form">URL 등록</label>
								</li>
							</ul>
						</td>
					</tr>
					
					<!-- [S] 라디오 [data-radio-key="file"] : [data-row-key="file"] 연결되는 tr의 data- 값 -->
					<tr data-radio-target="position" data-position-key="file">
						<th scale="col">파일 등록 </th>						
						<td>
							<div class="form" data-mult-form="file">
								<input type="text" class="input-form" readonly />
								<input type="file" class="file-form" name="uploadFileDetail" id="uploadFileDetail" />
								<label for="uploadFileDetail" class="file-label">찾아보기</label>
							</div>
						 </td>
					</tr>
					<!-- [E] 라디오 [data-radio-key="file"] -->
					
					<!-- [S] 라디오 [data-radio-key="URL"] : [data-row-key="URL"] 연결되는 tr의 data- 값 -->
					<tr data-radio-target="position" data-position-key="URL">
						<th scale="col">URL 등록</th>
						<td>
							<div class="form">
								<input type="text" class="input-form" id="contentsUrl" name="contentsUrl" maxlength="100" placeholder ="URL을 입력해주세요." >
							</div>
						</td>
					</tr>
					<!-- [E] 라디오 [data-radio-key="URL"] -->
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