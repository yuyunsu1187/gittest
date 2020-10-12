<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * LG Chem YVOIRE Injection JSP
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
function fnDetail(listForm, seq, contentsId, categoryCode) {
	//console.log(typeof listForm);
	console.log(listForm);
	listForm.seq.value = seq;
	//listForm.contentsId.value = contentsId;
	listForm.categoryCode.value = categoryCode;
	console.log(listForm.categoryCode.value);
	listForm.action = "<c:url value='/contents/injection/retrieveContents.do'/>";
	listForm.submit();
   	//document.upperListForm.action = "<c:url value='/contents/anatomy/retrieveContents.do'/>";
   	//document.upperListForm.submit();
}
function changeTrColor(trObj, oldColor, newColor) {
	trObj.style.backgroundColor = newColor;
	trObj.onmouseout = function(){
		trObj.style.backgroundColor = oldColor;
	}
}

function fnlikeDislike(listForm, seq, contentsId) {
	console.log(listForm);
	listForm.seq.value = seq;
	listForm.contentsId.value = contentsId;
	
	console.log(listForm.seq.value);
	console.log(listForm.categoryCode.value);
	console.log(listForm.contentsId.value);
	
	$.ajax({
		url : "/contents/injection/updateLikeDislike.do",
		type : "post",
		dataType : "json",
		data : {"menuId" : listForm.menuId.value, "seq" : listForm.seq.value, "contentsId" : listForm.contentsId.value},
		success : function(data) {
			console.log("success");
			console.log(typeof data);
			console.log(data);
			console.log(data.dislikeYn);
			var dislikeYn = "";
			var contentsId = "";
			
			if (data.dislikeYn == "Y") {
				dislikeYn = data.dislikeYn + " -> Dislike";
			} else {
				dislikeYn = data.dislikeYn + " -> Like";
			}
			
			
			if (data.categoryCode == "01") {
				contentsId = "#u" + data.contentsId;
				console.log("contentsId : " + contentsId);
				$(contentsId).text(dislikeYn);
				console.log($(contentsId).text());
			} else if (data.categoryCode == "02") {
				contentsId = "#m" + data.contentsId;
				$(contentsId).text(dislikeYn);
			} else if (data.categoryCode == "03") {
				contentsId = "#l" + data.contentsId;
				$(contentsId).text(dislikeYn);
			} else {
				contentsId = "#e" + data.contentsId;
				$(contentsId).text(dislikeYn);
			}

		},
	})
}


