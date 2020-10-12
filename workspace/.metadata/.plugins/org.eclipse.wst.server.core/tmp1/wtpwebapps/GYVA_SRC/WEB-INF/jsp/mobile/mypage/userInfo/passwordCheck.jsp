<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript">

	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!document.userInfo.password.value) {
			alert("Please enter a password.");
			return false;
		}else{
			fnUserPwdCheck();
		}
	}

	$(document).ready(function() {
		if("${errorMsg}"!=""){
			alert("${errorMsg}");
		}
	});
 
	// 글 상세 페이지 화면으로 이동
	function fnUserPwdCheck() {
		document.userInfo.action = "<c:url value='/mypage/userInfo.do'/>";
		document.userInfo.submit();
	}
</script>
			
<section id="FR010503-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">My page</h2>
	</header>
	
	<div class="breadcrumb">
		<span class="home">home</span><span class="depth">My page</span><span class="page">Profile</span>
	</div>
	
	<!-- [S] tab wrap -->
	<div class="tab-wrap" data-type="tab" data-tab-division="link">
	<form:form commandName="resultList" name="userInfo" id="userInfo" method="post" >
		<input type="hidden" name="email" id="email" value="<c:out value='${email}'/>"/>
		<!-- [S] 프론트 모바일 탭 리스트 영역 -->
		<div class="form" data-mult-form="select-list" data-tab-area="tab-list">
			<button type="button" class="select-btn">Profile<i class="fas fa-angle-down"></i></button>
			<ul class="option-list">
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030100', 'list');">Recently viewed</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030300', 'list');">Profile</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030500', 'list');">Helpdesk</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030700', 'list');">Bookmark</a></li>
			</ul>
		</div>
		<!-- [E] 프론트 모바일 탭 리스트 영역 -->
		
		<article class="board-wrap" data-board-type="form-write">
			<h3 class="article-tit">Check Profile</h3>
			<p class="article-txt">Please enter your password again.</p>
			<!-- [S] 프론트 모바일 컨텐츠 영역 -->
			<div class="form-wrap">
				<ul class="form-area">
					<li>
						<label for="email" class="form-tit">Email address</label>
						<div class="form"><input type="text" class="input-form" value="<c:out value='${email}'/>" disabled /></div>
					</li>
					<li>
						<label for="password" class="form-tit">password</label>
						<div class="form" data-mult-form="password">
							<input type="password" name="password" id="ppassword" class="input-form" placeholder="Enter Password">
							<button type="button" class="icon-btn"><i class="far fa-eye"></i></button>
						</div>
					</li>
				</ul>
			</div>
			<!-- [E] 프론트 모바일 컨텐츠 영역 -->
			
			<div class="submit-area">
				<button type="button" class="main-btn" onclick="checkValue()">Confirm</button>
			</div>
		</article>
	</form:form>
	</div>
	<!-- [E] tab wrap -->
</section>
