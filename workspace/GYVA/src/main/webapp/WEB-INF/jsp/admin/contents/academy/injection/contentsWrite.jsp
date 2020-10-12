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
		
 		if (!document.injectionContentsInfo.uploadFile_1.value) {
			alert("thumbnail image를 등록하세요.");
			return false;
		}
		
		if (!document.injectionContentsInfo.uploadFile_2.value) {
			alert("업로드 할 파일을 등록하세요.");
			return false;
		}
		
		if (!document.injectionContentsInfo.readerUserId.value || document.injectionContentsInfo.readerUserId.value == "") {
			alert("담당 강사를 선택 하세요.");
			return false;
		}

	}
	
// 파일 저장
function fnSave() {
	document.injectionContentsInfo.action = "<c:url value='/admin/contents/academy/injection/insertContents.do'/>";
	document.injectionContentsInfo.submit();
}


// 취소 클릭시 Injection 컨텐츠 화면으로
function goInjectionContentsList() {
	window.history.back();
	//location.href = "/admin/contents/anatomy/retrieveContentsList.do?menuId=AD030501";
}

function fnRetrieveLecturerInfo(id) {
	var lecturerId = id;
	
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
			
		},
	})
}

// ]]>
</script>

<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">YVOIRE Injection</h2>
	</header>
	
	<!-- [S] 게시물 등록 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/admin/contents/academy/injection/insertContents.do" name="injectionContentsInfo" id="injectionContentsInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
				<table class="default-table">
					<caption>YVOIRE Injection 입력</caption>
					<colgroup>
						<col style="width:30%;" />
						<col style="width:auto;" />
					</colgroup>
					
					<tbody>				
						<tr>
							<td id="title">category_code </td>
							<td>
								<select id="categoryCode" name="categoryCode">
									<option value=""> 카테고리를 반드시 선택하세요 </option>
									<c:forEach var="categoryCode" items="${categoryCodeList}" varStatus="status">
										<option value="<c:out value='${categoryCode.code}'/>"> <c:out value="${categoryCode.value}"/> </option>
						     		</c:forEach>
					     		</select>
					     				
							</td>
						</tr>
						
						<tr>
							<td id="title">title </td>
							<td>
								<input type="text" name="title" id="title" maxlength="50" placeholder ="Enter title" >
							</td>
						</tr>
						
						<tr>
							<td id="title">contents </td>
							<td>
								<input type="text" name="contents" id="contents" maxlength="50" placeholder ="Enter contents" >
							</td>
						</tr>
						
						<tr>
							<td id="title">thumbnail image</td>
							<td>
								<input type="file" id="uploadFile_1" name="uploadFile_1" class="Lbtn"  multiple="multiple">
							</td>
						</tr>
						<tr>
							<td id="title">upload file </td>
							<td>
								<input type="file" id="uploadFile_2" name="uploadFile_2" class="Lbtn"  multiple="multiple"> 
							 </td>
						</tr>
						
						<tr>
							<td id="title">reader_user_id </td>
							<td>
								<select id="readerUserId" name="readerUserId" onchange="fnRetrieveLecturerInfo(this.value)">
									<option value=""> 담당 강사를 반드시 선택하세요 </option>
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<option value="<c:out value='${result.readerUserId}'/>"> <c:out value="${result.nameLast} ${result.nameFirst} "/> </option>
						     		</c:forEach>
					     		</select>
					     				
							</td>
						</tr>
						
						<tr>
							<td id="title">surveyId </td>
							<td>
								<select id="surveyId" name="surveyId">
									<option value=""> 설문조사를 선택하세요 </option>
									<c:forEach var="survey" items="${surveyList}" varStatus="status">
										<option value="<c:out value='${survey.code}'/>"> <c:out value="${survey.value}"/> </option>
						     		</c:forEach>
					     		</select>
							</td>
						</tr>						
					</tbody>		
				</table>

				<div class="submit-area">
					<button type="button" class="sub-btn" onclick="goInjectionContentsList();">취소</button>
					<button type="submit" class="main-btn">등록</button>
				</div>
			</form>
		</div>
	</article>
	<!-- [E] 게시물 등록 -->
</section>

