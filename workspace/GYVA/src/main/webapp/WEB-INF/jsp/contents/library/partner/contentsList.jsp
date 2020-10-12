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

<script type="text/javascript" language="javascript">
	//<![CDATA[
		
	// 글 리스트 조회
	function fnRetrieveList() {
		document.searchForm.action = "<c:url value='/contents/partner/retrieveContentsList.do'/>";
		document.searchForm.submit();
	}
	
	// 해당 파일 다운로드
	function fnDownload(index) {
		var app = document.getElementById("append");
		app.innerHTML = " : <input type=hidden class=Lcheckbox name=checkIndex id=checkIndex value="+ index +"><br>";
		
		document.listForm.action = "<c:url value='/function/filedownload/downloadFileList.do'/>";
		document.listForm.submit();
	}
	
	// 글 상세 페이지 화면으로 이동
	function goContentsDetail(num) {
		document.listForm.seq.value = num;
	   	document.listForm.action = "<c:url value='/contents/partner/retrieveContents.do'/>";
	   	document.listForm.submit();
	}
	
	// 글 작성 화면으로 이동
	function goContentsWrite() {
		document.listForm.action = "<c:url value='/admin/contents/library/partner/contentsWrite.do'/>";
		document.listForm.submit();
	}
	
	// 임시 스크립트
	function changeTrColor(trObj, oldColor, newColor) {
		trObj.style.backgroundColor = newColor;
		trObj.onmouseout = function(){
			trObj.style.backgroundColor = oldColor;
		}
	}
	
	//]]>
</script>


<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Distributor </h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Llast"><span>Distributor </span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
		<div id="LblockListTable01" class="LblockListTable" >
			<div class="Lwrapper">
				<form:form commandName="resultList" name="listForm" id="listForm" method="post">
					<input type="hidden" name="seq" id="seq" value="" />
					<input type="hidden" name="menuId" id="menuId" value="${param.menuId}" />
					<table summary="Distributor " style="font: 100%/1.5em Gulim;">
						<caption>Distributor</caption>
						<tbody>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<c:set var="index" value="${status.index}" />
								<c:if test='${index % 2 == 0}'>
									<input type="hidden" name="fileName" value="${result.fileName}" />
									<input type="hidden" name="uploadFilePath" value="${result.filePath}" />
									<div id="append"></div>
									<tr class="Lfirst">
										<td class="Lfirst" onclick="javascript:goContentsDetail(${result.seq})" onMouseOver="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')" style="cursor: hand">
										<img src="${result.thumFilePath}" width=40px, height=30px /></td>
										<td>
											<c:out value="${result.fileExtension}" /><br>
											<c:out value="${result.title}" /><br> 
											<c:out value="${result.contents}" /><br> 
											<c:out value="${result.createDate}" /> | <c:out value="${result.fileSize}" />MB<br> 
											<c:out value="${result.filePath}" /><br> 
										</td>
										<td class="Llast">
											<a class="Lbtn" href="#"><span onclick="fnDownload(${index});">다운</span></a>
										</td>
								</c:if>
								<c:if test='${index % 2 == 1}'>
									<input type="hidden" name="fileName" value="${result.fileName}" />
									<input type="hidden" name="uploadFilePath" value="${result.filePath}" />
									<div id="append"></div>
										<td class="Lfirst" onclick="javascript:goContentsDetail(${result.seq})" onMouseOver="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')" style="cursor: hand">
										<img src="${result.thumFilePath}" width=40px, height=30px /></td>
										<td>
											<c:out value="${result.fileExtension}" /><br>
											<c:out value="${result.title}" /><br> 
											<c:out value="${result.contents}" /><br> 
											<c:out value="${result.createDate}" /> | <c:out value="${result.fileSize}" />MB<br> 
											<c:out value="${result.filePath}" /><br> 
										</td>
										<td class="Llast">
											<a class="Lbtn" href="#"><span onclick="fnDownload(${index});">다운</span></a>
										</td>
									</tr>
								</c:if>
							</c:forEach>
							<c:if test="${empty resultList && !empty input}">
								<tr id="empty" style="background-color: #FFFFFF">
									<td colspan="5"><spring:message code="dev.inf.com.nodata" /></td>
								</tr>
							</c:if>
							<input type="button" value="Contents 작성" onclick="goContentsWrite()" />
						</tbody>
					</table>
				</form:form>
			</div>
		</div>
	</div>
</div>