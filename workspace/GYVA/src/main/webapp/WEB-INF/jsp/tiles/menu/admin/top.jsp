<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="devonframe.gyva.front.common.user.model.User" %>
<header class="default-header">
	<h1 class="logo-tit"><a href="<c:url value="/main.do"/>" class="link-btn"><img src="/resource/images/admin/common/logo-tit.png" alt="YVOIRE" /></a></h1>

	<nav class="gnb-menu">
		<ul>
			<!-- 메뉴 선택 시 .active 추가 -->
			<li class="<c:if test="${MenuInfoInterceptor_parentMenuId =='AD01'}">active</c:if>"><a href="<c:url value='/admin/user/manager/retrieveManagerList.do?menuId=AD010100'/>" class="menu-btn">사용자 관리</a></li>
			<li class="<c:if test="${MenuInfoInterceptor_parentMenuId =='AD03'}">active</c:if>"><a href="<c:url value='/admin/contents/branding/retrieveContentsList.do?menuId=AD030000'/>" class="menu-btn">컨텐츠 관리</a></li>
			<li class="<c:if test="${MenuInfoInterceptor_parentMenuId =='AD05'}">active</c:if>"><a href="<c:url value='/admin/system/group/retrieveGroupList.do?menuId=AD050101'/>" class="menu-btn">시스템 관리</a></li>
		</ul>
	</nav>

	<a href="<c:url value="/admin.do"/>"><button type="button" class="home-btn">Home</button></a>
	<a href="<c:url value="/main.do"/>"><button type="button" class="front-btn">Front</button></a>
	<a href="<c:url value="/common/login/logout.do"/>"><button type="button" class="logout-btn">LogOut</button></a>
</header>