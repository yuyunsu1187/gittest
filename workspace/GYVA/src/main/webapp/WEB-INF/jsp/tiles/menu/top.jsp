<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="devonframe.gyva.front.common.user.model.User" %>
<div id="LblockHeader">
<div id="LblockHeaderIn">
<div id="LblockTopLogo">
	<a href="<c:url value="/main.do"/>"><img src="<c:url value='/resource/images/topLogo.jpg'/>" alt="topLogo" /></a>
</div>

<div id="LblockSupportMenu">
	<ul>
		<li class="Lfirst"><a href="<c:url value="/main.do"/>">Home</a></li>
		<li class="Lidx1"><a href="<c:url value="/common/login/logout.do" />">Logout</a></li>
		<li class="Lidx1"><a href="/mypage/activity/retrieveContentsList.do?menuId=FR030100">My Page</a></li>
		<li class="Llast"><a href="#">Contact Us</a></li>
		<c:if test="${userType =='AD00' || userType =='AD01'}"><li class="Llast"><a href="<c:url value="/admin.do"/>">Admin</a></li></c:if>
	</ul>
</div>

<div id="LblockTotalSearch">
	<form method="get" action="">
		<label for="totalSearch">totalSearch:</label> <input id="totalSearch" type="text" class="Ltext" size="15" /><input type="image" class="Limage" src="<c:url value='/resource/images/totalSearch_btn.gif'/>" alt="검색" />
	</form>
</div>

</div>

</div>