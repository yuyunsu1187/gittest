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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"  %>
<%@ page import="devonframe.gyva.front.contents.model.Contents" %>
<%@ page import="devonframe.paging.*" %>
<%@ page import="devonframe.paging.ui.*" %>
<%@ page import="devonframe.paging.PagingUtil" %>

<script type="text/javascript" language="javascript">
//<![CDATA[
function fnRetrieveList() {
	document.searchForm.action = "<c:url value="/contents/notice/retrieveContentsList.do"/>";
	document.searchForm.submit();
}
function fnDetail(seq, contentsId) {
    document.searchForm.seq.value = seq;
    document.searchForm.contentsId.value = contentsId;
	document.searchForm.action = "<c:url value="/contents/notice/retrieveContents.do"/>";
	document.searchForm.submit();
}
//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>Notice</h1>
		</div>
	</div>

	<div id="LblockBodyMain">
		<Tag:paging resultList='${resultList}' >
		<Tag:pagingOut value="showJavaScript" />                    
	        <div id="LblockSearch">
	            <div>
	                <div>
	                    <div>
							<form name="searchForm" method="post" onsubmit="fnRetrieveList();return false;">
								<Tag:pagingAddHiddenParam  />
						    	<input type="hidden" id="seq" name="seq" />
						    	<input type="hidden" id="contentsId" name="contentsId" />
						    	<input type="hidden" id="menuId" name="menuId" value="${MenuInfoInterceptor_menuId}" />
								<table summary="<spring:message code="gyva.front.user.empSearch"/>">
									<caption><spring:message code="gyva.front.user.empSearch"/></caption>
							        <colgroup>
							            <col style="width: 20%;" />
							            <col style="width: 30%;" />
							            <col style="width: 20%;" />
							            <col style="width: 30%;" />
							        </colgroup>
									<tbody>
									<tr>
										<th><spring:message code="gyva.front.user.skill"/></th>
										<td>
		                               		<select id="categoryCode" name="categoryCode">
												<option value=""><spring:message code="common.label.defaultOption" /></option>
		                                		<c:forEach items="${categoryCode}" var="category" >
		                                			<option value="${category.code}" <c:if test="${input.categoryCode == category.code}">selected="selected"</c:if>><c:out value="${category.value}"/></option>
		                                		</c:forEach>
		                                	</select>	
										</td>
										<th><spring:message code="gyva.front.user.joblevel"/></th>
										<td>
		                               		<input type="text" class="Ltext" id="title" name=title value="${input.title}" />	
										</td>
									</tr>
									</tbody>
								</table>
								<input type="image" class="Limage" src="<c:url value="/resource/images/btn_search.gif"/>" alt="search button" />
							</form>
	                    </div>
	                </div>
	            </div>
	        </div>
	
			<div id="LblockListTable01" class="LblockListTable">
				<div class="Lwrapper">
					<div class="LblockListInfo">
						<span class="Ltotal"><Tag:pagingOut value="showCountFrame" /></span>
					</div>			
					<table summary="<spring:message code="gyva.front.user.empList"/>">
						<caption>
							<spring:message code="gyva.front.user.empList" />
						</caption>
				        <colgroup>
				            <col style="width: 20%;" />
				            <col style="*;" />
				            <col style="width: 20%;" />
				        </colgroup>
						<thead>
							<tr>
								<spring:message code="gyva.front.user.num"  var="numLable"/>
								<th class="Lfirst"><spring:message code="gyva.front.user.name" /></th>
								<th><spring:message code="gyva.front.user.name" /></th>
								<th class="Llast"><spring:message code="gyva.front.user.birthdate" /></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr class="Lfirst">
									<td class="Lfirst"><c:out value="${result.categoryName}" /></td>
									<td><a href="javascript:fnDetail('<c:out value="${result.seq}"/>', '<c:out value="${result.contentsId}"/>')"><c:out value="${result.title}" /></a></td>
									<td class="Llast"><Tag:mask mask="###########"><c:out value="${result.createDate}" /></Tag:mask></td>
								</tr>
							</c:forEach>
							<c:if test="${empty resultList && !empty input}">
								<tr id="empty" style="background-color: #FFFFFF">
									<td colspan="3"><spring:message code="dev.inf.com.nodata" /></td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<ul
					    <c:if test="${empty resultList}">style="display:none"</c:if>>
					    <Tag:pagingOut value='showMoveFirstPage' />
					    <Tag:pagingOut value='showMoveBeforePage' />
					    <Tag:pagingOut value='showIndex' />
					    <Tag:pagingOut value='showMoveNextPage' />
					    <Tag:pagingOut value='showMoveEndPage' />
					</ul>				
				</div>
			</div>
		</Tag:paging>
	</div>

</div>