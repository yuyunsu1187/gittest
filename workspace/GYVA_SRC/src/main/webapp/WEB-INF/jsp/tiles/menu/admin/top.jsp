<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="devonframe.gyva.common.user.model.User" %>
<script type="text/javascript" language="javascript">
//<![CDATA[
function fnAlert() {
	alert("준비 중 입니다.");
}
function fnAdminMenu(action, menuId, modCode) {
	document.menuForm.menuId.value = menuId;
	document.menuForm.modCode.value = modCode;
	document.menuForm.action = action;
	document.menuForm.submit();	
}
function fnMenu(menuId, modCode) {
	document.menuForm.menuId.value = menuId;
	document.menuForm.modCode.value = modCode;
	document.menuForm.action = "<c:url value='/contents.do'/>";
	document.menuForm.submit();	
}
//]]>
</script>
<header class="default-header">
	<h1 class="logo-tit"><a href="<c:url value="/main.do"/>" class="link-btn"><img src="/resource/images/common/layout/logo-tit.png" alt="LG chem : LG aesthetics"></a></h1>
	<form:form commandName="menuList" name="menuForm" id="menuForm" method="post">
		<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />
		<input type="hidden" name="menuId" id="menuId" value="" />
		<input type="hidden" name="modCode" id="modCode" value="" />

		<nav class="gnb-menu">
			<ul>
				<!-- 메뉴 선택 시 .active 추가 -->
				<li class="<c:if test="${parentMenuId =='AD01'}">active</c:if>"><a href="#" class="menu-btn" onclick="fnAdminMenu('/admin/user/managerList.do', 'AD010100', 'list');">사용자 관리</a></li>
				<li class="<c:if test="${parentMenuId =='AD03'}">active</c:if>"><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030101', 'list');">컨텐츠 관리</a></li>
				<li class="<c:if test="${parentMenuId =='AD05'}">active</c:if>"><a href="#" class="menu-btn" onclick="fnAdminMenu('/admin/system/groupCodeList.do', 'AD050101', 'list');">시스템 관리</a></li>
			</ul>
		</nav>
	
		<a href="<c:url value="/admin.do"/>" class="home-btn">Home</a>
		<a href="<c:url value="/main.do"/>" class="front-btn">Front</a>
		<a href="<c:url value="/logout.do"/>" class="logout-btn">LogOut</a>
	</form:form>
</header>