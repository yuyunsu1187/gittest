<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<title>LG chem : LG aesthetics</title>
<link rel="stylesheet" type="text/css" href="/resource/css/mobile/import.css" />
<script type="text/javascript" src="/resource/js/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resource/js/libs/swiper-5.4.5.min.js"></script>
<script type="text/javascript" src="/resource/js/mobile/ui.js"></script>
</head>
<body>

	<section id="FR000000-05" class="default-section">
	
		<tiles:insertAttribute name="header" />				
			
		<article class="default-contents">
			<tiles:insertAttribute name="content" />
			<button type="button" class="gotop-btn" data-moving-type="target" data-moving-action="topMove"><i class="fas fa-angle-up"></i>TOP</button>
		</article>
		
		<tiles:insertAttribute name="footer" />
	
	</section>
	
	<div class="loading-area" data-pop-action="active">
		<span class="img-area"><img src="/resource/images/common/contents/m_Loading_200923.gif" alt="" /></span>
	</div>

</body>
</html>
