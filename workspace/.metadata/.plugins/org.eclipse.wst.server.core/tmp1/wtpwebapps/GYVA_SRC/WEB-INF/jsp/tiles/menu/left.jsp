<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<h1 class="logo-tit"><a href="/main.do" class="link-btn"><img src="/resource/images/common/layout/logo-tit.png" alt="LG chem : LG aesthetics" /></a></h1>

<form:form commandName="menuList" name="menuForm" id="menuForm" method="post">
	<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />
	<input type="hidden" name="menuId" id="menuId" value="" />
	<input type="hidden" name="modCode" id="modCode" value="" />
	<!-- [S] 왼쪽 메뉴 : 2depth 메뉴부터 리스트 노출 -->
	<!-- 활성화 : data-pop-action="active", 비활성화 : data-pop-action="disabled" -->
	<section class="sitemap-wrap" data-pop-action="disabled">
		<h2 class="sitemap-tit"><button type="button" class="sitemap-btn" data-btn-style="modal" data-btn-key="sitemap"><span class="blind">전체메뉴</span></button></h2>
		<div class="sitemap-area" data-type="toggle" data-toggle-action="menu" data-pop-key="sitemap">
			<button type="button" class="layerPop-close-btn" data-pop-btn="close"><span class="icon-close"></span></button>
			<ul class="menu-list" data-menu-depth="1">
				<li><a href="#" class="menu-btn" onclick="fnMenu('FR050100', 'list');">Branding Platform</a></li>
				<!-- 하위 메뉴가 있을 때 button 태그적용 -->
				<li>
					<button type="button" class="menu-btn">Medical Platform</button>
					<ul data-menu-depth="2">
						<li><a href="#" class="menu-btn" onclick="fnMenu('FR070100', 'list');">Journal</a></li>
						<li><a href="#" class="menu-btn" onclick="fnMenu('FR070300', 'list');">Scientific Data</a></li>
						<li><a href="#" class="menu-btn" onclick="fnMenu('FR070500', 'list');">Clinic Material</a></li>
						<c:if test="${userType != 'DR01'}">
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
		</div>
	</section>
	
	<nav class="gnb-menu" data-type="toggle" data-toggle-action="menu">
		<ul class="menu-list" data-menu-depth="1">
			<li <c:if test="${parentMenuId =='FR05'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR050100', 'list');">Branding Platform</a></li>
			<!-- 하위 메뉴가 있을 때 button 태그적용 -->
			<li <c:if test="${parentMenuId =='FR07'}">class="active"</c:if>>
				<button type="button" class="menu-btn">Medical Platform</button>
				<ul data-menu-depth="2">
					<li <c:if test="${menuId =='FR070100'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR070100', 'list');">Journal</a></li>
					<li <c:if test="${menuId =='FR070300'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR070300', 'list');">Scientific Data</a></li>
					<li <c:if test="${menuId =='FR070500'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR070500', 'list');">Clinic Material</a></li>
					<c:if test="${userType !='DR01'}">
						<li <c:if test="${menuId =='FR070700'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR070700', 'list');">For Partner</a></li>
					</c:if>
				</ul>
			</li>
			<c:if test="${userType != 'PT01'}">
				<li <c:if test="${parentMenuId =='FR09'}">class="active"</c:if>>
					<button type="button" class="menu-btn">Academy Platform</button>
					<ul data-menu-depth="2">
						<li <c:if test="${menuId =='FR090100'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR090100', 'list');">Anatomy</a></li>
						<li <c:if test="${menuId =='FR090300'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR090300', 'list');">YVOIRE Injection</a></li>
						<li <c:if test="${menuId =='FR090500'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR090500', 'list');">Webinar replay</a></li>
						<li><a href="#" class="menu-btn" onclick="fnAlert();">Aesthetic School</a></li>
						<li><a href="#" class="menu-btn" onclick="fnAlert();">Module</a></li>
						<li <c:if test="${menuId =='FR091100'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR091100', 'list');">YVOIRE Exercise</a></li>
					</ul>
				</li>
			</c:if>
			<li <c:if test="${parentMenuId =='FR11'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR110000', 'list');">Registration</a></li>
			<li <c:if test="${parentMenuId =='FR13'}">class="active"</c:if>>
				<button type="button" class="menu-btn">About Us</button>
				<ul data-menu-depth="2">
					<li <c:if test="${menuId =='FR130100'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR130100', 'detail');">Introduce</a></li>
					<li <c:if test="${menuId =='FR130300'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnMenu('FR130300', 'detail');">Contact</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<!-- [E] 왼쪽 메뉴 -->
	<!-- 디자인 수정사항 반영 : 인스타 그램 링크버튼 추가 -->
	<a href="https://www.instagram.com/yvoire.official/" class="instagram-link-btn" target="_blank"></a>
</form:form>