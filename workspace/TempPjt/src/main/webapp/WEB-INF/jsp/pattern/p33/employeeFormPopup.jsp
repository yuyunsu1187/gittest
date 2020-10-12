<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%--
/**
 *******************************************************************************
 * DevOn Framework Sample JSP
 * NAME : saveEmployeeFormPopup.jsp
 * DESC : 웹패턴 3-3 입력 / 수정 팝업
 * VER  : v1.0
 * Copyright 2012 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script>
//<![CDATA[
$("document").ready(function(event) {
	$("html").css("overflow", "hidden");
		fnComplete();
	})
function fnSave() {
	if (fnValidate($("#num"), "<spring:message code="dev.err.com.requiredSearchNum"/>")) return false;
	var url = "<c:url value="/pattern/p33/insertEmployee.do"/>";
	if ($("#updateNum").val().length > 0) {
		url = "<c:url value="/pattern/p33/updateEmployee.do"/>";
	}
	document.detailForm.action = url;
	document.detailForm.submit();
}
function fnValidate(object, message) {
	if (object.val() == "") {
		alert(message);
		$(object).focus();
		return true;
	}
	return false;
}
function fnCancel() {
	window.close();
}
function fnRetrieveDepartmentCodeList() {
	var ajax = new xui.ajax("<c:url value='/common/code/retrievedepartmentCodeList.do'/>");
	ajax.addQuery("codeGroup", document.detailForm.divisionCode.value);
	ajax.bind("departmentCode");
}
function fnComplete() {
	if ($("#mode").val() == "update") {
		var num = $("#updateNum").val();
		$(opener.location).attr("href", "javascript:fnDetail(" + num + ")");
		setTimeout("window.close()", 50);
	} else if ($("#mode").val() == "insert") {
		$(opener.location).attr("href", "<c:url value="/pattern/p33/retrieveEmployeeList.do"/>"+ "?skillCode=" + $("#skillCode").val()+ "&joblevelCode=" + $("#joblevelCode").val());
			setTimeout("window.close()", 50);
	}
}
//]]>
</script>
<div id="LblockPopupMain">

	<div id="LblockPageTitle">
		<h1><spring:message code="sample.office.employee.detailInfo" /></h1>
	</div>

	<div id="LblockMainBody">
		<div id="LblockDetail01" class="LblockDetail">
			<div>
				<div>
					<form:form commandName="result" name="detailForm" id="detailForm" method="post">
						<input type="hidden" id="updateNum" name="updateNum" value="${result.num}" />
						<input type="hidden" id="mode" name="mode" value="${param.mode}" />
						<table summary="<spring:message code="sample.office.employee.detailInfo"/>">
							<caption><spring:message code="sample.office.employee.detailInfo" /></caption>
							<tbody>
								<tr>
									<th><spring:message code="sample.office.employee.num" /></th>
									<td>
										<c:choose>
											<c:when test="${empty result.num}">
												<form:input path="num" id="num" cssClass="Ltext"  maxlength="10"/>
											</c:when>
											<c:when test="${!empty result.num}">
												<input name="num" type="hidden" value="${result.num}" /><c:out value="${result.num}" />
											</c:when>
										</c:choose>
									</td>
									<th><spring:message code="sample.office.employee.joblevel" /></th>
									<td>
										<form:select path="joblevelCode" id="joblevelCode">
											<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
											<form:options items="${joblevelCodeList}" itemValue="code" itemLabel="value" />
										</form:select><br />
									</td>
								</tr>
								<tr>
									<th><spring:message code="sample.office.employee.name" /></th>
									<td><form:input path="name" id="name" cssClass="Ltext" /></td>
									<th><spring:message code="sample.office.employee.department" /></th>
									<td>
										<form:select path="divisionCode" id="divisionCode" onchange="javascript:fnRetrieveDepartmentCodeList();return false;">
											<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
											<form:options items="${divisionCodeList}" itemValue="code" itemLabel="value" />
										</form:select>
										<form:select	path="departmentCode" id="departmentCode">
											<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
											<form:options items="${departmentCodeList}" itemValue="code" itemLabel="value" />
										</form:select><br />
									</td>
								</tr>
								<tr>
									<th><spring:message code="sample.office.employee.birthdate" /></th>
									<td><form:input path="birthdate" id="birthdate" cssClass="Ltext" size="8" maxlength="8" /><a href="#" onclick="dui.Calendar.open('birthdate'); return false;"><img class="Lbtn" src="<c:url value="/resource/images/btn_icon_calendar.gif"/>" alt="날짜" /></a></td>
									<th><spring:message code="sample.office.employee.gender" /></th>
									<td>
										<form:radiobutton path="sex" value="M" label="남" cssClass="Lradio" />
										<form:radiobutton path="sex" value="F" label="여" cssClass="Lradio" />
									</td>
								</tr>
								<tr>
									<th><spring:message code="sample.office.employee.ssn" /></th>
									<td><form:input path="ssn" id="ssn" cssClass="Ltext" maxlength="13" /></td>
									<th><spring:message code="sample.office.employee.telephone" /></th>
									<td><form:input path="telephone" id="telephone" cssClass="Ltext" maxlength="11" /></td>
								</tr>
								<tr>
									<th><spring:message code="sample.office.employee.postal" /></th>
									<td><form:input path="postal" id="postal" cssClass="Ltext" /></td>
									<th><spring:message code="sample.office.employee.skill" /></th>
									<td>
										<form:select path="skillCode" id="skillCode">
											<form:option value=""><spring:message code="common.label.defaultOption" /></form:option>
											<form:options items="${skillCodeList}" itemValue="code" 	itemLabel="value" />
										</form:select><br /> 
									</td>
								</tr>
								<tr>
									<th><spring:message code="sample.office.employee.address" /></th>
									<td colspan="3"><form:input path="address" id="address" cssClass="Ltext" size="80" maxlength="80" /></td>
								</tr>
							</tbody>
						</table>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<div id="LblockButton">
		<a class="Lbtn" href="#" onclick="fnCancel();return false;"><span><spring:message code="common.label.cancel" /></span></a>
		<a class="Lbtn" href="#" onclick="fnSave();return false;"><span><spring:message code="common.label.save" /></span></a>
	</div>
	
	
</div>