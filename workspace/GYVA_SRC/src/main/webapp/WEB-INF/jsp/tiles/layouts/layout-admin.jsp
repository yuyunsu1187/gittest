<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<!--  meta http-equiv="Cache-Control" content="no-cache; no-store; no-save" -->

<title><tiles:getAsString name="title"/></title>

<link rel="stylesheet" type="text/css" href="/resource/css/admin/import.css" />
<script type="text/javascript" src="/resource/js/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resource/js/libs/swiper-5.4.5.min.js"></script>
<script type="text/javascript" src="/resource/js/admin/ui.js"></script>
</head>
<body>

	<section class="default-section">
	
		<tiles:insertAttribute name="header" />		
		
		<article class="default-contents">
		
			<tiles:insertAttribute name="left" />
			
			<tiles:insertAttribute name="content" />
		
		</article>
	
	</section>
	
	<div class="loading-area" data-pop-action="active">
		<span class="img-area"><img src="/resource/images/common/contents/m_Loading_200923.gif" alt="" /></span>
	</div>

</body>
</html>
