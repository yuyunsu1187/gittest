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
	
	// 필수 입력정보인 확인 함수
	function checkValue() {

		if (!document.contentsInfo.title.value) {
			alert("title를 입력하세요.");
			return false;
		}

 		if (!document.contentsInfo.uploadFile_1.value) {
			alert("썸네일 이미지를 등록하세요.");
			return false;
		}

		if (!document.contentsInfo.uploadFile_2.value) {
			alert("업로드 할 파일을 등록하세요.");
			return false;
		} 

	}

	// 삭제
	function fnDeleteContents() {
		document.contentsInfo.action = "<c:url value='/admin/contents/library/clinic/deleteContents.do'/>";
		document.contentsInfo.submit();
	}
	
	// 취소
	function goBack(){
		window.history.back();
	}

	
	// ]]>
</script>
<%
String menuId = (String) request.getAttribute("menuId");
%>
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Clinic Material</h2>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/admin/contents/library/clinic/updateContents.do" name="contentsInfo" id="contentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input type="hidden" name="seq" id="seq" value="${contentsResult.seq}" />
				<input type="hidden" name="contentsId" id="contentsId" maxlength="50" value="${contentsResult.contentsId}"/>
				<input type="hidden" name="menuId" id="menuId" maxlength="50" value="${contentsResult.menuId}"/>
				<input type="hidden" name="stateCode" id="stateCode" maxlength="50" value="${contentsResult.stateCode}"/>
				
				<table class="default-table">
					<caption>Clinic Material 수정</caption>
					<colgroup>
						<col style="width:30%;" />
						<col style="width:auto;" />
					</colgroup>
					
					<tbody>				
						<tr>
							<th scale="col" data-text-style="essential">제목</th>
							<td>
								<div class="form"><input type="text" class="input-form" name="title" id="title" maxlength="50" placeholder="제목을 입력해주세요." value="${contentsResult.title}" /></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col">안내 문구</th>
							<td>
								<div class="form">
									<textarea class="input-form" name="contents" id="contents" maxlength="50" placeholder="문의 내용을 입력해주세요." rows="12">${contentsResult.contents}</textarea>
								</div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">썸네일 이미지</th>
							<td>
								<div class="form-area">
									<div class="form" data-mult-form="uploade-file">
										<a href="#none" target="_blank" titile="새창열기" class="link-btn">${contentsResult.thumFileName}</a>
										<button type="button" class="icon-btn"><i class="far fa-trash-alt"></i></button>
									</div>
									<div class="form" data-mult-form="file">
										<input type="file" class="input-form" id="uploadFile_1" name="uploadFile_1" multiple="multiple" value="${contentsResult.thumFilePath}"/>
									</div>
									<p class="form-txt"><span class="point-color">000 X 000</span> 해상도 이미지 파일로 업로드하여 주시기 바랍니다</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scale="col" data-text-style="essential">등록 자료</th>
							<td>
								<div class="form-area">
									<div class="form" data-mult-form="uploade-file">
										<a href="#none" target="_blank" titile="새창열기" class="link-btn">${contentsResult.fileName}</a>
										<button type="button" class="icon-btn"><i class="far fa-trash-alt"></i></button>
									</div>
									<div class="form" data-mult-form="file">
										<input type="file" class="input-form" id="uploadFile_2" name="uploadFile_2" multiple="multiple">
									</div>
								</div>
							 </td>
						</tr>
						
						<tr>
							<th scale="col">비고</th>
							<td>
								<div class="form">
									<textarea class="input-form" name="remark" id="remark" maxlength="50" placeholder="비고 내용을 입력해주세요." rows="12">${contentsResult.remark}</textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			
<<<<<<< .mine
			</table>
			<a class="Lbtn" href="#"><input type="button" value="삭제" onclick="fnDeleteContents();"></a>
			<a class="Lbtn" href="#"><input type="button" value="취소" onclick="geBack()"></a>
			<a class="Lbtn" href="#"><input type="submit" value="수정" /> </a>
				 
		</form>
	</div>
</body>
</html>
||||||| .r25
=======
				<div class="submit-area">
					<button type="button" class="sub-btn" data-offset="left" onclick="fnDeleteContents();">삭제</button>
					<button type="button" class="sub-btn" onclick="geBack();">취소</button>
					<button type="submit" class="main-btn">수정</button>
				</div>
					 
			</form>
		</div>
	</article>
	<!-- [E] 게시물 수정/삭제 -->
</section>
>>>>>>> .r37
