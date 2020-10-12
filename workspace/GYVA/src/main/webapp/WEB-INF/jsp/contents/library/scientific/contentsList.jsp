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
		document.searchForm.action = "<c:url value='/contents/scientific/retrieveContentsList.do'/>";
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
	   	document.listForm.action = "<c:url value='/contents/scientific/retrieveContents.do'/>";
	   	document.listForm.submit();
	}

	// 글 작성 화면으로 이동
	function goContentsWrite() {
		document.listForm.action = "<c:url value='/admin/contents/library/scientific/contentsWrite.do'/>";
		document.listForm.submit();
	}
	
	//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Scientific Data</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Llast"><span>Scientific Data</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">

		<div id="LblockListTable01" class="LblockListTable" >
			
			<div class="Lwrapper">
				<form:form commandName="resultList" name="listForm" id="listForm" method="post">
					<input type="hidden" name="seq" id="seq" value="" />
					<input type="hidden" name="menuId" id="menuId" value="${param.menuId}" />
					<table summary="Journal" style="font:100%/1.5em Gulim;">
						<caption>Journal</caption>
						<tbody>
	
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<c:set var="index" value="${status.index}" />
								<input type="hidden" name="fileName" value="${result.fileName}" />
								<input type="hidden" name="uploadFilePath" value="${result.filePath}" />
								<div id="append" ></div>
									<c:if test='${index % 4 == 0}' >
										<tr class="Lfirst">
										<td class="Lfirst">
											<img src="${result.thumFilePath}" width=40px, height=30px onclick="javascript:goContentsDetail(${result.seq})" onMouseOver="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')" style="cursor: hand"/><br>
											<c:out value="${result.contents}" /><br> 
											<c:out value="${result.keyword1}" /><c:out value="${result.keyword2}" />
											<a class="Lbtn" href="#"><span onclick="fnDownload(${index});" style="cursor:hand">다운</span></a><br> 
											<c:out value="${result.contentsUrl}" /><br>
										</td>
									</c:if>
									<c:if test='${index % 4 == 1}' >
										<td class="Lfirst">
											<img src="${result.thumFilePath}" width=40px, height=30px onclick="javascript:goContentsDetail(${result.seq})" onMouseOver="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')" style="cursor: hand"/><br>
											<c:out value="${result.contents}" /><br> 
											<c:out value="${result.keyword1}" /><c:out value="${result.keyword2}" />
											<a class="Lbtn" href="#"><span onclick="fnDownload(${index});" style="cursor:hand">다운</span></a><br> 
											<c:out value="${result.contentsUrl}" /><br>
										</td>
									</c:if>
									<c:if test='${index % 4 == 2}' >
										<td class="Lfirst">
											<img src="${result.thumFilePath}" width=40px, height=30px onclick="javascript:goContentsDetail(${result.seq})" onMouseOver="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')" style="cursor: hand"/><br>
											<c:out value="${result.contents}" /><br> 
											<c:out value="${result.keyword1}" /><c:out value="${result.keyword2}" />
											<a class="Lbtn" href="#"><span onclick="fnDownload(${index});" style="cursor:hand">다운</span></a><br> 
											<c:out value="${result.contentsUrl}" /><br>
										</td>
									</c:if>
									<c:if test='${index % 4 == 3}' >
										<td class="Lfirst">
											<img src="${result.thumFilePath}" width=40px, height=30px onclick="javascript:goContentsDetail(${result.seq})" onMouseOver="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')" style="cursor: hand"/><br>
											<c:out value="${result.contents}" /><br> 
											<c:out value="${result.keyword1}" /><c:out value="${result.keyword2}" />
											<a class="Lbtn" href="#"><span onclick="fnDownload(${index});" style="cursor:hand">다운</span></a><br> 
											<c:out value="${result.contentsUrl}" /><br>
										</tr>
										</td>
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