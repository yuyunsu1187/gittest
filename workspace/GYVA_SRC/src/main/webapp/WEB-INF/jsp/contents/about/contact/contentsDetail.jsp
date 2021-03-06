<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%--
/**
 *******************************************************************************
 * LG Chem YVOIRE Academy JSP
 * NAME : contentsDetail.jsp
 * DESC : 컨텐츠 페이지 조회
 * VER  : v1.0
 * Copyright 2020 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script type="text/javaScript" language="javascript">
	//<![CDATA[
	
	// ]]>
</script>	

<section id="FR110101-10" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Contact</h2>
	</header>
	
	<div class="breadcrumb">
		<span class="home">home</span><span class="depth">About Us</span><span class="page">Contact</span>
	</div>
	
	<div class="contact-wrap">
		<div class="contact-area" data-offset="left">
			<strong class="tit">We are happy to answer you inquiry :)</strong>
			<p class="txt">Your inquiry will be sent responded in a few days.<br />Please check the email account that you provided, accordingly</p>
			<a href="mailto:yvoire@lgchem.com" class="email-btn"><span><em>contact</em>yvoire@lgchem.com</span></a>
			<span class="img-area"><img src="/resource/images/front/contents/img-contact-00.png" alt="" /></span>
		</div>
		
		<div class="form-wrap" data-offset="right">
			<ul class="form-area">
				<li>
					<label for="title" class="form-tit" data-text-style="essential">Title</label>
					<div class="form"><input type="text" class="input-form" id="title" placeholder="Title"/></div>
				</li>
				<li>
					<label for="email" class="form-tit" data-text-style="essential">Your Inquiry</label>
					<div class="form" data-mult-form="comment"><textarea class="input-form" placeholder="Please enter your answer."></textarea></div>
				</li>
				<li>
					<label for="upLoadFile" class="form-tit" data-text-style="essential">Select file</label>
					<div class="form" data-mult-form="file">
						<input type="text" class="input-form">
						<input type="file" class="file-form" name="upLoadFile" id="upLoadFile">
						<label for="upLoadFile" class="file-label">Select file</label>
					</div>
				</li>
			</ul>
			<div class="submit-area">
				<button type="submit" class="main-btn">Submit</button>
			</div>
		</div>
	</div>
	
</section>