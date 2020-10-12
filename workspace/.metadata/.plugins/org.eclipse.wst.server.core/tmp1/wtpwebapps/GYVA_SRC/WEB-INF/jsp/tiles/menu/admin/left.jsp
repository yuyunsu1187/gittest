<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<nav class="lnb-menu" data-list-style="clfix">
	<ul data-menu-depth="2">
		<c:if test="${parentMenuId =='AD01'}">
			<li <c:if test="${mainMenuId =='AD0101'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/admin/user/managerList.do', 'AD010100', 'list');">관리자 관리</a></li>
			<li <c:if test="${mainMenuId =='AD0103'}">class="active"</c:if>>
				<button type="button" class="menu-btn">사용자 관리</button>
				<ul data-menu-depth="3">
					<li <c:if test="${menuId =='AD010301'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/admin/user/user.do', 'AD010301', 'list');">사용자 정보조회</a></li>
					<li <c:if test="${menuId =='AD010303'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/admin/user/user.do', 'AD010303', 'list');">사용자 승인</a></li>
				</ul>
			</li>
			<li <c:if test="${mainMenuId =='AD0105'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/admin/user/helpdeskList.do', 'AD010500', 'list');">1:1 문의 관리</a></li>
		</c:if>
		<c:if test="${parentMenuId =='AD03'}">
			<li <c:if test="${mainMenuId =='AD0301'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030101', 'list');">Branding Platform</a></li>
			<li <c:if test="${mainMenuId =='AD0303'}">class="active"</c:if>>
				<button type="button" class="menu-btn">Medical Platform</button>
				<ul data-menu-depth="3">
					<li <c:if test="${menuId =='AD030301'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030301', 'list');">Journal</a></li>
					<li <c:if test="${menuId =='AD030303'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030303', 'list');">Scientific Data</a></l>
					<li <c:if test="${menuId =='AD030305'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030305', 'list');">Clinic Material</a></li>
					<li <c:if test="${menuId =='AD030307'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030307', 'list');">For Partner</a></li>
				</ul>
			</li>
			<li <c:if test="${mainMenuId =='AD0305'}">class="active"</c:if>>
				<button type="button" class="menu-btn">Academy Platform</button>
				<ul data-menu-depth="3">
					<li <c:if test="${menuId =='AD030501'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030501', 'list');">Anatomy</a></li>
					<li <c:if test="${menuId =='AD030503'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030503', 'list');">YVOIRE Injection</a></li>
					<li <c:if test="${menuId =='AD030505'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030505', 'list');">Webinar Replay</a></li>
					<li <c:if test="${menuId =='AD030507'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAlert();">Aesthetic School</a></li>
					<li <c:if test="${menuId =='AD030509'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAlert();">Module</a></li>
					<li <c:if test="${menuId =='AD030511'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030511', 'list');">YVOIRE Exercise</a></li>
				</ul>
			</li>	
			<li <c:if test="${mainMenuId =='AD0307'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030700', 'list');">Registration</a></li>
			<li <c:if test="${mainMenuId =='AD0309'}">class="active"</c:if>>
				<button type="button" class="menu-btn">설문관리</button>
				<ul data-menu-depth="3">
					<li <c:if test="${menuId =='AD030901'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030901', 'list');">문항 관리</a></li>
					<li <c:if test="${menuId =='AD030903'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/contents.do', 'AD030903', 'list');">설문결과 관리</a></li>
				</ul>
			</li>
		</c:if>
		<c:if test="${parentMenuId =='AD05'}">
			<li <c:if test="${mainMenuId =='AD0501'}">class="active"</c:if>>
				<button type="button" class="menu-btn">코드관리</button>
				<ul data-menu-depth="3">
					<li <c:if test="${menuId =='AD050101'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/admin/system/groupCodeList.do', 'AD050101', 'list');">그룹 관리</a></li>
					<li <c:if test="${menuId =='AD050103'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/admin/system/detailCodeList.do', 'AD050103', 'list');">상세 관리</a></li>
				</ul>
			</li>
			<li <c:if test="${mainMenuId =='AD0503'}">class="active"</c:if>><a href="#" class="menu-btn" onclick="fnAdminMenu('/admin/system/logList.do', 'AD050300', 'list');">LOG 관리</a></li>
		</c:if>	
	</ul>
</nav>