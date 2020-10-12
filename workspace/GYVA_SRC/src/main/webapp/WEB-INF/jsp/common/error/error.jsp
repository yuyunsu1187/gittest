<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" isErrorPage="true"	session="false" %>


<%---------------------------------------------------------
    파일명 : error.jsp
    프로젝트명 : 이브아르 아카데미 프로젝트

    Copyright(c) 2012 LG CNS,  All rights reserved.

    설 명 : 본 화면은 일반적인 request 요청에 대한 에러메시지를 출력하는 화면입니다.
    작성자 : XXX팀 OOO
-------------------------------------------------------------%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<title>LG chem : LG aesthetics</title>

<c:if test="${deviceType!='mobile'}">
	<link rel="stylesheet" type="text/css" href="/resource/css/front/import.css" />
	<script type="text/javascript" src="/resource/js/front/ui.js"></script>	
</c:if>
<c:if test="${deviceType=='mobile'}">
	<link rel="stylesheet" type="text/css" href="/resource/css/mobile/import.css" />
	<script type="text/javascript" src="/resource/js/mobile/ui.js"></script>	
</c:if>
<script type="text/javascript" src="/resource/js/jquery/jquery-1.12.4.min.js"></script>	
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resource/js/libs/swiper-5.4.5.min.js"></script>	
</head>
<body>

	<section id="FR130101-15" class="error-section">
		<h1 class="error-tit">Not Found</h1>
		<span class="img-area"><img src="/resource/images/common/icon/icon-error.png" /></span>
		<p class="error-txt">The wrong approach.<br />The page you’re looking for can’t be found.</p>
		
		<div class="btn-area">
			<a href="<c:url value='/main.do' />" class="sub-btn">GO HOME</a>
			<a href="#" class="main-btn" onclick="history.go(-1);">GO BACK</a>
		</div>
	</section>
	<!-- [E] wrap -->
	
	<!-- [S : 20200924] 로딩이미지 -->
	<div class="loading-area" data-pop-action="active">
		<span class="img-area"><img src="/resource/images/common/contents/pc_Loading_200923.gif" alt="" /></span>
	</div>
	<!-- [E : 20200924] 로딩이미지 -->
	
</body>
</html>
