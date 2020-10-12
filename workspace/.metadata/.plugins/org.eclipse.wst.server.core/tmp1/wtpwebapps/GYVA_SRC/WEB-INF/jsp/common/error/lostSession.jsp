<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%---------------------------------------------------------
    파일명 : error.jsp
    프로젝트명 : 이브아르 아카데미 프로젝트

    Copyright(c) 2012 LG CNS,  All rights reserved.

    설 명 : 본 화면은 일반적인 request 요청에 대한 에러메시지를 출력하는 화면입니다.
    작성자 : XXX팀 OOO
-------------------------------------------------------------%>

<script>
	alert('사용자 정보를 찾을 수 없습니다. 로그인 페이지로 이동합니다.');
	var UserAgent = navigator.userAgent;
	if(UserAgent.match(/iPhone|iPod|iPad|iPad2|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || 
	   UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
		document.location = "<c:url value='/mobile/loginForm.do'/>";
	}else{
		document.location = "<c:url value='/loginForm.do'/>";
	}
</script>
			
<section id="FR130101-15" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">에러 페이지</h2>
	</header>
	
	<div class="breadcrumb">
		<span class="home">home</span><span class="depth">에러 페이지</span>
	</div>
	
	<div> 세션이 만료됐을 때 </div>
</section>

