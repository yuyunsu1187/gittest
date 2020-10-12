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

		if (!document.contentsInfo.contents.value) {
			alert("내용을 입력하세요.");
			return false;
		}

 		if (!document.contentsInfo.uploadFile_1.value) {
			alert("썸네일 이미지를 등록하세요.");
			return false;
		}

		if (!document.contentsInfo.uploadFile_2.value
				&& (!document.contentsInfo.uploadFile_3.value && !document.contentsInfo.uploadFile_4.value)) {
			alert("컨텐츠 타입을 선택후 등록하세요.");
			return false;
		} 

	}

	// 파일 저장
	function fnSave() {
		document.contentsInfo.action = "<c:url value='/admin/contents/scientific/insertContents.do'/>";
		document.contentsInfo.submit();
	}

	// 취소
	function goBack(){
		window.history.back();
	}


	/* ============================================== */

	// contentsType으로 div구분
	function fnDispList(selectList) {

		var obj1 = document.getElementById("divVideo"); // 동영상 파일 첨부 
		var obj2 = document.getElementById("divImage1"); // 업로드 파일
		var obj3 = document.getElementById("divImage2"); // 슬라이드 이미지 리스트
		
		if (selectList == "0") { // 동영상 파일 첨부 
			obj1.style.display = "block";
			obj2.style.display = "none";
			obj3.style.display = "none";

			var arr_image = document.getElementsByName("uploadFile_image");
			for (var i = 0; i < arr_image.length; i++) {
				arr_image[i].value = null;
			}
		} else { // 업로드용 파일 + 슬라이드 이미지
			obj1.style.display = "none";
			obj2.style.display = "block";
			obj3.style.display = "block";
			
			var arr_video = document.getElementsByName("uploadFile_video");
			for (var i = 0; i < arr_video.length; i++) {
				arr_video[i].value = null;
			}
		}
	}

	$(document).ready(function() {
		var formObj = $("form[name='contentsInfo']");

		$(document).on("click", "#fileDel", function() {
			$(this).parent().remove();
		})

		fnAddFile();
	})

	function fnValiChk() {
		var contentsInfo = $("form[name='contentsInfo'] .chk").length;
		for (var i = 0; i < contentsInfo; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}

	
	function fnAddFile() {
		var fileIndex = 4;

		$(".fileAdd_btn").on("click",function() {
		$("#divImage2").append("<div><input type='file' style='float:left;' name='uploadFile_image' id='uploadFile_"+ (fileIndex++)+ "' multiple='multiple'>"+ "</button>"
								+ "<button type='button' style='float:right;' id='fileDelBtn'>"+ "삭제" + "</button></div>");
		});
		$(document).on("click", "#fileDelBtn", function() {
			$(this).parent().remove();
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
<%
String menuId = (String) request.getAttribute("menuId");
%>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Scientific Data</h2>
	</header>
	
	<!-- [S] 게시물 등록 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/admin/contents/scientific/insertContents.do" name="contentsInfo" id="contentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input type="hidden" name="contentsId" id="contentsId" maxlength="50" value="${nextContentsId}"/>
				<input type="hidden" name="menuId" id="menuId" maxlength="50" value="${menuId}"/>
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
									<div class="form"><input type="text" class="input-form" name="keyword1" id="keyword1" maxlength="255" value="" placeholder ="Enter keyWord 1"></div>
									<div class="form"><input type="text" class="input-form" name="keyword2" id="keyword2" maxlength="255" value="" placeholder ="Enter keyWord 2"></div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">내용</th>
							<td>
								<div class="form"><textarea class="input-form" name="contents" id="contents" placeholder="내용을 입력해주세요." rows="12"></textarea>
							</td>
						</tr>
						<tr>
							<th scale="col" data-text-style="essential">썸네일 이미지</th>
							<td>
								<div class="form-area">
									<div class="form" data-mult-form="file">
										<input type="file" class="input-form" id="uploadFile_1" name="uploadFile" multiple="multiple">
									</div>
									<p class="form-txt"><span class="point-color">000 X 000</span> 해상도 이미지 파일로 업로드하여 주시기 바랍니다</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scale="col">컨텐츠 타입</th>
							<td>
								<ul class="form" data-form="radio">
									<li>
										<input type="radio" class="check-form" name="contentsType" id="contentsVideo" data-radio-key="video" onclick="fnDispList('0');" checked />
										<label for="contentsVideo" class="label-form"><i class="fa-dot-circle"></i>동영상</label>
									</li>
									<li>
										<input type="radio" class="check-form" name="contentsType" id="contentsImage" data-radio-key="image" onclick="fnDispList('1');" />
										<label for="contentsImage" class="label-form"><i class="fa-dot-circle"></i>슬라이드 이미지</label>
									</li>
								</ul>
							</td>
						</tr>
						<c:if test=""></c:if>
								
						<!-- [S] 라디오 [data-radio-key="video"] : [data-row-key="video"] 연결되는 tr의 data- 값 -->
						<tr data-row-key="video">
							<th scale="col">동영상 등록</th>
							<td>
								<div id="divVideo" style="display:"><input type="file" class="input-form" id="uploadFile_2" name="uploadFile_video" class="Lbtn"  multiple="multiple"></div>
							 </td>
						</tr>
						<!-- [E] 라디오 [data-radio-key="video"] -->
						
						<!-- [S] 라디오 [data-radio-key="image"] : [data-row-key="image"] 연결되는 tr의 data- 값 -->
						<tr data-row-key="image">
							<th scale="col">다운로드 파일 등록</th>
							<td id="fileIndex">
								<div id="divImage1" style="display:none">
									<input type="file" class="input-form" id="uploadFile_3" name="uploadFile_image" class="Lbtn"  multiple="multiple">
								</div>
							</td>
						</tr>
						<!-- [E] 라디오 [data-radio-key="image"] -->
						
						<!-- [S] 라디오 [data-radio-key="image"] : [data-row-key="image"] 연결되는 tr의 data- 값 -->
						<tr data-row-key="image">
							<th scale="col">슬라이드 이미지 등록</th>
							<td id="fileIndex">
								<div id="divImage2" style="display:none">
									<input type="file" class="input-form" id="uploadFile_4" name="uploadFile_image" class="Lbtn"  multiple="multiple"><button type="button" class="fileAdd_btn">파일추가</button>
									<c:forEach var="file" items="${file}" varStatus="var">
									<div>
										<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
										<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
										<button id="fileDel" onclick="fnDel('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
									</div></br>
									</c:forEach>
								</div>
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

