<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="lnb-menu" data-list-style="clfix">
	<ul data-menu-depth="2">
		<c:if test="${MenuInfoInterceptor_parentMenuId =='AD01'}">
			<li class="<c:if test="${MenuInfoInterceptor_mainMenuId =='AD0101'}">active</c:if>"><a href="<c:url value='/admin/user/manager/retrieveManagerList.do?menuId=AD010100'/>" class="menu-btn">관리자 관리</a></li>
			<li class="<c:if test="${MenuInfoInterceptor_mainMenuId =='AD0103'}">active</c:if>"><a href="<c:url value='/admin/user/user/retrieveUserList.do?menuId=AD010300'/>" class="menu-btn">사용자 관리</a></li>
			<li class="<c:if test="${MenuInfoInterceptor_mainMenuId =='AD0105'}">active</c:if>"><a href="<c:url value='/admin/user/inquiry/retrieveInquiryList.do?menuId=AD010500'/>" class="menu-btn">1:1 문의 관리</a></li>
		</c:if>
		<c:if test="${MenuInfoInterceptor_parentMenuId =='AD03'}">
			<li class="<c:if test="${MenuInfoInterceptor_mainMenuId =='AD0301'}">active</c:if>"><a href="<c:url value='/admin/contents/branding/retrieveContentsList.do?menuId=AD030100'/>" class="menu-btn">Branding Material</a></li>
			<li class="<c:if test="${MenuInfoInterceptor_mainMenuId =='AD0303'}">active</c:if>">
				<button type="button" class="menu-btn">Library</button>
				<ul data-menu-depth="3">
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030301'}">active</c:if>"><a href="<c:url value='/admin/contents/journal/retrieveContentsList.do?menuId=AD030301'/>" class="menu-btn">Journal</a></li>
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030303'}">active</c:if>"><a href="<c:url value='/admin/contents/scientific/retrieveContentsList.do?menuId=AD030303'/>" class="menu-btn">Scientific Data</a></l>
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030305'}">active</c:if>"><a href="<c:url value='/admin/contents/clinic/retrieveContentsList.do?menuId=AD030305'/>" class="menu-btn">Clinic Material</a></li>
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030307'}">active</c:if>"><a href="<c:url value='/admin/contents/partner/retrieveContentsList.do?menuId=AD030307'/>" class="menu-btn">For Partner</a></li>
				</ul>
			</li>
			<li class="<c:if test="${MenuInfoInterceptor_mainMenuId =='AD0305'}">active</c:if>">
				<button type="button" class="menu-btn">Academy</button>
				<ul data-menu-depth="3">
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030501'}">active</c:if>"><a href="<c:url value='/admin/contents/anatomy/retrieveContentsList.do?menuId=AD030501'/>" class="menu-btn">Anatomy</a></li>
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030503'}">active</c:if>"><a href="<c:url value='/admin/contents/injection/retrieveContentsList.do?menuId=AD030503'/>" class="menu-btn">YVOIRE Injection</a></li>
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030505'}">active</c:if>"><a href="<c:url value='/admin/contents/webinar/retrieveContentsList.do?menuId=AD030505'/>" class="menu-btn">Webinar Replay</a></li>
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030507'}">active</c:if>"><a href="<c:url value='/admin/contents/aesthetic/retrieveContentsList.do?menuId=AD030507'/>" class="menu-btn">Aesthetic School</a></li>
					<!-- <li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030509'}">active</c:if>"><a href="<c:url value='/admin/contents/module/retrieveContentsList.do?menuId=AD030509'/>" class="menu-btn">Module</a></li> -->
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030511'}">active</c:if>"><a href="<c:url value='/admin/contents/exercise/retrieveContentsList.do?menuId=AD030511'/>" class="menu-btn">YVOIRE Exercise</a></li>
				</ul>
			</li>	
			<li class="<c:if test="${MenuInfoInterceptor_mainMenuId =='AD0307'}">active</c:if>">
				<button type="button" class="menu-btn">News&Event</button>
				<ul data-menu-depth="3">
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030701'}">active</c:if>"><a href="<c:url value='/admin/contents/notice/retrieveContentsList.do?menuId=AD030701'/>" class="menu-btn">Notice</a></li>
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030703'}">active</c:if>"><a href="<c:url value='/admin/contents/event/retrieveContentsList.do?menuId=AD030703'/>" class="menu-btn">EVENT</a></li>
				</ul>
			</li>
			<li class="<c:if test="${MenuInfoInterceptor_mainMenuId =='AD0309'}">active</c:if>">
				<button type="button" class="menu-btn">설문관리</button>
				<ul data-menu-depth="3">
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030901'}">active</c:if>"><a href="<c:url value='/admin/contents/question/retrieveQuestionList.do?menuId=AD030901'/>" class="menu-btn">문항 관리</a></li>
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD030903'}">active</c:if>"><a href="<c:url value='/admin/contents/result/retrieveResultList.do?menuId=AD030903'/>" class="menu-btn">설문결과 관리</a></li>
				</ul>
			</li>
		</c:if>
		<c:if test="${MenuInfoInterceptor_parentMenuId =='AD05'}">
			<li class="<c:if test="${MenuInfoInterceptor_mainMenuId =='AD0501'}">active</c:if>">
				<button type="button" class="menu-btn">코드관리</button>
				<ul data-menu-depth="3">
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD050101'}">active</c:if>"><a href="<c:url value='/admin/system/group/retrieveGroupList.do?menuId=AD050101'/>" class="menu-btn">그룹 관리</a></li>
					<li class="<c:if test="${MenuInfoInterceptor_menuId =='AD050103'}">active</c:if>"><a href="<c:url value='/admin/system/detail/retrieveDetailList.do?menuId=AD050103'/>" class="menu-btn">상세 관리</a></li>
				</ul>
			</li>
			<li class="<c:if test="${MenuInfoInterceptor_mainMenuId =='AD0503'}">active</c:if>"><a href="<c:url value='/admin/system/log/retrieveLogList.do?menuId=AD050300'/>" class="menu-btn">LOG 관리</a></li>
		</c:if>	
	</ul>
</nav>