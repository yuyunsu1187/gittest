<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : employeeForm.jsp
 * DESC : 페이지패턴(Map)  웹페이지 조회 / 삭제
 * VER  : v1.0
 * Copyright 2014 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javaScript" language="javascript">
//<![CDATA[
function fnSave() {
	if (!fnValidateRequired(document.detailForm.num, "<spring:message code="dev.warn.com.required3"/>")) return false;
	
	if(document.detailForm.mode.value == "insert") {
		document.detailForm.action = "<c:url value='/pattern/mpp1/insertEmployee.do'/>";
	}else{
		document.detailForm.action = "<c:url value='/pattern/mpp1/updateEmployee.do'/>";
	}
	document.detailForm.submit();
}
function fnRetrieveList() {
	document.detailForm.skillCode.value = '';
	document.detailForm.joblevelCode.value = '';
	document.detailForm.action = "<c:url value='/pattern/mpp1/retrieveEmployeeList.do'/>";
	document.detailForm.submit();
}
function fnRetrieveDepartmentCodeList() {
	var ajax = new xui.ajax("<c:url value='/common/code/map/retrievedepartmentCodeList.do'/>");
	ajax.addQuery("codeGroup",document.detailForm.divisionCode.value);
	ajax.bind("departmentCode");
}
// ]]>
</script>

<div id="LblockBody">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>PP1 Web Page</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Lfirst"><span><a href="#">HOME</a></span></li>
				<li><span><a href="#">UI Pattern</a></span></li>
				<li><span><a href="#">Page Pattern(Map)</a></span></li>
				<li class="Llast"><span>PP1 Web Page</span></li>
			</ul>
		</div>
	</div>

	<div id="LblockBodyMain">
		<div id="LblockDetail01" class="LblockDetail">
			<form  name="detailForm" method="post" onsubmit="fnRetrieveList();return false;">
				<input type="hidden" name="mode" value="${param.mode}"/>
				<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
					<caption><spring:message code="sample.office.employee.detailInfo" /></caption>
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: 20%;" />
						<col style="width: 15%;" />
						<col style="width: 50%;" />
					</colgroup>
					<tbody>
						<tr>
							<th><spring:message code="sample.office.employee.num" /></th>
							<td>
								<c:if test="${empty result.num}"><input type="text" class="Ltext" id="num" name="num" /></c:if>
							 	<c:if test="${!empty result.num}"><input type="hidden" class="Ltext" id="num" name="num" value="${result.num}" /> ${result.num}</c:if>
							 </td>
							<th><spring:message code="sample.office.employee.joblevel" /></th>
							<td>
							<select id="joblevelCode" id="joblevelCode" name="joblevelCode">
								<option value="">	<spring:message code="common.label.defaultOption" /></option>
								<c:forEach items="${joblevelCodeList}" var="joblevel">
									<option value="${joblevel.code}" <c:if test="${ joblevel.code == result.joblevelCode}">selected</c:if>>${joblevel.value}</option>
								</c:forEach>
							</select><br />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.name" /></th>
							<td><input type="text" class="Ltext" id="name" name="name" value="${result.name}" /></td>
							<th><spring:message code="sample.office.employee.department" /></th>
							<td>
								<select id="divisionCode" name="divisionCode" 	onchange="javascript:fnRetrieveDepartmentCodeList();return false;">
									<option value="">	<spring:message code="common.label.defaultOption" /></option>
									<c:forEach items="${divisionCodeList}" var="division">
										<option value="${division.code}" <c:if test="${ division.code == result.divisionCode}">selected</c:if>>${division.value}</option>
									</c:forEach>
								</select> 
								<select id="departmentCode" name="departmentCode">
									<option value="">	<spring:message code="common.label.defaultOption" /></option>
									<c:forEach items="${departmentCodeList}" var="department">	
										<option value="${department.code}" <c:if test="${ department.code == result.departmentCode}">selected</c:if>>${department.value}</option>
									</c:forEach>
								</select><br />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.birthdate" /></th>
							<td><input type="text" class="Ltext" id="birthdate" name="birthdate" value="${result.birthdate}" size="8" /><a href="#" onclick="dui.Calendar.open('birthdate'); return false;"><img class="Lbtn" src="<c:url value="/resource/images/btn_icon_calendar.gif"/>" alt="날짜" /></a></td>
							<th><spring:message code="sample.office.employee.gender" /></th>
							<td>
								<input type="radio" id="sex" name="sex" value="M" <c:if test="${result.sex == 'M'}">checked="checked"</c:if> checked="checked" />남
								<input type="radio" id="sex" name="sex" value="F" <c:if test="${result.sex == 'F'}">checked="checked"</c:if> />여
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.ssn" /></th>
							<td><input type="text" class="Ltext" id="ssn" name="ssn" value="${result.ssn}" maxlength="13" /></td>
							<th>전화번호</th>
							<td><input type="text" class="Ltext" id="telephone" name="telephone" value="${result.telephone}" maxlength="11" /></td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.postal" /></th>
							<td><input type="text" class="Ltext" id="postal" name="postal" value="${result.postal}" maxlength="6" /></td>
							<th><spring:message code="sample.office.employee.skill" /></th>
							<td>
								<select id="skillCode" name="skillCode">
									<option value=""><spring:message code="common.label.defaultOption" /></option>
									<c:forEach items="${skillCodeList}" var="skill">
										<option value="${skill.code}" <c:if test="${ skill.code == result.skillCode}">selected</c:if>>${skill.value}</option>
									</c:forEach>
								</select><br />
							</td>
						</tr>
						<tr>
							<th><spring:message code="sample.office.employee.address" /></th>
							<td colspan="3"><input type="text" class="Ltext" id="address" name="address" size="80" maxlength="80" value="${result.address}" /></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnSave();"><span><spring:message code="common.label.save"/></span></a>
		<a class="Lbtn" href="#" onclick="fnRetrieveList();"><span><spring:message code="common.label.cancel"/></span></a>
	</div>

</div>