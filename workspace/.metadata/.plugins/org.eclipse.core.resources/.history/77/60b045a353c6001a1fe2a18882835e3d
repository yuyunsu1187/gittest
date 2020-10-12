<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeList.jsp
 * DESC : 페이지패턴(Map) Web 페이지 목록조회
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"  %>
<%@ page import="devonframe.sample.office.uipattern.employee.model.PagingEmployee" %>
<%@ page import="devonframe.paging.*" %>
<%@ page import="devonframe.paging.ui.*" %>
<%@ page import="devonframe.paging.PagingUtil" %>

<script type="text/javascript" language="javascript">
//<![CDATA[
function fnRetrieveList() {
	document.searchForm.action = "<c:url value="/pattern/mpp1/retrieveEmployeeList.do"/>";
	document.searchForm.submit();
}
function fnUpdate(value) {
    document.searchForm.num.value = value;
    document.searchForm.mode.value = "update";
	document.searchForm.action = "<c:url value="/pattern/mpp1/retrieveEmployeeForm.do"/>";
	document.searchForm.submit();
}
function fnAdd() {
    document.searchForm.mode.value = "insert";
	document.searchForm.action = "<c:url value="/pattern/mpp1/retrieveEmployeeForm.do"/>";
	document.searchForm.submit();
}
//]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>MPP1 Web Page</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Page Pattern(Map)</a></span></li>
				<li class="Llast"><span>MPP1 Web Page</span></li>
			</ul>
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
						    	<input type="hidden" id="mode" name="mode" />
						    	<input type="hidden" id="num" name="num" />
								<table summary="<spring:message code="sample.office.employee.empSearch"/>">
									<caption><spring:message code="sample.office.employee.empSearch"/></caption>
							        <colgroup>
							            <col style="width: 20%;" />
							            <col style="width: 30%;" />
							            <col style="width: 20%;" />
							            <col style="width: 30%;" />
							        </colgroup>
									<tbody>
									<tr>
										<th><spring:message code="sample.office.employee.skill"/></th>
										<td>
		                               		<select id="skillCode" name="skillCode">
												<option value=""><spring:message code="common.label.defaultOption" /></option>
		                                		<c:forEach items="${skillCodeList}" var="skill" >
		                                			<option value="${skill.code}" <c:if test="${input.skillCode == skill.code}">selected="selected"</c:if>><c:out value="${skill.value}"/></option>
		                                		</c:forEach>
		                                	</select>	
										</td>
										<th><spring:message code="sample.office.employee.joblevel"/></th>
										<td>
		                               		<select id="joblevelCode" name="joblevelCode">
		                               			<option value=""><spring:message code="common.label.defaultOption" /></option>
		                                		<c:forEach items="${joblevelCodeList}" var="joblevel" >
		                                			<option value="${joblevel.code}" <c:if test="${input.joblevelCode == joblevel.code}">selected="selected"</c:if>><c:out value="${joblevel.value}"/></option>
		                                		</c:forEach>
		                                	</select>	
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
					<table summary="<spring:message code="sample.office.employee.empList"/>">
						<caption>
							<spring:message code="sample.office.employee.empList" />
						</caption>
						<thead>
							<tr>
								<spring:message code="sample.office.employee.num"  var="numLable"/>
								<th class="Lfirst"><Tag:pagingSort title="${numLable}"  column="num" /></th>
								<th><spring:message code="sample.office.employee.name" /></th>
								<th><spring:message code="sample.office.employee.joblevel" /></th>
								<th><spring:message code="sample.office.employee.skill" /></th>
								<th><spring:message code="sample.office.employee.telephone" /></th>
								<th class="Llast"><spring:message code="sample.office.employee.birthdate" /></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr class="Lfirst">
									<td class="Lfirst"><a href="javascript:fnUpdate('<c:out value="${result.num}"/>')"><c:out value="${result.num}" /></a></td>
									<td><c:out value="${result.name}" /></td>
									<td><c:out value="${result.joblevelCodeName}" /></td>
									<td><c:out value="${result.skillCodeName}" /></td>
									<td><Tag:phone><c:out value="${result.telephone}" /></Tag:phone></td>
									<td class="Llast"><Tag:mask mask="####-##-##"><c:out value="${result.birthdate}" /></Tag:mask></td>
								</tr>
							</c:forEach>
							<c:if test="${empty resultList && !empty input}">
								<tr id="empty" style="background-color: #FFFFFF">
									<td colspan="6"><spring:message code="dev.inf.com.nodata" /></td>
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

	<div id="LblockButton">
	    <a class="Lbtn" href="#" onclick="fnAdd();return false"><span><spring:message code="common.label.create"/></span></a>
	</div>

</div>