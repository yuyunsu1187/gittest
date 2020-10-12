<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- [S] footer -->
<footer class="default-footer">
	<div class="menu-area">
		<strong class="logo-tit"><img src="/resource/images/common/layout/logo-footer-tit.png" alt="" /></strong>
		<nav class="menu-list">
			<ul>
				<li><a href="<c:url value='/terms.do'/>" class="menu-btn">Terms And Conditions</a></li>
				<li><a href="<c:url value='/privacy.do'/>" class="menu-btn">Privacy Policy</a></li>
				<li><button type="button" class="menu-btn" data-btn-style="modal" data-btn-key="sitemap">Site Map</button></li>
				<li><a href="#" class="menu-btn" onclick="fnMenu('FR130300', 'detail');">Contact Us</a></li>
				<li><a href="http://global.lgyvoire.com/news_list.jsp" target="_blank" class="menu-btn">Notice</a></li>
			</ul>
		</nav>
	</div>	
	<span class="copy">© LG Chem. ALL RIGHTS RESERVED.</span>
	<div class="form" data-mult-form="select-list">
		<button type="button" class="select-btn">Family site<i class="fas fa-angle-up"></i></button>
		<ul class="option-list">
			<li><a href="http://www.lg.co.kr/" target="_blank" class="link-btn">LG</a></li>
			<li><a href="https://www.lgchem.com/main/index" target="_blank" class="link-btn">LG Chem</a></li>
		</ul>
	</div>
</footer>
<!-- [E] footer -->