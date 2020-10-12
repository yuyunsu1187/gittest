<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * LG Chem YVOIRE Academy JSP
 * NAME : contentsDetail.jsp
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
	
	function fnRetrieveList() {
		document.detailForm.action = "<c:url value='/contents/clinic/retrieveContentsList.do'/>";
		document.detailForm.submit();
	}
	
	function fnDownloadDetail(index) {
		$("input:checkbox[name=checkIndex]").prop("checked", false);	
		$("input:checkbox[id=checkIndex_"+index+"]").prop("checked", true);	
		
		document.detailForm.action = "<c:url value='/function/filedownload/downloadFileList.do'/>";
		document.detailForm.submit();
	}

	function goUpdateContents() {
		document.detailForm.action = "<c:url value='/admin/contents/library/clinic/updateContentsPage.do'/>";
		document.detailForm.submit();
	}
	
	function fnDeleteContents() {
		document.detailForm.action = "<c:url value='/admin/contents/library/clinic/deleteContents.do'/>";
		document.detailForm.submit();
	}
	
	function goBack(){
		window.history.back();
	}
	
	// ]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Clinic Material</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Llast"><span>Admin Clinic Material Detail</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">

		<div id="LblockListTable01" class="LblockListTable" >
			
			<div class="Lwrapper">
				<form:form commandName="resultList" name="detailForm" id="detailForm" method="post">
				<input type="text" name="seq" id="seq" value="${result.seq}" />
				<input type="text" name="menuId" id="menuId" value="${param.menuId}" />
				<input type="text" name="categoryCode" id="categoryCode" value="${result.categoryCode}" />
				<input type="text" name="contentsId" id="contentsId" value="${result.contentsId}" />
				<div width=0 height=0 style="visibility: hidden">
					<input type="checkbox" class="Lcheckbox" name="checkIndex" id="checkIndex_0" value="0" />
				</div>
				<input type="hidden" name="fileName" value="${result.fileName}" />
				<input type="hidden" name="uploadFilePath" value="${result.filePath}" />
					<table summary="Clinic Material Detail" style="font:100%/1.5em Gulim;">
						<caption>Clinic Material </caption>
						<thead>
							<tr>
								<th class="Lfirst">썸네일 이미지</th>
								<th>파일 확장자</th>
								<th>컨텐츠 제목</th>
								<th>안내 문구</th>
								<th>등록일자</th>
								<th>파일크기</th>
								<th>비고</th>
								<th class="Llast">파일다운로드버튼</th>
							</tr>
						</thead>
						<tbody>
							<tr class="Lfirst" >
								<td class="Lfirst"><img src="${result.thumFilePath}" width=40px, height=30px /></td>
								<td><c:out value="${result.fileExtension}" /></td>
								<td><c:out value="${result.title}" /></td>
								<td><c:out value="${result.contents}" /></td>
								<td><c:out value="${result.createDate}" /></td>
								<td><c:out value="${result.fileSize}" />MB</td>
								<td><c:out value="" /></td>
								<td class="Llast"><a class="Lbtn" href="#"><span onclick="fnDownloadDetail(0);">다운로드</span></a></td>
							</tr>
							<c:if test="${empty result && !empty input}">
								<tr id="empty" style="background-color: #FFFFFF">
									<td colspan="5"><spring:message code="dev.inf.com.nodata" /></td>
								</tr>
							</c:if>
						</tbody>
						<a class="Lbtn" href="#"><span onclick="goBack();">취소</span></a>
						<a class="Lbtn" href="#"><span onclick="goUpdateContents();">관리자용 수정</span></a>
						<a class="Lbtn" href="#"><span onclick="fnDeleteContents();">관리자용 삭제</span></a>
					</table>
				</form:form>
			</div>
		</div>
		</div>
</div>
