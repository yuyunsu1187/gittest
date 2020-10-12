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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javaScript" language="javascript">
	//<![CDATA[

	
	// 필수 입력정보인 확인 함수
	function checkValue() {

		if (!document.contentsInfo.title.value) {
			alert("제목을 입력하세요.");
			return false;
		}

		if (!document.contentsInfo.contents.value) {
			alert("내용을 입력하세요.");
			return false;
		}

 		if (!document.contentsInfo.uploadFileThum.value) {
			alert("썸네일 이미지를 등록하세요.");
			return false;
		}

 		// 동영상
		if ($("input:radio[id=contentsVideo]").is(":checked") == true) {		
			if (!document.contentsInfo.uploadFileVideo.value) {
				alert("동영상 등록하세요.");
				return false;
			}
		}
 		
		// 슬라이드 이미지
		if ($("input:radio[id=contentsImage]").is(":checked") == true) {		
			if (!document.contentsInfo.uploadFileDown.value && !document.contentsInfo.upLoadFile1.value) {
				alert("다운로드 파일과 슬라이드 이미지를 등록하세요.");
				return false;
			}
		}
	}

	// 파일 저장
	function fnSave() {
		document.contentsInfo.action = "<c:url value='/contents/scientificInsert.do'/>";
		document.contentsInfo.submit();
	}
	
	// 취소
	function goBack(){
		window.history.back();
	}

	
	$(document).ready(function() {
		var formObj = $("form[name='contentsInfo']");

		$(document).on("click", "#fileDel", function() {
			$(this).parent().remove();
		})

		fnAddFile();
	})

	function fnValiChk() {
		var contentsInfo = $("form[name='contentsInfo'].chk").length;
		for (var i = 0; i < contentsInfo; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}

	
	function fnAddFile() {
		var fileIndex = 2;

		$(".plus-icon-btn").on("click",function() {
				
			if(fileIndex<31){
			$("#divImage2").append("<li><div class='form' data-mult-form='file'>"
										+"<input type='text' class='input-form' readonly/>"
										+"<input type='file' class='file-form' name='uploadFile"+ fileIndex + "' id='uploadFile"+ fileIndex + "'/>"
										+"<label for='uploadFile"+ fileIndex + "' class='file-label'>찾아보기</label>"
									+"</div>"
									+"<div class='form' data-mult-form='file-btn'>"
										+"<button type='button' class='icon-btn minus-icon-btn'><i class='fas fa-minus'></i></button>"
									+"</div></li>");
			fileIndex++;
			}
			if(fileIndex>=31){
				alert('슬라이드 이미지는 30개를 초과 할 수 없습니다.');
			}
		});
		$("#divImage2").on("change", ".file-form", function(){app.formCotroll.uploadFile($(this));}); // 첨부파일
		$("#divImage2").on("click", ".minus-icon-btn", function() {
			$(this).parents("li").remove();
		});
	}

	var fileNoArry = new Array();
	var fileNameArry = new Array();
	function fnDel(value, name) {

		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);
	}
	// ]]>
</script>
<section id="AD050303-15" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Scientific Data</h2>
	</header>
	
	<!-- [S] 게시물 등록 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/contents/scientificInsert.do" name="contentsInfo" id="contentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input type="hidden" name="contentsId" id="contentsId" maxlength="50" value="${nextContentsId}"/>
				<input type="hidden" name="stateCode" id="stateCode" maxlength="50" value = "02"/>
				<table class="default-table">
					<caption>Scientific Data 입력</caption>
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
							<th scale="col">키워드 태그</th>
							<td>
								<div class="form-area" data-combine-form="column-2-form">
									<div class="form"><input type="text" class="input-form" name="keyword1" id="keyword1" maxlength="255" value="" placeholder ="Enter keyword 1"></div>
									<div class="form"><input type="text" class="input-form" name="keyword2" id="keyword2" maxlength="255" value="" placeholder ="Enter keyword 2"></div>
								</div>
							</td>
						</tr>
						<tr>
							<th scale="col" data-text-style="essential">내용</th>
							<td>
								<div class="form"><textarea class="input-form" name="contents" id="contents" placeholder="내용을 입력해주세요." rows="12"></textarea></div>
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
									<!-- [2020-09-22] 이미지 사이즈 문구 추가 -->
									<p class="form-txt"><span class="point-color">340 X 190</span> 해상도 이미지 파일로 업로드하여 주시기 바랍니다</p>
								</div>
							</td>
						</tr>
						

						<!-- [컨텐츠 타입] 라디오 -->
						<tr>
							<th scale="col">컨텐츠 타입</th>
							<td>
								<!-- [2020-09-03] 공통 : 라디오 버튼 수정 (.fa-dot-circle 삭제) -->
								<ul class="form" data-form="radio">
									<li>
										<input type="radio" class="check-form" id="contentsVideo" name="setting" data-radio-key="video" checked />
										<label for="contentsVideo" class="label-form">동영상</label>
									</li>
									<li>
										<input type="radio" class="check-form" id="contentsImage" name="setting" data-radio-key="image" />
										<label for="contentsImage" class="label-form">슬라이드 이미지</label>
									</li>
								</ul>
							</td>
						</tr>
						
						<!-- [S : 20200923] 라디오 data-radio-key에 따른 영역 data-position-key값 추가 -->
						<tr data-radio-target="position" data-position-key="video">
							<th scale="col" data-text-style="essential">동영상 등록</th>
							<td>
								<div class="form" data-mult-form="file">
									<input type="text" class="input-form" readonly />
									<input type="file" class="file-form" name="uploadFileVideo" id="uploadFileVideo" />
									<label for="uploadFileVideo" class="file-label">찾아보기</label>
								</div>
							</td>
						</tr>
						<!-- [E] 라디오 [data-radio-key="video"] -->
										
						<!-- [S : 2020-10-05] 항목추가 : 다운로드 파일 등록 -->
						<tr data-radio-target="position" data-position-key="image">
						<th scale="col" data-text-style="essential">다운로드 파일 등록</th>
							<td>
								<div class="form" data-mult-form="file">
									<input type="text" class="input-form" readonly />
									<input type="file" class="file-form"  name="uploadFileDown"  id="uploadFileDown" />
									<label for="uploadFileDown" class="file-label">찾아보기</label>
								</div>
							</td>
						</tr>
						<!-- [E] 라디오 [data-radio-key="image"] 항목추가 -->


						<!--yys [S : 20200923] 라디오 data-radio-key에 따른 영역 data-position-key값 추가 -->
						<tr data-radio-target="position" data-position-key="image">
						<th scale="col">슬라이드 이미지 등록</th>
							<td>
								<ul class="form-area" data-combine-form="file-list" id="divImage2">
									<!-- 고정 값 -->
									<li >
										<div class="form" data-mult-form="file">
											<input type="text" class="input-form" readonly />
											<input type="file" class="file-form" name="upLoadFile1" id="upLoadFile1" />
											<label for="upLoadFile1" class="file-label">찾아보기</label>
										</div>
										<div class="form" data-mult-form="file-btn" >
											<button type="button" class="icon-btn plus-icon-btn"><i class="fas fa-plus"></i></button>
										</div>
									</li>
								</ul>
								<!-- [2020-09-22] 이미지 사이즈 문구 추가 -->
								<p class="form-txt"><span class="point-color">1000 X 562</span> 해상도 이미지 파일로 업로드하여 주시기 바랍니다</p>
							</td>
						</tr>
						<!-- [E] 라디오 [data-radio-key="image"] -->
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

