<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="LblockLeft">
<div id="LblockLeftTitle">
	<h1>YVOIRE</h1>
</div>
<div id="LblockLeftMenu" class="LslideMenu">
	<ul>
		<li class="Lfirst LhasChild <c:if test="${MenuInfoInterceptor_parentMenuId =='FR05'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/branding/retrieveContentsList.do?menuId=FR050000'/>">Branding Material</a></span></li>
		<li class="Lfirst LhasChild <c:if test="${MenuInfoInterceptor_parentMenuId =='FR07'}">Lopen</c:if>"><span><a href="#">Library</a></span>
			<ul>
				<li class="Lfirst <c:if test="${MenuInfoInterceptor_menuId =='FR070100'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/journal/retrieveContentsList.do?menuId=FR070100'/>">Journal</a></span></li>
				<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menuId =='FR070300'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/scientific/retrieveContentsList.do?menuId=FR070300'/>">Scientific Data</a></span></li>
				<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menuId =='FR070500'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/clinic/retrieveContentsList.do?menuId=FR070500'/>">Clinic Material</a></span></li>
				<c:if test="${userType !='DR02'}">
				<li class="Llast <c:if test="${MenuInfoInterceptor_menuId =='FR070700'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/partner/retrieveContentsList.do?menuId=FR070700'/>">For Partner</a></span></li>
				</c:if>
			</ul>
		</li>
		<li class="Lfirst LhasChild <c:if test="${MenuInfoInterceptor_parentMenuId =='FR09'}">Lopen</c:if>"><span><a href="#">Academy</a></span>
			<ul>
				<li class="Lfirst <c:if test="${MenuInfoInterceptor_menuId =='FR090100'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/anatomy/retrieveContentsList.do?menuId=FR090100'/>">Anatomy</a></span></li>
				<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menuId =='FR090300'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/injection/retrieveContentsList.do?menuId=FR090300'/>">YVOIRE Injection</a></span></li>
				<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menuId =='FR090500'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/webinar/retrieveContentsList.do?menuId=FR090500'/>">Webinar Replay</a></span></li>
				<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menuId =='FR090700'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/aesthetic/retrieveContentsList.do?menuId=FR090700'/>">Aesthetic School</a></span></li>
				<!-- <li class="Lidx1 <c:if test="${MenuInfoInterceptor_menuId =='FR090900'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/module/retrieveContentsList.do?menuId=FR090900'/>">Module</a></span></li> -->
				<li class="Llast <c:if test="${MenuInfoInterceptor_menuId =='FR091100'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/exercise/retrieveContentsList.do?menuId=FR091100'/>">YVOIRE Exercise</a></span></li>
				
			</ul>
		</li>	
		<li class="Lfirst LhasChild <c:if test="${MenuInfoInterceptor_parentMenuId =='FR11'}">Lopen</c:if>"><span><a href="#">New&Event</a></span>
			<ul>
				<li class="Lfirst <c:if test="${MenuInfoInterceptor_menuId =='FR110100'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/notice/retrieveContentsList.do?menuId=FR110100'/>">Notice</a></span></li>
				<li class="Llast <c:if test="${MenuInfoInterceptor_menuId =='FR110300'}">Lcurrent</c:if>"><span><a href="<c:url value='/contents/event/retrieveContentsList.do?menuId=FR110300'/>">EVENT</a></span></li>
			</ul>
		</li>	
		<li class="Lfirst LhasChild <c:if test="${MenuInfoInterceptor_parentMenuId =='FR13'}">Lcurrent</c:if>"><span><a href="<c:url value='/main.do?menuId=FR130000'/>">About Us</a></span></li>	
	</ul>	
</div>
</div>