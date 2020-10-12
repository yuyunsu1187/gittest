<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" language="javascript">
//<![CDATA[
function fnRetrieveList() {
	document.searchForm.action = "<c:url value='/contents/anatomy/retrieveContentsList.do'/>";
	document.searchForm.submit();
}

function fnlikeDislike(listForm, seq, contentsId) {
	console.log(listForm);
	listForm.seq.value = seq;
	listForm.contentsId.value = contentsId;
	
	console.log(listForm.seq.value);
	console.log(listForm.categoryCode.value);
	console.log(listForm.contentsId.value);
	
	$.ajax({
		url : "/admin/contents/anatomy/updateLikeDislike.do",
		type : "post",
		dataType : "json",
		data : {"menuId" : listForm.menuId.value, "seq" : listForm.seq.value, "contentsId" : listForm.contentsId.value},
		success : function(data) {
			console.log(typeof data);
			console.log(data);
			console.log(data.dislikeYn);
			var dislikeYn = "";
			
			
			if (data.dislikeYn == "Y") {
				dislikeYn = data.dislikeYn + " -> Dislike";
			} else {
				dislikeYn = data.dislikeYn + " -> Like";
			}
			$("#likeYn").text(dislikeYn);

		},
	})
}

function fnDetail(contentsId, categoryCode, mode) {
	//console.log(typeof listForm);
	console.log(listForm);
	//listForm.contentsId.value = contentsId;
	listForm.categoryCode.value = categoryCode;
	
	if (mode == document.getElementById('smallest').value) {
		listForm.mode.value = 'previous';
	} else {
		listForm.mode.value = 'next';
	}
	
	listForm.action = "<c:url value='/admin/contents/anatomy/retrieveContents.do'/>";
	listForm.submit();
   	//document.upperListForm.action = "<c:url value='/contents/anatomy/retrieveContents.do'/>";
   	//document.upperListForm.submit();
}

function fnUpdate() {
	listForm.action = "<c:url value='/admin/contents/academy/anatomy/contentsUpdate.do'/>";
	listForm.submit();
}

function fnDelete() {
	listForm.action = "<c:url value='/admin/contents/academy/anatomy/deleteContents.do'/>";
	listForm.submit();
}

//취소 클릭시 Anatomy 컨텐츠 화면으로
function goAnatomyContentsList() {
	listForm.action = "<c:url value='/admin/contents/anatomy/retrieveContentsList.do'/>";
	listForm.submit();
}

//취소 클릭시 Anatomy 컨텐츠 화면으로
function showInfo(mode) {
	/* console.log(typeof document.listForm.a.value);
	console.log(document.listForm.a.value);
	
	console.log(typeof listForm.b.value);
	console.log(listForm.b.value);
	
	console.log(typeof listForm.c.value);
	console.log(listForm.c.value);
	
	console.log($("#next").val()); */
	
	if (mode == document.getElementById('smallest').value) {
		listForm.mode.value = 'previous';
	} else {
		listForm.mode.value = 'next';
	}
	
	console.log(listForm.mode.value);
}