//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>YVOIRE Injection</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Llast"><span>YVOIRE Injection</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
		<div id="LblockListTable01" class="LblockListTable" >
			<c:out value="${selectedCategoryCode}" />
			<div class="Lwrapper">
			<b><font size="4" color="gray">Upper Face</font></b>
			<form:form commandName="upperList" name="upperListForm" id="upperListForm" method="post">
			<input type="hidden" name="seq" id="seq" value="" />
			<input type="hidden" name="menuId" id="menuId" value="${param.menuId}" />
			<input type="hidden" name="categoryCode" id="categoryCode" value="" />
			<input type="hidden" name="contentsId" id="contentsId" value="" />
			<input type="hidden" name="mode" id="mode" value="" />
			
				<table summary="YVOIRE Injection Upper" style="font:100%/1.5em Gulim;">
					<caption>YVOIRE Injection Upper</caption>
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
							<th>생성 일자 & 파일 크기</th>
							<th>좋아요 유무</th>
							<th class="Llast">좋아요 이미지</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${upperList}" varStatus="status">
							<input type="hidden" name="fileName" value="${result.fileName}" />
							<input type="hidden" name="uploadFilePath" value="${result.filePath}" />
							<tr class="UpperLfirst">		
								<td class="Lfirst" onclick="javascript:fnDetail(document.getElementById('upperListForm'), ${result.seq}, ${result.contentsId}, ${result.categoryCode})" onMouseOver="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')" style="cursor:hand"><img src="${result.thumFilePath}" width=40px, height=30px  /></td>
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
								<td><c:out value="${result.createDate}" /> & <c:out value="${result.fileSize}" /></td>
								<td id="u${result.contentsId}">
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
									<button type="button" name="upperLikeYn" id="upperLikeYn" onclick="javascript:fnlikeDislike(document.getElementById('upperListForm'), ${result.seq}, ${result.contentsId})">좋아요</button>
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
						</c:forEach>
						<c:if test="${empty upperList && !empty input}">
							<tr id="empty" style="background-color: #FFFFFF">
								<td colspan="11"><spring:message code="dev.inf.com.nodata" /></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</form:form>
			</div>
			<br>
			
			<div class="Lwrapper">
			<b><font size="4" color="gray">Mid Face</font></b>
			<form:form commandName="midList" name="midListForm" id="midListForm" method="post">
			<input type="hidden" name="seq" id="seq" value="" />
			<input type="hidden" name="menuId" id="menuId" value="${param.menuId}" />
			<input type="hidden" name="categoryCode" id="categoryCode" value="" />
			<input type="hidden" name="contentsId" id="contentsId" value="" />
			<input type="hidden" name="mode" id="mode" value="" />
			
				<table summary="YVOIRE Injection Mid" style="font:100%/1.5em Gulim;">
					<caption>YVOIRE Injection Mid</caption>
					<thead>
						<tr>
							<th class="Lfirst">썸네일 이미지</th>
							<th>파일 경로</th>
							<th>파일 확장자</th>
							<th>강사 이름</th>
							<th>강사 이미지</th>
							<th>강사 경력</th>
							<th>컨텐츠 제목</th>
							<th>컨텐츠 내용</th>
							<th>생성 일자 & 파일 크기</th>
							<th>좋아요 유무</th>
							<th class="Llast">좋아요 이미지</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${midList}" varStatus="status">
							
							<input type="hidden" name="fileName" value="${result.fileName}" />
							<input type="hidden" name="uploadFilePath" value="${result.filePath}" />
							<tr class="MidLfirst">		
								<td class="Lfirst" onclick="javascript:fnDetail(document.getElementById('midListForm'), ${result.seq}, ${result.contentsId}, ${result.categoryCode})" onMouseOver="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')" style="cursor:hand"><img src="${result.thumFilePath}" width=40px, height=30px  /></td>
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
								<td><c:out value="${result.createDate}" /> & <c:out value="${result.fileSize}" /></td>
								<td id="m${result.contentsId}">
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "Y" }' >
											<c:out value="${result.dislikeYn}" /> -> Dislike 
									</c:if>
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "N" }' >
											<c:out value="${result.dislikeYn}" /> -> Like 
									</c:if>
								</td>
								<td>
									<button type="button" name="midLikeYnBtn" id="midLikeYnBtn" onclick="javascript:fnlikeDislike(document.getElementById('midListForm'), ${result.seq}, ${result.contentsId})">좋아요</button>								
									<!--  
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "Y" }' >
										<button type="button" name="midLikeYnBtn" id="midLikeYnBtn" onclick="javascript:fnlikeDislike(document.getElementById('midListForm'), ${result.seq}, ${result.contentsId})">좋아요</button>
									</c:if>
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "N" }' >
										<button type="button" name="midLikeYnBtn" id="midLikeYnBtn" onclick="javascript:fnlikeDislike(document.getElementById('midListForm'), ${result.seq}, ${result.contentsId})">좋아요</button> 
									</c:if>
									-->		
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty midList && !empty input}">
							<tr id="empty" style="background-color: #FFFFFF">
								<td colspan="11"><spring:message code="dev.inf.com.nodata" /></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</form:form>
			</div>
			<br>
			
			<div class="Lwrapper">
			<b><font size="4" color="gray">Low Face</font></b>
			<form:form commandName="lowList" name="lowListForm" id="lowListForm" method="post">
			<input type="hidden" name="seq" id="seq" value="" />
			<input type="hidden" name="menuId" id="menuId" value="${param.menuId}" />
			<input type="hidden" name="categoryCode" id="categoryCode" value="" />
			<input type="hidden" name="contentsId" id="contentsId" value="" />
			<input type="hidden" name="mode" id="mode" value="" />
			
				<table summary="YVOIRE Injection Low" style="font:100%/1.5em Gulim;">
					<caption>YVOIRE Injection Low</caption>
					<thead>
						<tr>
							<th class="Lfirst">썸네일 이미지</th>
							<th>파일 경로</th>
							<th>파일 확장자</th>
							<th>강사 이름</th>
							<th>강사 이미지</th>
							<th>강사 경력</th>
							<th>컨텐츠 제목</th>
							<th>컨텐츠 내용</th>
							<th>생성 일자 & 파일 크기</th>
							<th>좋아요 유무</th>
							<th class="Llast">좋아요 이미지</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${lowList}" varStatus="status">
							
							<input type="hidden" name="fileName" value="${result.fileName}" />
							<input type="hidden" name="uploadFilePath" value="${result.filePath}" />
							<tr class="LowLfirst">		
								<td class="Lfirst" onclick="javascript:fnDetail(document.getElementById('lowListForm'), ${result.seq}, ${result.contentsId}, ${result.categoryCode})" onMouseOver="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')" style="cursor:hand"><img src="${result.thumFilePath}" width=40px, height=30px  /></td>
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
								<td><c:out value="${result.createDate}" /> & <c:out value="${result.fileSize}" /></td>
								<td id="l${result.contentsId}">
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "Y" }' >
											<c:out value="${result.dislikeYn}" /> -> Dislike 
									</c:if>
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "N" }' >
											<c:out value="${result.dislikeYn}" /> -> Like 
									</c:if>
								</td>
								<td>
									<button type="button" name="lowLikeYnBtn" id="lowLikeYnBtn" onclick="javascript:fnlikeDislike(document.getElementById('lowListForm'), ${result.seq}, ${result.contentsId})">좋아요</button>
									<!--
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "Y" }' >
										<button type="button" name="lowLikeYnBtn" id="lowLikeYnBtn" onclick="javascript:fnlikeDislike(document.getElementById('lowListForm'), ${result.seq}, ${result.contentsId})">좋아요</button>
									</c:if>
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "N" }' >
										<button type="button" name="lowLikeYnBtn" id="lowLikeYnBtn" onclick="javascript:fnlikeDislike(document.getElementById('lowListForm'), ${result.seq}, ${result.contentsId})">좋아요</button> 
									</c:if>
									-->		
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty lowList && !empty input}">
							<tr id="empty" style="background-color: #FFFFFF">
								<td colspan="11"><spring:message code="dev.inf.com.nodata" /></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</form:form>
			</div>
			<br>
			

			<div class="Lwrapper">
			<b><font size="4" color="gray">Yvoire Exclusive</font></b>
			<form:form commandName="exclusiveList" name="exclusiveListForm" id="exclusiveListForm" method="post">
			<input type="hidden" name="seq" id="seq" value="" />
			<input type="hidden" name="menuId" id="menuId" value="${param.menuId}" />
			<input type="hidden" name="categoryCode" id="categoryCode" value="" />
			<input type="hidden" name="contentsId" id="contentsId" value="" />
			<input type="hidden" name="mode" id="mode" value="" />
			
				<table summary="YVOIRE Injection Exclusive" style="font:100%/1.5em Gulim;">
					<caption>YVOIRE Injection Exclusive</caption>
					<thead>
						<tr>
							<th class="Lfirst">썸네일 이미지</th>
							<th>파일 경로</th>
							<th>파일 확장자</th>
							<th>강사 이름</th>
							<th>강사 이미지</th>
							<th>강사 경력</th>
							<th>컨텐츠 제목</th>
							<th>컨텐츠 내용</th>
							<th>생성 일자 & 파일 크기</th>
							<th>좋아요 유무</th>
							<th class="Llast">좋아요 이미지</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${exclusiveList}" varStatus="status">
							
							<input type="hidden" name="fileName" value="${result.fileName}" />
							<input type="hidden" name="uploadFilePath" value="${result.filePath}" />
							<tr class="LowLfirst">		
								<td class="Lfirst" onclick="javascript:fnDetail(document.getElementById('exclusiveListForm'), ${result.seq}, ${result.contentsId}, ${result.categoryCode})" onMouseOver="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')" style="cursor:hand"><img src="${result.thumFilePath}" width=40px, height=30px  /></td>
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
								<td><c:out value="${result.createDate}" /> & <c:out value="${result.fileSize}" /></td>
								<td id="e${result.contentsId}">
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "Y" }' >
											<c:out value="${result.dislikeYn}" /> -> Dislike 
									</c:if>
									<c:if test='${not empty result.dislikeYn && result.dislikeYn eq "N" }' >
											<c:out value="${result.dislikeYn}" /> -> Like 
									</c:if>
								</td>
								<td>
									<button type="button" name="exclusiveLikeYnBtn" id="exclusiveLikeYnBtn" onclick="javascript:fnlikeDislike(document.getElementById('exclusiveListForm'), ${result.seq}, ${result.contentsId})">좋아요</button>
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty exclusiveList && !empty input}">
							<tr id="empty" style="background-color: #FFFFFF">
								<td colspan="11"><spring:message code="dev.inf.com.nodata" /></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</form:form>
			</div>
			
			
		</div>
		</div>

</div>