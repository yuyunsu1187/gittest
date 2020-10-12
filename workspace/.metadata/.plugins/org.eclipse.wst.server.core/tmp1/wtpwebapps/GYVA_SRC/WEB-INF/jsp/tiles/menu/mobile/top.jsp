<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="devonframe.gyva.common.user.model.User" %>

<script type="text/javascript" language="javascript">
//<![CDATA[
function fnAlert() {
	alert("Coming soon.");
}
function fnTopMenu(menuId, modCode) {
	document.topMenuForm.menuId.value = menuId;
	document.topMenuForm.modCode.value = modCode;
	document.topMenuForm.action = "<c:url value='/mypage.do'/>";
	document.topMenuForm.submit();	
}
function fnMenu(menuId, modCode) {
	document.menuForm.menuId.value = menuId;
	document.menuForm.modCode.value = modCode;
	document.menuForm.action = "<c:url value='/contents.do'/>";
	document.menuForm.submit();	
}
function fnLogout() {
	location.href="<c:url value='/logout.do'/>";
}
function fnTopSearch() {
	if(document.topSearchForm.keyWord.value == "") {
		alert("Please enter your search term.");
		return false;
	} else {
		document.topSearchForm.action = "<c:url value='/contents/searchList.do'/>";
		document.topSearchForm.submit();
	}
}
//]]>
</script>
<!-- [S] header -->
<header class="default-header">
	<h1 class="logo-tit"><a href="/" class="link-btn"><img src="/resource/images/common/layout/logo-tit.png" alt="LG chem : LG aesthetics" /></a></h1>
	
	<button type="button" class="history-btn" onclick="history.go(-1);"></button>
	<div class="form-area" data-type="toggle" data-toggle-action="curtain">
		<button type="button" class="search-btn"><i class="fab fa-sistrix"></i></button>
		<div class="form" data-mult-form="search">
			<form name="topSearchForm" id="topSearchForm" method="post">
				<input type="text" class="input-form" name="keyWord" id="keyWord" placeholder="Please enter a search word.">
				<button type="button" class="form-btn" onclick="fnTopSearch();return false;">search</button>
			</form>
		</div>
	</div>			
	<!-- 활성화 : data-pop-action="active", 비활성화 : data-pop-action="disabled" -->
	<section class="sitemap-wrap" data-pop-action="disabled">
		<h2 class="sitemap-tit"><button type="button" class="sitemap-btn" data-btn-style="modal" data-btn-key="sitemap"></button></h2>
		<div class="sitemap-area" data-type="toggle" data-toggle-action="menu" data-pop-key="sitemap">
			<button type="button" class="layerPop-close-btn" data-pop-btn="close"><span class="icon-close"></span></button>
			<form:form commandName="menuList" name="topMenuForm" id="topMenuForm" method="post">
				<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />
				<input type="hidden" name="menuId" id="menuId" value="" />
				<input type="hidden" name="modCode" id="modCode" value="" />
				<div class="member-info-area">
					<i class="member-profile"><img src="/resource/images/temp/@img-tem-profile.png" alt="" /></i>
					<strong class="member-name"><a href="#none" class="link-btn" onclick="fnTopMenu('FR030100', 'list');"><c:out value="${fullName}" /></a></strong>
					<p class="member-email"><c:out value="${email}" /></p>
					<button type="button" class="logout-sub-btn" onclick="fnLogout();">Logout</button>
				</div>
			</form:form>
			
			<form:form commandName="menuList" name="menuForm" id="menuForm" method="post">
				<input type="hidden" name="userId" id="userId" value="${userId}" />
				<input type="hidden" name="menuId" id="menuId" value="" />
				<input type="hidden" name="modCode" id="modCode" value="" />
				<ul class="menu-list" data-menu-depth="1">
					<li><a href="#" class="menu-btn" onclick="fnMenu('FR050100', 'list');">Branding Platform</a></li>
					<!-- 하위 메뉴가 있을 때 button 태그적용 -->
					<li>
						<button type="button" class="menu-btn">Medical Platform</button>
						<ul data-menu-depth="2">
							<li><a href="#" class="menu-btn" onclick="fnMenu('FR070100', 'list');">Journal</a></li>
							<li><a href="#" class="menu-btn" onclick="fnMenu('FR070300', 'list');">Scientific Data</a></li>
							<li><a href="#" class="menu-btn" onclick="fnMenu('FR070500', 'list');">Clinic Material</a></li>
							<c:if test="${userType !='DR01'}">
								<li><a href="#" class="menu-btn" onclick="fnMenu('FR070700', 'list');">For Partner</a></li>
							</c:if>
						</ul>
					</li>
					<c:if test="${userType != 'PT01'}">
						<li>
							<button type="button" class="menu-btn">Academy Platform</button>
							<ul data-menu-depth="2">
								<li><a href="#" class="menu-btn" onclick="fnMenu('FR090100', 'list');">Anatomy</a></li>
								<li><a href="#" class="menu-btn" onclick="fnMenu('FR090300', 'list');">YVOIRE Injection</a></li>
								<li><a href="#" class="menu-btn" onclick="fnMenu('FR090500', 'list');">Webinar replay</a></li>
								<li><a href="#" class="menu-btn" onclick="fnAlert();">Aesthetic School</a></li>
								<li><a href="#" class="menu-btn" onclick="fnAlert();">Module</a></li>
								<li><a href="#" class="menu-btn" onclick="fnMenu('FR091100', 'list');">YVOIRE Exercise</a></li>
							</ul>
						</li>
					</c:if>
					<li><a href="#" class="menu-btn" onclick="fnMenu('FR110000', 'list');">Registration</a></li>
					<li>
						<button type="button" class="menu-btn">About Us</button>
						<ul data-menu-depth="2">
							<li><a href="#" class="menu-btn" onclick="fnMenu('FR130100', 'detail');">Introduce</a></li>
							<li><a href="#" class="menu-btn" onclick="fnMenu('FR130300', 'detail');">Contact</a></li>
						</ul>
					</li>
				</ul>
			</form:form>
			<a href="https://www.instagram.com/yvoire.official/" class="instagram-link-btn" target="_blank"></a>
		</div>
	</section>
</header>
<!-- [E] header -->