//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Anatomy</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Llast"><span>Anatomy Detail</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
		<form:form commandName="resultList" name="listForm" id="listForm" method="post">
		<input type="hidden" name="seq" id="seq" value="" />
		<input type="hidden" name="menuId" id="menuId" value="${result.menuId}" />
		<input type="hidden" name="categoryCode" id="categoryCode" value="${result.categoryCode}" />
		<input type="hidden" name="contentsId" id="contentsId" value="${result.contentsId}" />
		<input type="hidden" name="mode" id="mode" value="" />
		<div id="LblockListTable01" class="LblockListTable" >
			
			<div class="Lwrapper">
			<b><font size="4" color="gray">Anatomy Detail</font></b>
				<table summary="Anatomy" style="font:100%/1.5em Gulim;">
					<caption>Anatomy</caption>
					<thead>
						<tr>
							<!-- 
							<th class="Lfirst">파일 확장자</th>
							<th>강사 이름</th>
							<th>컨텐츠 제목</th>
							<th>컨텐츠 내용</th>
							<th>생성 일자</th>
							<th class="Llast">파일 크기</th>
							 -->
							<th class="Lfirst">썸네일 이미지</th>
							<th>파일 경로</th>
							<th>파일 확장자</th>
							<th>강사 이름</th>
							<th>강사 이미지</th>
							<th>강사 경력</th>
							<th>컨텐츠 제목</th>
							<th>컨텐츠 내용</th>
							<th>생성 일자</th>
							<th>좋아요 유무</th>
							<th class="Llast">좋아요 이미지</th>
						</tr>
					</thead>
					<tbody>
						<input type="hidden" name="fileName" value="${result.fileName}" />
						<input type="hidden" name="uploadFilePath" value="${result.filePath}" />
						<tr class="Lfirst">		
								<td class="Lfirst"><img src="${result.thumFilePath}" width=40px, height=30px  /></td>
								<td><c:out value="${result.filePath}" /></td>								
								<td><c:out value="${result.fileExtension}" /></td>
								<td><c:out value="${result.lecturerName}" /></td>
								<td><img src="${result.lecturerImgPath}" width=40px, height=30px  /></td>
								<td>
									<c:out value="${result.career1}" />
									<br>
									<c:out value="${result.career2}" />
									<br>
									<c:out value="${result.career3}" />
								</td>
								<td><c:out value="${result.title}" /></td>
								<td><c:out value="${result.contents}" /></td>
								<td><c:out value="${result.createDate}" /></td>
								<td id="likeYn">
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "Y" }' >
											<c:out value="${result.dislikeYn}" /> -> Dislike 
									</c:if>
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "N" }' >
											<c:out value="${result.dislikeYn}" /> -> Like 
									</c:if>
									<c:if test='${empty result.dislikeYn}' >
											
									</c:if>
								</td>
								<td>
									<button type="button" name="detailLikeYn" id="detailLikeYn" onclick="javascript:fnlikeDislike(document.getElementById('listForm'), ${result.seq}, ${result.contentsId})">좋아요</button>
									<!--
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "Y" }' >
										<button type="button" name="upperLikeYn" id="upperLikeYn" onclick="javascript:fnlikeDislike(document.getElementById('upperListForm'), ${result.seq}, ${result.contentsId})">좋아요</button>
									</c:if>
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "N" }' >
										<button type="button" name="upperLikeYn" id="upperLikeYn" onclick="javascript:fnlikeDislike(document.getElementById('upperListForm'), ${result.seq}, ${result.contentsId})">좋아요</button> 
									</c:if>
									-->		
								</td>
							</tr>
						<c:if test="${empty result && !empty input}">
							<tr id="empty" style="background-color: #FFFFFF">
								<td colspan="9"><spring:message code="dev.inf.com.nodata" /></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<br>
		</div>
		
		<fmt:parseNumber value = "${result.contentsId}" var = "conId"/>
		<fmt:parseNumber value = "${smallestContentsId}" var = "small"/>
		<fmt:parseNumber value = "${biggestContentsId}" var = "big"/>
		
		<c:if test="${conId > small}">
			<input type="button" name="previous" id="previous" value="Previous" onclick="javascript:fnDetail(${result.contentsId}, ${result.categoryCode}, ${small})" />  
	<!--	<button type="button" name="previous" id="previous"  value="previous" onclick="javascript:fnDetail(${result.contentsId}, ${result.categoryCode}, document.getElementById('previous').value)">Previous</button>  -->
		</c:if>
		
		<c:if test="${conId < big}">
	 		<input type="button" name="next" id="next" value="Next" onclick="javascript:fnDetail(${result.contentsId}, ${result.categoryCode}, ${big})" />
	<!--	<button type="button" name="next" id="next"  value="next" onclick="javascript:fnDetail(${result.contentsId}, ${result.categoryCode}, document.getElementById('next').value)">Next</button>  -->
		</c:if>
		
		<input type="button" value="List" onclick="goAnatomyContentsList()" />
		<input type="button" value="삭제" onclick="fnDelete()" />
		<input type="button" value="수정" onclick="fnUpdate()" />
		<input type="button" value="데이터타입" onclick="javascript:showInfo(${small})" />
		
		<input type="hidden" name="a" id="a" value="${conId}" />
		<input type="hidden" name="smallest" id="smallest" value="${small}" />
		<input type="hidden" name="biggest" id="biggest" value="${big}" />
		
		${result.contentsId} & ${smallestContentsId} & ${biggestContentsId}
		
		</form:form>
		</div>

</div>